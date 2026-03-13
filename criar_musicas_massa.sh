#!/bin/zsh
# =============================================================
# criar_musicas_massa.sh — Automação em Massa para o Suno
# =============================================================
setopt NO_NOMATCH

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
SALMOS_DIR="$BASE_DIR/salmos-arc"

# Cores
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

# Limpeza automática
rm -f /tmp/suno_inject_massa_* 2>/dev/null
trap 'rm -f /tmp/suno_inject_massa_* 2>/dev/null' EXIT INT TERM

echo "${CYAN}🎵 Suno Auto-Fill — Geração em Massa${NC}"
echo ""

# Pergunta o range
echo "${YELLOW}Exemplo de range: 1 10 (para gerar do salmo-001 ao salmo-010)${NC}"
read "start_idx?👉 Qual o número inicial? "
read "end_idx?👉 Qual o número final? "

if ! [[ "$start_idx" =~ ^[0-9]+$ ]] || ! [[ "$end_idx" =~ ^[0-9]+$ ]] || [ "$start_idx" -gt "$end_idx" ]; then
  echo "${RED}❌ Range inválido.${NC}"
  exit 1
fi

# ── Lê estilos de estilos_suno.txt ──
ESTILOS_FILE="$BASE_DIR/estilos_suno.txt"
if [ ! -f "$ESTILOS_FILE" ]; then
  echo "${RED}❌ Arquivo estilos_suno.txt não encontrado.${NC}"
  exit 1
fi

echo ""
echo "${YELLOW}🎵 Estilos disponíveis:${NC}"
i=1
style_names=()
style_prompts=()

current_name=""
while IFS= read -r line; do
  if [[ -z "${line// }" ]] || [[ "$line" == \#* ]]; then
    continue
  fi
  
  if [[ "$line" == \[*\] ]]; then
    current_name=$(echo "$line" | sed 's/^\[//;s/\]$//')
  elif [[ -n "$current_name" ]]; then
    style_names[$i]="$current_name"
    style_prompts[$i]="$line"
    echo "  ${GREEN}[$i]${NC} $current_name"
    i=$((i + 1))
    current_name=""
  fi
done < "$ESTILOS_FILE"

echo ""
read "style_choice?👉 Selecione o número do estilo base (Padrão: 1): "
style_choice=${style_choice:-1}

if ! [[ "$style_choice" =~ ^[0-9]+$ ]] || [ "$style_choice" -lt 1 ] || [ "$style_choice" -ge "$i" ]; then
  echo "${RED}❌ Opção de estilo inválida.${NC}"
  exit 1
fi

selected_style_name="${style_names[$style_choice]}"
style_input="${style_prompts[$style_choice]}"

echo "✅ Estilo Selecionado: $selected_style_name"
echo "✅ Prompt Base: $style_input"

echo ""
read "randomize_vocals?👉 Você quer que o script dê vozes aleatórias (homem/mulher/duo) para cada música? (s/n): "

echo ""
read "batch_limit?👉 Quantas abas no máximo abrir por vez? (Padrão: 5): "
batch_limit=${batch_limit:-5}

# ── Função para preencher via JS no Chrome ──────────────────────
fill_suno() {
  local lyrics_b64="$1"
  local style_b64="$2"
  local title_b64="$3"
  local delay="$4"
  
  local url="https://suno.com/create?wid=285f4488-c4e8-4a47-8209-4aa29262b952"

  # Abre URL no Chrome
  osascript -e 'tell application "Google Chrome" to activate' 2>/dev/null
  osascript -e "tell application \"Google Chrome\" to open location \"$url\"" 2>/dev/null

  echo "  ⏳ Aguardando página carregar ($delay segs)..."
  sleep "$delay"

  # Escreve o JS num arquivo temporário
  local JS_FILE="/tmp/suno_inject_massa_$$.js"
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

  # Insere as variáveis base64
  echo "  var lyrics = b64decode('${lyrics_b64}');" >> "$JS_FILE"
  echo "  var style = b64decode('${style_b64}');" >> "$JS_FILE"
  echo "  var title = b64decode('${title_b64}');" >> "$JS_FILE"

  cat >> "$JS_FILE" << 'JSFOOTER'

  var textareas = document.querySelectorAll('textarea');
  var titleInput = document.querySelector('input[placeholder*="Song Title"]');
  var createBtn = document.querySelector('button[aria-label="Create song"]');
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

  if (createBtn) {
    createBtn.click();
    results.push('btn_create:CLICKED');
  } else {
    results.push('btn_create:NOT_FOUND');
  }

  return results.join(' | ');
})();
JSFOOTER

  # Lê o JS do arquivo e executa no Chrome
  local result
  result=$(osascript -e "
set jsCode to do shell script \"cat ${JS_FILE}\"
tell application \"Google Chrome\"
  with timeout of 20 seconds
    tell active tab of front window
      execute javascript jsCode
    end tell
  end timeout
end tell
" 2>&1)

  rm -f "$JS_FILE" 2>/dev/null
  echo "$result"
}

# ── Processa os arquivos no range ───────────────────────────────
file_count=0
current_batch=0

for (( i=start_idx; i<=end_idx; i++ )); do
  # Formata o número com 3 dígitos (ex: 001, 010)
  num_formatted=$(printf "%03d" $i)
  folder_name="salmo-$num_formatted"
  file_path="$SALMOS_DIR/$folder_name/$folder_name.txt"

  if [ ! -f "$file_path" ]; then
    echo "${RED}❌ Arquivo não encontrado: $file_path${NC}"
    continue
  fi

  file_count=$((file_count + 1))
  current_batch=$((current_batch + 1))

  echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo "${GREEN}🎶 Processando Salmo $num_formatted${NC}"

  # ── Parsing ──
  # O título será a primeira linha do arquivo
  TITLE=$(head -n 1 "$file_path")
  # A letra pega a partir do primeiro colchete '[' ou a partir da linha 4
  LYRICS=$(awk 'NR>2 {print}' "$file_path" | sed -e '/./,$!d')

  # ── Randomização de Vozes ──
  FINAL_STYLE="$style_input"
  if [[ "$randomize_vocals" =~ ^[Ss]$ ]]; then
    # Array de vozes possíveis
    vocal_types=("male vocal" "female vocal" "male duo vocals" "female duo vocals" "choir vocals")
    
    # Escolhe uma voz aleatória (usando $RANDOM)
    rand_idx=$((RANDOM % ${#vocal_types[@]}))
    chosen_vocal="${vocal_types[$rand_idx]}"
    
    # Anexa a voz ao estilo escolhido pelo usuário
    FINAL_STYLE="$style_input, $chosen_vocal"
  fi

  echo "  🏷️  Título: ${YELLOW}$TITLE${NC}"
  echo "  🎤 Voz escolhida: ${CYAN}${chosen_vocal:-N/A (Fixo)}${NC}"
  echo "  🎨 Estilo Final: ${YELLOW}$FINAL_STYLE${NC}"
  echo ""

  # Codifica em base64
  LYRICS_B64=$(printf '%s' "$LYRICS" | base64 | tr -d '\n')
  STYLE_B64=$(printf '%s' "$FINAL_STYLE" | base64 | tr -d '\n')
  TITLE_B64=$(printf '%s' "$TITLE" | base64 | tr -d '\n')

  # Delay inicial maior p/ a primeira aba, menor p/ as seguintes se carregar rápido
  # Vamos usar 12s por padrão
  delay=12

  # Preenche no Chrome e Clica Criar
  result=$(fill_suno "$LYRICS_B64" "$STYLE_B64" "$TITLE_B64" "$delay")

  if echo "$result" | grep -q "titulo:OK" && echo "$result" | grep -q "letra:OK" && echo "$result" | grep -q "btn_create:CLICKED"; then
    echo "  ${GREEN}✅ Resultado: $result${NC}"
  else
    echo "  ${RED}⚠️  Resultado: $result${NC}"
  fi

  if [ "$current_batch" -ge "$batch_limit" ]; then
    echo "  ${YELLOW}🛑 Limite do batch atingido (${batch_limit}).${NC}"
    read "continue_input?👉 Pressione ENTER para continuar para o próximo lote ou CTRL+C para cancelar..."
    current_batch=0
  else
    if [ "$i" -lt "$end_idx" ]; then
      echo "  ⏳ Próxima música em 5s..."
      sleep 5
    fi
  fi

done

echo "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo "${GREEN}🎉 Pronto! $file_count músicas enviadas para criação.${NC}"
