section .data
    input db "Input: "
    leninput equ $-input
    sumof db "Sum of "
    lensumof equ $-sumof
    sequences db " sequences is: "
    lensequences equ $-sequences
    newline db 0xa, 0xd
    
section .bss
    n resd 1
    sum resd 1
    
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
    mov ecx, n
    mov edx, 4
    int 0x80

    dec eax 
    mov edx, n
    mov byte [edx + eax], 0  

    mov eax, 4
    mov ebx, 1
    mov ecx, sumof
    mov edx, lensumof
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, n
    mov edx, 1
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, sequences
    mov edx, lensequences
    int 0x80
    
    sub dword [n], '0'
    mov dword [sum], 0
    mov ecx, 1  

sum_loop:
    add [sum], ecx  
    inc ecx         
    cmp ecx, [n]      
    jbe sum_loop    
    
    add byte [sum], '0'
    mov eax, 4
    mov ebx, 1
    mov ecx, sum    
    mov edx, 4      
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    int 0x80
