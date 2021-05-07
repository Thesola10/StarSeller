; vim: ft=nasm
; nasm -f elf64 -o star_seller.o star_seller.asm && ld star_seller.o
bits 64


; The Star Seller exercise in algorithmics,
; written in x86_64 Linux Netwide Assembly. [Unfinished]

; Assembly language is literally a batch of CPU instructions. It is the purest
; form of programming, one could argue. However, it comes with a drawback:
; There is no stdlib. This program is entirely standalone and uses Linux x64
; syscalls.


global _start

         ; System call definitions
%define  SYS_EXIT      60
%define  SYS_READ      0
%define  SYS_WRITE     1
%define  SYS_CLOSE     3

; Code
section .text

; int _start()
; The program's entry point
_start:
    mov  rsi,   validname
    call        prompt      ; Ask for user name

    mov  rsi,   validstars
    call        prompt      ; Ask for number of stars

    call        starsout    ; Print number of stars

    mov  rax,   SYS_EXIT
    mov  rdi,   0
    syscall            ; Exit the program cleanly.


; void prompt((*void)() valid [rsi])
; Prompt the user for their name, and check for validity.
prompt:
    ret


; int [rax] validname(void)
; Check if the user name is valid. (first char isn't null)
validname:
    mov  cx,   [name]
    jecxz      .inval
    mov  rax,   0
    ret
.inval:
    mov  rax,   1
    ret


; int [rax] validstars(void)
; Check if the number of stars is valid. (0 <= n <= 200)
validstars:
    call atoi
    mov  rcx,   rax
    jecxz      .inval
    sub  rcx,   200
    jecxz      .inval
    mov  rax,   0
    ret
.inval:
    mov  rax,   1
    ret

; int [rax] atoi(int readlen [rcx])
; Parse decimal integer out of string.
atoi:
    xor  rbx,   rbx
    mov  rsi,   sstars
.digit:
    mov  al,    byte  [rsi]
    inc  rsi           ; Load next digit

    sub  al,    '0'
    imul rbx,   10
    add  rbx,   rax    ; Add mod 10 and mul 10 buffer

    jecxz      .end    ; Loop
    jmp        .digit
.end:
    mov  rax,   rbx
    mov [stars], ax
    ret


; void starsout(void)
; Print the required number of stars.
starsout:
    xor  rcx,   rcx
    mov  cx,   [stars] ; Load number of stars

    mov  rdx,   1
    mov  rsi,   star
    mov  rax,   SYS_WRITE   ; Load write params
.loop:
    syscall            ; Print one star

    dec  cx
    jecxz      .end    ; Loop
    jmp        .loop
.end:
    mov  rsi,   newl
    syscall            ; Print line break and return
    ret


; Read-only data (constants)
section .data

qname:   db     "What is your name? "
qnamel:  equ    $ - qname

hello1:  db     "Hello, "
hello1l: equ    $ - hello1

hello2:  db     "!"
hello2l: equ    $ - hello2

qstars:  db     "How many stars do you want? "
qstarsl: equ    $ - qstars

gbye:    db     "Goodbye, "
gbyel:   equ    $ - gbye

star:    db     "*"

newl:    db     10



; Reserved memory (variables)
section .bss

name:    resb   200    ; User name input
sstars:  resb   10     ; Number of stars input
stars:   resb   1      ; Parsed number of stars



; This language is case-insensitive.
