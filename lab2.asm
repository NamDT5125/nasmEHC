section .data

    input db 'Nhap vao chieu dai va chieu rong:', 0xa, 0xd
    leninput equ $-input
    outputchuvi db 'Chu vi cua hinh chu nhat: '
    lenoutputchuvi equ $-outputchuvi
    outputdientich db 'Dien tich cua hinh chu nhat: '
    lenoutputdientich equ $-outputdientich
    newline db 0xa, 0xd
    lennewline equ $-newline

section .bss

    chieudai resb 10
    chieurong resb 10
    chuvi resb 10
    dientich resb 10

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
    mov ecx, chieudai
    mov edx, 10
    int 0x80

    mov edx, chieudai
    sub eax, 0x1
    mov byte[edx+eax], 0x0

    mov eax, 3
    mov ebx, 0
    mov ecx, chieurong
    mov edx, 10
    int 0x80

    mov edx, chieurong
    sub eax, 0x1
    mov byte[edx+eax], 0x0

    mov eax, [chieudai]
    sub eax, '0'
    mov ebx, [chieurong]
    sub ebx, '0'
    add eax, ebx
    shl eax, 1
    add eax, '0'
    mov [chuvi], eax

    mov eax, [chieudai]
    sub eax, '0'
    mov ebx, [chieurong]
    sub ebx, '0'
    mul ebx
    add eax, '0'
    mov [dientich], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, outputchuvi
    mov edx, lenoutputchuvi
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, chuvi
    mov edx, 10
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lennewline
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, outputdientich
    mov edx, lenoutputdientich
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, dientich
    mov edx, 10
    int 0x80

    mov eax, 1
    int 0x80

