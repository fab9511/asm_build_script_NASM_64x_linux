; ============================================
;  syscall.in — proste makra ułatwiające
;  korzystanie z systemowych wywołań w Linux x86_64
; ============================================

%ifndef SYSCALL_IN
%define SYSCALL_IN

;--------------------------------------------
; Makro EXIT code
;--------------------------------------------
%macro EXIT 1
    mov rax, 60       ; sys_exit
    mov rdi, %1
    syscall
%endmacro

;--------------------------------------------
; Makro WRITE fd, buf, len
;--------------------------------------------
%macro WRITE 3
    mov rax, 1        ; sys_write
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
    syscall
%endmacro

;--------------------------------------------
; Makro READ fd, buf, len
;--------------------------------------------
%macro READ 3
    mov rax, 0        ; sys_read
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
    syscall
%endmacro

%endif
