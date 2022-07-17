#! /usr/bin/env bash
if [ $# == 1 ]
then
   ARCHIVO=$1
   # VERIFICAR QUE NO SEA CERO CANTIDADPALABRAS
   grep -E -o "\<[A-Za-z]+\>" $ARCHIVO | awk '{ print length, $0 }'| cut -d " ">
   MINIMO=$(head -1 temporal.txt)
   MAXIMO=$(tail -1 temporal.txt)
   CANTIDADPALABRAS=$(wc -w $ARCHIVO | grep -o "^[0-9]*")
   tr -d '[:space:]' <$ARCHIVO> sin-espacios.txt
   CANTIDADCARACTERES=$(wc -c sin-espacios.txt | grep -o "^[0-9]*")
   PROMEDIO=$(echo "scale=2; $CANTIDADCARACTERES / $CANTIDADPALABRAS" | bc -l)
   echo "la palabra con mayor longitud tiene $MAXIMO."
   echo "la palabra con menor longitud tiene $MINIMO."
   echo "El promedio es $PROMEDIO."
   unset MAXIMO MINIMO CANTIDADPALABRAS CANTIDADCARACTERES PROMEDIO
   rm temporal.txt sin-espacios.txt
fi
