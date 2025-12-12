
%ifndef SYSCALL_IN
%define SYSCALL_IN

;--------------------------------------------
; Makro HEX int, buf
;--------------------------------------------
%macro HEX 2
    mov rdi, %1
	mov rsi, %2
	call hex
%endmacro

;--------------------------------------------
; Makro OCT int, buf
;--------------------------------------------
%macro OCT 2
    mov rdi, %1
	mov rsi, %2
	call hex
%endmacro

;--------------------------------------------
; Makro BIN int, buf
;--------------------------------------------
%macro BIN 2
    mov rdi, %1
	mov rsi, %2
	call bin
%endmacro





%endif
