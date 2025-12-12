        global _start
        section .text
	
bin: 
	;; funkcja zamiany liczby na napis liczby w systemie bin 
	;; rdi - liczba
	;; rsi - buffer
	mov rax, rdi
	mov cx, 8	; licznik funkcji
.petla:	
	mov bl, al	; kopia al na bl
	mov dl, cl
	sub dl, 1
	shr bl, dl	; przesunięcie bitowe
	and bl, 1 	; zerowanie wszystkich bitów oprócz pierwszego
	add bl, 48	; dodanie '0' -- liczba w ascii
	mov dl, 8	;
	sub dl, cl	; przesunięcie bufora
	mov [rsi+dl], bl	; 
	loop .petla 	;wywołanie kolejnego obiegu pętli
	mov bl, 0x0A    ; wartość ascii znaku nowej linii
    mov [rsi+8], bl ; wartość bl na bufor
	ret		; powrót z funkcji
