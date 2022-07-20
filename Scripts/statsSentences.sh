#! /usr/bin/env bash
ARCHIVO=$1
CANTIDADPALABRAS=$(grep -o "[A-Z][^.]*" $ARCHIVO | wc -w) #cuenta las palabras en la oracion
CANTIDADORACIONES=$(grep -o "[A-Z][^.]*" $ARCHIVO | wc -l) #cuenta la cantidad de oraciones
PROMEDIO=$(echo "scale=2; $CANTIDADPALABRAS / $CANTIDADORACIONES" | bc -l)
grep -o "[A-Z][^.]*" $ARCHIVO >> /tmp/oraciones
while IFS= read -r line; do echo $line | wc -w; done < /tmp/oraciones >> /tmp/temporal 
sort -n /tmp/temporal > /tmp/ordenado
MINIMO=$(head -1 /tmp/ordenado)
MAXIMO=$(tail -1 /tmp/ordenado)
echo "la oración con mayor longitud tiene $MAXIMO."
echo "la oración con menor longitud tiene $MINIMO."
echo "El promedio es $PROMEDIO."
rm /tmp/oraciones /tmp/temporal /tmp/ordenado
unset CANTIDADPALABRAS CANTIDADORACIONES PROMEDIO MINIMO MAXIMO
