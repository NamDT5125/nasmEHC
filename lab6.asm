section	.data
   output db 'The sum is: '
   lenoutput equ $-output			
   input db 'Enter 2 number positive integer: '
   leninput equ $-input
   newline db 0xa, 0xd, 0
   
section .bss
   num1 resb 31
   num2 resb 31
   sum resb 32

section	.text
   global _start        

_start:	       

   mov eax, 4
   mov ebx, 1
   mov ecx, input
   mov edx, leninput
   int 0x80

   mov eax, 4
   mov ebx, 1
   mov ecx, newline
   mov edx, 1
   int 0x80

   mov eax, 3
   mov ebx, 0
   mov ecx, num1
   mov edx, 31
   int 0x80
   

   mov eax, 4
   mov ebx, 1
   mov ecx, newline
   mov edx, 1
   int 0x80

   mov eax, 3
   mov ebx, 0
   mov ecx, num2
   mov edx, 31
   int 0x80


   mov ecx, 0
   lennum1:
      cmp byte [num1 + ecx], 0
      je  change1
      inc ecx
      jmp lennum1
   change1:
      sub ecx, 1
      mov esi, ecx   

   mov ecx, 0
   lennum2:
      cmp byte [num2 + ecx], 0
      je  change2
      inc ecx
      jmp lennum2

   change2:
      sub ecx, 1
      mov edi, ecx   

   cmp esi, edi
   jae lennum
   mov esi, edi
   lennum:
      mov   ecx, esi      


add2num:  
   mov 	al, [num1 + esi - 1]
   adc 	al, [num2 + edi - 1]
   aaa
   pushf
   or 	al, 0x30
   popf

   mov	[sum + ecx - 1], al
   dec edi
   dec esi
   loop	add2num


   mov eax, 4
   mov ebx, 1
   mov ecx, output
   mov edx, lenoutput    
   int 0x80             

   mov eax, 4
   mov ebx, 1
   mov ecx, sum
   mov edx, 32                 
   int 0x80

   mov	eax, 1        
   int	0x80
