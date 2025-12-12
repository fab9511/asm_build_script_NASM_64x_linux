    global oct 
	section .text

oct:
	;; rdi - number
	;; rsi - buffer
	mov rax, rdi	; kopia rdi na rax (korzystamy tylko z al póżniej)
	mov bl, al	;kopia al na bl (al liczba wejściowa)
    shr bl, 3	; przesunięcie o 3 bity w prawo
    and bl, 7	; zerowanie pozostałych bitów oprócz 3 początkowych
    add bl, 48	; liczba w ascii
    mov [rsi], bl   ; wartość bl na bufor
    mov bl, al	; kopia wartości al na bl 
    and bl, 7	; przesunięcie o 7 bitów w prawo
    add bl, 48	; liczba w ascii
    mov [rsi+1], bl ; wartość na bl z przesunięciem odpowiednim
    mov bl, 0x0A	; wartość ascii znaku nowej linii
    mov [rsi+2], bl ; wartość bl na bufor
	ret ;powrót funkcji
	
