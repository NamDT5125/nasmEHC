section .data
    
    input db 'Enter a number: '
    leninput equ $-input
    oddnumber db 'This is odd number!!'
    lenoddnumber equ $-oddnumber
    evennumber db 'This is even number!!'
    lenevenumber equ $-evennumber

section .bss

    number resb 1

section .text

    global _start

_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, leninput
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 1
    int 0x80

    mov eax, [number]     
    sub eax, '0'  

    mov edx, 0
    mov ebx, 2
    div ebx      

    cmp edx, 0
    je even

    mov eax, 4
    mov ebx, 1
    mov ecx, oddnumber
    mov edx, lenoddnumber
    int 0x80

    mov eax, 1
    int 0x80
    
even:

    mov eax, 4
    mov ebx, 1
    mov ecx, evennumber
    mov edx, lenevenumber
    int 0x80
    
    mov eax, 1
    int 0x80
