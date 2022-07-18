#! /usr/bin/env bash
# Contador de líneas en blanco.
if [ $# == 1 ]
then
    ARCHIVO=$1
    CONTADOR=$(grep -ce "^[[:blank:]]*$" $ARCHIVO)
    echo "La cantidad de lineas en blanco es $CONTADOR."
    unset CONTADOR
fi
