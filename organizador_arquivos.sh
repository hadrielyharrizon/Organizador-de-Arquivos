#!/bin/bash

# Diretório de origem (modifique conforme necessário)
ORIGEM="$HOME/Downloads"

# Diretórios de destino para diferentes tipos de arquivos
IMAGENS="$HOME/Downloads/Imagens"
VIDEOS="$HOME/Downloads/Videos"
DOCUMENTOS="$HOME/Downloads/Documentos"
AUDIO="$HOME/Downloads/Audio"
OUTROS="$HOME/Downloads/Outros"

# Cria os diretórios de destino se não existirem
mkdir -p "$IMAGENS" "$VIDEOS" "$DOCUMENTOS" "$AUDIO" "$OUTROS"

# Função para mover arquivos com base na extensão
mover_arquivos() {
    for arquivo in "$ORIGEM"/*; do
        if [ -f "$arquivo" ]; then
            EXTENSAO="${arquivo##*.}"
            case "$EXTENSAO" in
                jpg|jpeg|png|gif)
                    mv "$arquivo" "$IMAGENS"
                    echo "Movido: $arquivo para $IMAGENS"
                    ;;
                mp4|mkv|avi)
                    mv "$arquivo" "$VIDEOS"
                    echo "Movido: $arquivo para $VIDEOS"
                    ;;
                pdf|docx|txt|xlsx)
                    mv "$arquivo" "$DOCUMENTOS"
                    echo "Movido: $arquivo para $DOCUMENTOS"
                    ;;
                mp3|wav|flac)
                    mv "$arquivo" "$AUDIO"
                    echo "Movido: $arquivo para $AUDIO"
                    ;;
                *)
                    mv "$arquivo" "$OUTROS"
                    echo "Movido: $arquivo para $OUTROS"
                    ;;
            esac
        fi
    done
}

# Chama a função para organizar os arquivos
mover_arquivos

echo "Organização concluída!"
