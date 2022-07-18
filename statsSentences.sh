#! /usr/bin/env bash
if [ $# == 1 ]
then
    ARCHIVO=$1
    CANTIDADPALABRAS=$(grep -o "[A-Z][^.]*" $ARCHIVO | wc -w) #cuenta las palabras en la oracion
    CANTIDADORACIONES=$(grep -o "[A-Z][^.]*" $ARCHIVO | wc -l) #cuenta la cantidad de oraciones
    PROMEDIO=$(echo "scale=2; $CANTIDADPALABRAS / $CANTIDADORACIONES" | bc -l)
    grep -o "[A-Z][^.]*" prueba.txt >> TEXTO
    while IFS= read -r line; do echo $line | wc -w; done < TEXTO >> alos
    sort -n alos > ordenado
    MINIMO=$(head -1 ordenado)
    MAXIMO=$(tail -1 ordenado)
    echo "la oración con mayor longitud tiene $MAXIMO."
    echo "la oración con menor longitud tiene $MINIMO."
    echo "El promedio es $PROMEDIO."
    rm TEXTO alos ordenado
    unset CANTIDADPALABRAS CANTIDADORACIONES PROMEDIO MINIMO MAXIMO
fi
