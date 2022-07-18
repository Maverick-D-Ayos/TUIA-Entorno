#! /usr/bin/env bash
if [ $# == 1 ]
then
    ARCHIVO=$1
    grep --color='always' "[A-Z][^ ]*" $ARCHIVO
fi
