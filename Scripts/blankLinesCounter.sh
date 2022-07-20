#! /usr/bin/env bash
ARCHIVO=$1
CONTADOR=$(grep -ce "^[[:blank:]]*$" $ARCHIVO)
echo "La cantidad de lineas en blanco es $CONTADOR."
unset CONTADOR
