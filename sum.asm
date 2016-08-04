segment .data
msg1: db "Enter a digit ", 10 ;message1
len1: equ $-msg1 ;length of msg1
msg2: db "Please Enter a second digit", 10; msg2
len2: equ $-msg2 
msg3: db "The sum is: "
len3: equ $-msg3

segment .bss

num1 resb 2
num2 resb 2
res resb 1

section .txt

	global main

main: 

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, num1
	mov edx, 2
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx, msg2
	mov edx, len2
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 2
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 80h

	mov eax, [num1]
	mov ebx, [num2]
	add eax, ebx
	sub eax, '0'
	mov [res], eax

	mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 1
    int 80h

    exit:
    	mov eax, 1
    	xor ebx,ebx
    	int 80h
















