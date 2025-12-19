	global strLen
    section .text

strLen: 
    ;; rdi - buffer
	;; pierwszy znak \n zamienia na \0 i kończy liczenie słowa	
	;; return a size of a word in buffer
	xor rax, rax ; licznik dlugosci slowa
.petla:
    cmp byte [rdi+rax],0x0A ; czy kolejny znak to \n
    jz .replace ;koniec słowa
    cmp byte [rdi+rax],0x00 ; czy kolejny znak to \0
    jz .koniec  ;koniec słowa
    inc rax
    jmp .petla  ;kolejny obieg petli
.replace:
    mov byte [rdi+rax], 0x00 ; ostatni znak to teraz \0
.koniec:
    ret         ;koniec funkcji, rax = dlugosc slowa
