section .data

    inputname db "enter your name:"
    leninputname equ $ - inputname

    hello db "Hello "
    lenhello equ $ - hello

    chamthan db "!!  ", 0xd 0xa
    lenchamthan equ $ - chamthan

    welcome db "Welcome, "
    welcome_len equ $ - welcome

    ehc db " to EHC"
    lenehc equ $ - ehc
    
section .bss

    name resb 10

section .text

    global _start

_start:
 
    mov eax, 4
    mov ebx, 1
    mov ecx, inputname
    mov edx, leninputname
    int 0x80

   
    mov eax, 3
    mov ebx, 0
    mov ecx, name
    mov edx, 10
    int 0x80

    mov edx, name
    sub eax, 0x1
    mov byte[edx+eax], 0x0

    mov eax, 4
    mov ebx, 1
    mov ecx, hello
    mov edx, lenhello
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, chamthan
    mov edx, lenchamthan
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, welcome
    mov edx, welcome_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, ehc
    mov edx, lenehc
    int 0x80

    mov eax, 1
    int 0x80



