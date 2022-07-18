#! /usr/bin/env bash
if [ $# == 1 ]
then
    # No distinguir entre mayuscula y minusculas
    # guardar mejor los resultados.
    ARCHIVO=$1
    LISTA=($(grep -E -o "\<[A-Za-z]+\>" $ARCHIVO | sort -u))
    for cadena in "${LISTA[@]}"
    do
        if [ ${#cadena} -gt 3 ]
        then
            CANTIDAD=$(grep -E -o -i "$cadena" $ARCHIVO | wc -l) 
            echo "$CANTIDAD-$cadena" >> repeticiones.txt
        fi
    done
    more repeticiones.txt | sort -n -r >> repeticiones
    head -10 repeticiones
    rm repeticiones repeticiones.txt
    unset LISTA CANTIDAD cadena
fi
