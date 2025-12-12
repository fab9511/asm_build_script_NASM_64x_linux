global hex

section .text
hex:
    ;; funkcja zamiany liczby na napis liczby w systemie hex
    ;; rdi - liczba
    ;; rsi - buffer
    ;;
    mov rax,rdi ; kopia liczby na rdi
    mov cx, 2   ; licznik petli
    mov r8b, 0  ; przesunięcie do zapisu w buforze
    mov dl, 4   ; o ile przesunąć -- shr
petla1:
    mov bl, al  ; kopia liczby
    push cx     ; kopia licznika cx
    ;; tu coś dodać
    mov cl, dl  ; cl = przesunięcie
    shr bl, cl  ; odpowiednie przesuniecie bitowe
    pop cx      ; przywrocenie wartosci licznika cx
    and bl, 15  ; zerowanie pozostałych bitów
    cmp bl, 10  ; porównanie bl - 10 :  bl => 10 NS = 0 : bl < 10 NS = 1
    jns wieksze     ; jeśli liczba większa niż 10:
mniejsze:
    add bl, '0' ; dodanie '0'
    mov [rsi+r8], bl ;kopia bl na bufor
    jmp dalej   ; kolejny obrót pętli
wieksze:
    add bl, 55 ; liczby >10 szestnastkowo
    mov [rsi+r8], bl ;kopia bl na bufor
dalej:
    sub dl, 4   ; zmiejszenie przesuniecia w nastepnym obrocie petli
    inc r8b
    loop petla1 ; kolejny obieg petli jeśli cx!=0

    mov bl, 0x0A    ; wartość ascii znaku nowej linii
    mov [rsi+2], bl ; wartość bl na bufor
    ret     ; powrót z funkcji
