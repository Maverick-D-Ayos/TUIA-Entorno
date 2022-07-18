#! /usr/bin/env bash
PS3="Ingrese una opción."
OPCIONES=("statsWords" "statsUsageWords" "findNames" "statsSentences" "blankLinesCounter">
select op in "${OPCIONES[@]}"; do
    case $op in
        "statsWords")
            echo "Ingrese el nombre del archivo por favor."
            ls 
            read
            clear
            ./statsWords.sh $REPLY
            ;;
        "statsUsageWords")
            echo "Hola"
            ;;
        "findNames")
            echo "Hola"
            ;;
        "statsSentences")
            echo "Hola"
            ;;
        "blankLinesCounter")
            echo "Hola"
            ;;
        "Quit")
            echo "Adios."
            break
            ;;
        *)
            echo "Opción invalida $REPLY."
            ;;
    esac
done
clear
