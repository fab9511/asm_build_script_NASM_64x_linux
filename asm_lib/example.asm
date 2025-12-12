; ========================================
; example.asm – przykład użycia makr EXIT i WRITE
; ========================================

global _start

; Wskaźniki do makr
%include "syscall.inc"

section .text
_start:

    ; wypisz wiadomość na stdout (fd=1)
    WRITE 1, msg, len

    ; zakończ program z kodem 0
    EXIT 0

section .data
msg: db "Hello, NASM world!", 10  ; tekst + newline
len: equ $ - msg                   ; długość tekstu
