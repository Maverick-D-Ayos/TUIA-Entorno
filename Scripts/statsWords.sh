#! /usr/bin/env bash
ARCHIVO=$1
CANTIDADPALABRAS=$(wc -w $ARCHIVO | grep -o "^[0-9]*")
if [ $CANTIDADPALABRAS -gt 0 ]
then
    grep -E -o "\<[A-Za-z]+\>" $ARCHIVO | awk '{ print length, $0 }'| cut -d " " -f1 | sort -n > /tmp/temporal
    MINIMO=$(head -1 /tmp/temporal)
    MAXIMO=$(tail -1 /tmp/temporal)
    tr -d '[:space:]' <$ARCHIVO> /tmp/sin-espacios
    CANTIDADCARACTERES=$(wc -c /tmp/sin-espacios | grep -o "^[0-9]*")
    PROMEDIO=$(echo "scale=2; $CANTIDADCARACTERES / $CANTIDADPALABRAS" | bc -l)
    echo "la palabra con más larga tiene $MAXIMO caracteres."
    echo "la palabra con más corta tiene $MINIMO caracteres."
    echo "El promedio es $PROMEDIO caracteres por palabra."
    unset MAXIMO MINIMO CANTIDADPALABRAS CANTIDADCARACTERES PROMEDIO
    rm /tmp/temporal /tmp/sin-espacios
else
    echo "No hay palabras en el archivo de texto."
    unset CANTIDADPALABRAS
fi
