#! /usr/bin/env bash
# No distinguir entre mayuscula y minusculas
# guardar mejor los resultados.
ARCHIVO=$1
LISTA=($(grep -E -o "\<[A-Za-z]+\>" $ARCHIVO | sort -u))
for cadena in "${LISTA[@]}"
do
    if [ ${#cadena} -gt 3 ]
    then
        CANTIDAD=$(grep -E -o -i "$cadena" $ARCHIVO | wc -l) 
        echo "$CANTIDAD-$cadena" >> /tmp/repeticiones.txt
    fi
done
more /tmp/repeticiones.txt | sort -n -r >> /tmp/repeticiones
head -10 /tmp/repeticiones
rm /tmp/repeticiones /tmp/repeticiones.txt
unset LISTA CANTIDAD cadena
