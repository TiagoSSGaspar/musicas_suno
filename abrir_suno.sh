#!/bin/zsh
# =============================================================
# abrir_suno.sh — Automação para preencher campos no Suno
# Abre cada música no Chrome e preenche título, letras e estilo
# =============================================================
setopt NO_NOMATCH  # Evita erro quando glob não encontra nada

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
OPEN_SUNO="$BASE_DIR/open_suno.txt"

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

# Limpeza automática
rm -f /tmp/suno_inject_* 2>/dev/null
trap 'rm -f /tmp/suno_inject_* 2>/dev/null' EXIT INT TERM

# ── Verifica open_suno.txt ──────────────────────────────────────
if [ ! -f "$OPEN_SUNO" ]; then
  echo "${RED}❌ Arquivo open_suno.txt não encontrado em $BASE_DIR${NC}"
  exit 1
fi

echo "${CYAN}🎵 Suno Auto-Fill — Selecione a pasta${NC}"
echo ""

# ── Lista pastas disponíveis ────────────────────────────────────
FOLDERS=()
i=1
for dir in "$BASE_DIR"/*/; do
  dirname=$(basename "$dir")
  txt_count=$(find "$dir" -maxdepth 1 -name "*.txt" 2>/dev/null | wc -l | xargs)
  if [ "$txt_count" -gt 0 ]; then
    FOLDERS+=("$dirname")
    echo "  ${GREEN}[$i]${NC} $dirname  ${YELLOW}($txt_count músicas)${NC}"
    i=$((i + 1))
  fi
done

if [ ${#FOLDERS[@]} -eq 0 ]; then
  echo "${RED}❌ Nenhuma pasta com arquivos .txt encontrada.${NC}"
  exit 1
fi

echo ""
read "choice?👉 Selecione o número da pasta: "

if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt ${#FOLDERS[@]} ]; then
  echo "${RED}❌ Opção inválida.${NC}"
  exit 1
fi

SELECTED_FOLDER="${FOLDERS[$choice]}"
FOLDER_PATH="$BASE_DIR/$SELECTED_FOLDER"

echo ""
echo "${CYAN}📂 Pasta selecionada: ${GREEN}$SELECTED_FOLDER${NC}"
echo ""

# ── Função para encontrar URL pelo gênero (usa grep -i) ────────
find_url() {
  local genre="$1"
  # Tenta match case-insensitive direto no arquivo
  local matched_line
  matched_line=$(grep -i "^${genre}" "$OPEN_SUNO" 2>/dev/null | head -1)
  if [ -z "$matched_line" ]; then
    matched_line=$(grep -i "${genre}" "$OPEN_SUNO" 2>/dev/null | head -1)
  fi
  if [ -n "$matched_line" ]; then
    echo "$matched_line" | sed 's/.*=> //' | xargs
    return 0
  fi
  return 1
}

# ── Função para preencher via JS no Chrome ──────────────────────
fill_suno() {
  local url="$1"
  local lyrics_b64="$2"
  local style_b64="$3"
  local title_b64="$4"

  # Abre URL no Chrome
  osascript -e 'tell application "Google Chrome" to activate' 2>/dev/null
  osascript -e "tell application \"Google Chrome\" to open location \"$url\"" 2>/dev/null

  echo "  ⏳ Aguardando página carregar..."
  sleep 12

  # Escreve o JS num arquivo temporário
  local JS_FILE="/tmp/suno_inject_$$.js"
  rm -f "$JS_FILE" 2>/dev/null

  cat > "$JS_FILE" << 'JSHEADER'
(function() {
  function b64decode(str) {
    try {
      return decodeURIComponent(atob(str).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
      }).join(''));
    } catch(e) {
      return atob(str);
    }
  }
JSHEADER

  # Insere as variáveis base64 (só A-Za-z0-9+/= — seguro)
  echo "  var lyrics = b64decode('${lyrics_b64}');" >> "$JS_FILE"
  echo "  var style = b64decode('${style_b64}');" >> "$JS_FILE"
  echo "  var title = b64decode('${title_b64}');" >> "$JS_FILE"

  cat >> "$JS_FILE" << 'JSFOOTER'

  var textareas = document.querySelectorAll('textarea');
  var titleInput = document.querySelector('input[placeholder*="Song Title"]');
  var nativeTextareaSetter = Object.getOwnPropertyDescriptor(window.HTMLTextAreaElement.prototype, 'value').set;
  var nativeInputSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
  var results = [];

  if (titleInput) {
    nativeInputSetter.call(titleInput, title);
    titleInput.dispatchEvent(new Event('input', { bubbles: true }));
    titleInput.dispatchEvent(new Event('change', { bubbles: true }));
    results.push('titulo:OK');
  } else {
    results.push('titulo:NOT_FOUND');
  }

  if (textareas.length >= 1) {
    nativeTextareaSetter.call(textareas[0], lyrics);
    textareas[0].dispatchEvent(new Event('input', { bubbles: true }));
    textareas[0].dispatchEvent(new Event('change', { bubbles: true }));
    results.push('letra:OK');
  } else {
    results.push('letra:NOT_FOUND');
  }

  if (textareas.length >= 2) {
    nativeTextareaSetter.call(textareas[1], style);
    textareas[1].dispatchEvent(new Event('input', { bubbles: true }));
    textareas[1].dispatchEvent(new Event('change', { bubbles: true }));
    results.push('estilo:OK');
  } else {
    results.push('estilo:NOT_FOUND');
  }

  return results.join(' | ');
})();
JSFOOTER

  # Lê o JS do arquivo e executa no Chrome (com timeout de 15s)
  local result
  result=$(osascript -e "
set jsCode to do shell script \"cat ${JS_FILE}\"
tell application \"Google Chrome\"
  with timeout of 15 seconds
    tell active tab of front window
      execute javascript jsCode
    end tell
  end timeout
end tell
" 2>&1)

  rm -f "$JS_FILE" 2>/dev/null
  echo "$result"
}

# ── Processa cada arquivo ───────────────────────────────────────
file_count=0
total_files=$(find "$FOLDER_PATH" -maxdepth 1 -name "*.txt" | wc -l | xargs)

for file in "$FOLDER_PATH"/*.txt; do
  [ ! -f "$file" ] && continue
  file_count=$((file_count + 1))
  filename=$(basename "$file" .txt)

  echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo "${GREEN}🎶 [$file_count/$total_files] $filename${NC}"

  # ── Parsing por marcadores ──
  GENRE_KEYWORD=$(grep -m1 "^MÚSICA" "$file" | sed 's/.*— //' | awk '{print $1}')
  TITLE=$(grep -m1 "🔥 Título:" "$file" | sed 's/.*Título: //')
  STYLE=$(awk '/🎵 Prompt Suno:/{getline; print; exit}' "$file")
  LYRICS=$(awk '/📝 Letra:/{found=1; next} /#️⃣ Hashtags:/{found=0} found' "$file" | sed '/./,$!d')

  # Encontra URL
  MATCHED_URL=$(find_url "$GENRE_KEYWORD")

  if [ -z "$MATCHED_URL" ]; then
    echo "${RED}  ⚠️  Gênero '$GENRE_KEYWORD' não encontrado em open_suno.txt — pulando${NC}"
    continue
  fi

  echo "  🏷️  Título: ${YELLOW}$TITLE${NC}"
  echo "  📂 Gênero: ${YELLOW}$GENRE_KEYWORD${NC}"
  echo "  🎨 Estilo: ${YELLOW}$STYLE${NC}"
  echo "  🔗 URL: $MATCHED_URL"
  echo ""

  # Codifica em base64
  LYRICS_B64=$(printf '%s' "$LYRICS" | base64 | tr -d '\n')
  STYLE_B64=$(printf '%s' "$STYLE" | base64 | tr -d '\n')
  TITLE_B64=$(printf '%s' "$TITLE" | base64 | tr -d '\n')

  # Preenche no Chrome
  result=$(fill_suno "$MATCHED_URL" "$LYRICS_B64" "$STYLE_B64" "$TITLE_B64")

  if echo "$result" | grep -q "OK"; then
    echo "  ${GREEN}✅ $result${NC}"
  else
    echo "  ${RED}⚠️  $result${NC}"
  fi

  # Espera entre músicas
  if [ "$file_count" -lt "$total_files" ]; then
    echo "  ⏳ Próxima música em 5s..."
    sleep 5
  fi

  echo ""
done

echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "${GREEN}🎉 Pronto! $file_count músicas processadas.${NC}"
