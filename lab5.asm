section .data
    input db "Input anything here:"
    leninput equ $ - input
    output1 db "Your string entered:"
    lenoutput1 equ $-output1
    output2 db "Your strings entered is not contain lower case."
    lenoutput2 equ $-output2

section .bss
    strings resb 32
    n resb 1

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
    mov ecx, strings
    mov edx, 32
    int 0x80

    mov ecx, strings
    mov edx, 0 

convert:
    mov al, [ecx + edx]
    cmp al, 0  
    je end

    cmp al, 'a'
    jl nextchar 

    cmp al, 'z'
    jg nextchar
    
    sub al, 32 
    mov [ecx + edx], al
    mov byte [n], 1
    inc edx
    jmp convert

nextchar:
    inc edx
    jmp convert

end:
    cmp byte [n], 0
    jne stringslowercase
    
    mov eax, 4
    mov ebx, 1
    mov ecx, output2
    mov edx, lenoutput2
    int 0x80
    jmp endprogram

stringslowercase:

    mov eax, 4
    mov ebx, 1
    mov ecx, output1
    mov edx, lenoutput1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, strings
    mov edx, 32
    int 0x80

endprogram:

    mov eax, 1
    int 0x80
