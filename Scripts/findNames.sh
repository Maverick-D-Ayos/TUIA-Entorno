#! /usr/bin/env bash
ARCHIVO=$1
grep --color='always' "[A-Z][^ ]*" $ARCHIVO
