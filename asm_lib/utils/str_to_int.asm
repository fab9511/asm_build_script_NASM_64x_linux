global str_to_int

section .start
str_to_int:
    ;; rdi - bufor z liczbą w postaci str
    ;; koniec liczby przy 0 lub \n
    ;; return str na liczbę
    xor rbx, rbx
    xor rax, rax        		; wynik = 0
    xor rcx, rcx          		; indeks w buforze
.loop:
    cmp byte [rdi+rcx],0x00 	; czy byte == \0
    je .done                    ; koniec bufora
    cmp byte [rdi+rcx],0x0A     ; czy byte == \0
    je .done                    ; koniec bufora --  
    cmp byte [rdi+rcx], '0'     ; walidacja czy to cyfra
    jb .done					; koniec liczby - wartość nieliczbowa
    cmp byte [rdi+rcx], '9'     ; walidacja czy to cyfra
    ja  .done					; koniec liczby - wartość nieliczbowa


    mov bl, byte [rdi+rcx]      ; pobranie znaku
    sub bl, '0'                 ; zamiana na cyfrę 0..9
    lea rax, [rax + rax*4]      ; rax = 5x
    shl rax, 1                  ; rax = 10x
    add rax, rbx                ; rax = rax+cyfra
    inc rcx     				; zwiekszenie indeksu bufora
    jmp .loop
.done:
    ret							; powrót z funkcji
