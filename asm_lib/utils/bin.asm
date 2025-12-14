	global bin

bin:
    ;; funkcja zamiany liczby na napis liczby w systemie bin
    ;; wynik zapisany w
    ;; rdi - liczba
    ;; rsi - buffer
    mov rax, rdi
    mov cx, 8   ; licznik funkcji
.petla:
    mov bl, al  ; kopia al na bl
    mov dl, cl  ; kopia licznika pętli cl
    sub cl, 1   ; ustalamy odpowiednie przesunięcie bitowe w prawo
    shr bl, cl  ; przesunięcie bitowe w prawo
    and bl, 1   ; zerowanie wszystkich bitów oprócz pierwszego
    mov cl, dl  ; przywrócenie wartości licznika pętli cl
    add bl, 48  ; dodanie '0' -- liczba w ascii
    mov dl, 8   ; dl = 8
    sub dl, cl  ; ustalamy odpowiednie przesunięcie bufora
    mov [rsi+rdx], bl ; wartość bl na bufor
    loop .petla     ;wywołanie kolejnego obiegu pętli
    mov bl, 0x0A    ; wartość ascii znaku nowej linii
    mov [rsi+8], bl ; wartość bl na bufor
    ret     ; powrót z funkcji
