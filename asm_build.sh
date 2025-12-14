#!/bin/bash

# Sprawdzenie, czy podano argument
if [ $# -eq 0 ]; then
    echo "How to use it: asm plik.asm"
    exit 1
fi

# Usunięcie rozszerzenia .asm
# basename="${1%.asm}"


## pliki skompilowane
files=()

# Kompilacja plików
for arg in "$@"; do
    if [ ! -f "$arg" ]; then
        echo "Plik nie istnieje: $arg"
        continue
    fi	
	basename="${arg%.asm}"
    echo "Kompiluję: $arg -> ${basename}.o"
	nasm -f elf64 -I "$NASM_INCLUDE" "$arg" -o "${basename}.o"
	if [[ $? -ne 0 && "$arg" == "$1" ]]; then
		echo "Błąd kompilacji głównego pliku: $1!" >&2
		exit 1 
	fi
	if [ $? -ne 0 ]; then
    	echo "Błąd: kompilacja $arg nie powiodła się." >&2
    	continue
	fi
	files+=("${basename}.o")
done

# Linkowanie
# basename pierwszego pliku dla outputu
output="${1%.asm}"
ld "${files[@]}" $NASM_INCLUDE/utils/*.o -o "$output"
if [ $? -ne 0 ]; then
    echo "Błąd: linkowanie nie powiodło się."
    exit 1
fi

##dodać opcje -d żeby zostawić pliku *.o 
# usunięcie plików tymczasowych
##rm "$file"
#if [ $? -ne 0 ]; then
#    echo "Błąd: Nie usunięte plików *.o"
#fi
#
echo "Gotowe: ./$output"


