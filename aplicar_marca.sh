#!/bin/bash

# Diretório onde o script está rodando
# Encontrar todas as pastas no diretório atual (ignorando pastas ocultas e a própria pasta .)
# O grep v "^.$" remove o diretório atual da lista
echo "---------------------------------------------------"
echo "Pastas disponíveis com vídeos:"

# Lista e enumera as pastas salvando num array (compatível com Mac)
PASTAS=()
while IFS= read -r line; do
    PASTAS+=("$line")
done < <(find . -maxdepth 1 -type d -not -path '*/\.*' | sed 's|^\./||' | grep -v "^.$" | sort)

if [ ${#PASTAS[@]} -eq 0 ]; then
    echo "Nenhuma pasta encontrada no diretório atual."
    exit 1
fi

for i in "${!PASTAS[@]}"; do
    echo "[$i] ${PASTAS[$i]}"
done

echo "---------------------------------------------------"
# Pede para o usuário digitar o número da pasta
read -p "Digite o NÚMERO da pasta que deseja processar: " INDEX_PASTA

# Valida se o que foi digitado é um número válido na lista
if ! [[ "$INDEX_PASTA" =~ ^[0-9]+$ ]] || [ "$INDEX_PASTA" -lt 0 ] || [ "$INDEX_PASTA" -ge "${#PASTAS[@]}" ]; then
    echo "Opção inválida. Execução cancelada."
    exit 1
fi

INPUT_DIR="${PASTAS[$INDEX_PASTA]}"
echo "Pasta selecionada: $INPUT_DIR"

# Pasta onde os vídeos processados serão salvos (dentro da pasta original)
OUTPUT_DIR="$INPUT_DIR/com_marca"

# Cria a pasta de saída se ela não existir
mkdir -p "$OUTPUT_DIR"

# -------------------------------------------------------------
# CONFIGURAÇÕES DA SUA MARCA D'ÁGUA (IMAGEM)
# -------------------------------------------------------------
# O script assume que a imagem gaspar_logo.png está na MESMA pasta do script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOGO_IMG="$SCRIPT_DIR/gaspar_logo.png"

# Verifica se a logo existe
if [ ! -f "$LOGO_IMG" ]; then
    echo "Erro: A imagem da logo não foi encontrada em: $LOGO_IMG"
    echo "Certifique-se de que o arquivo gaspar_logo.png está na mesma pasta deste script."
    exit 1
fi

# Largura desejada para o logo (em pixels). O arquivo vai manter a proporção.
# Ajuste esse valor para fazer o logo cobrir exatamente o texto.
LARGURA_LOGO="264"

# Posição da marca d'água (X = horizontal, Y = vertical)
# "W" e "H" é o tamanho do vídeo, "w" e "h" é o tamanho do logo.
# W-w-10 = 10 pixels da borda direita. H-h-10 = 10 pixels da borda inferior.
# Se souber a posição exata, pode colocar os números diretos, ex: POSICAO_X="500"
POSICAO_X="(W-w)/2"
POSICAO_Y="H-h-250"
# -------------------------------------------------------------

# Procura por todos os vídeos .mp4 na pasta informada
for video in "$INPUT_DIR"/*.mp4; do
    if [ -f "$video" ]; then
        filename=$(basename "$video")
        echo "---------------------------------------------------"
        echo "Processando: $filename"
        
        # O ffmpeg carrega o vídeo (-i vídeo) e a imagem (-i logo)
        # O uso de ./ antes do video evita que o ffmpeg confunda o caminho com um protocolo web
        ffmpeg -y -i "./$video" -i "$LOGO_IMG" \
            -filter_complex "[1:v]scale=$LARGURA_LOGO:-1[logo];[0:v][logo]overlay=x=$POSICAO_X:y=$POSICAO_Y" \
            -codec:a copy "./$OUTPUT_DIR/$filename"
        
    fi
done

echo "---------------------------------------------------"
echo "Processamento em lote finalizado!"
echo "Os vídeos prontos estão na pasta '$OUTPUT_DIR'."
