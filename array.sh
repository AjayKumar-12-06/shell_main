#!/bin/bash

movie=("RRR" "devara" "wert")

echo "first movies:" ${movie[0]}
echo "number of movies:" ${movie[#]}
echo "all the movies:" ${movie[@]}
echo "all the movies in signle string:" ${movie[*]}
