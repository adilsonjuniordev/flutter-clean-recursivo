#!/bin/sh

# ------------------------------------ DOC ------------------------------------ #
# Criado por (Adilson Junior) - (https://github.com/adilsonjuniordev)

# Para executar o script, salve com seu nome de preferência (ex: clean-projects.sh).
# Depois execute um dos comandos abaixo:

# sh ./clean-projects.sh
# ou
# sudo sh clean-projects.sh


# ------------------------------------ SCRIPT ------------------------------------ #
# Prompt de escolha (S/N)
echo "\nVocê tem certeza que deseja limpar todos os projetos Flutter?\n"
read -p "(S) Sim / (N) Não: " escolha

# Ação tomada mediante escolha
case $escolha in
[nN]* ) echo "\nOperação cancelada.\n"; exit;;
[sS]* ) clear; break;;
*)echo "\nOpção inválida.\nAbortando comando...\n"; exit ;;
esac

# Limpeza de projetos Flutter de forma recursiva
echo "\n----------- Flutter Clean | Recursivo -----------\n"
echo "Procurando projetos... (isso pode demorar um pouco)\n"

find . -name "pubspec.yaml" -exec $SHELL -c '
    echo "Limpando todos os projetos."
    for i in "$@" ; do
        DIR=$(dirname "${i}")
        echo "Limpando: ${DIR}..."
        (cd "$DIR" && flutter clean >/dev/null 2>&1)
    done
    echo "Concluído!"
' {} +
