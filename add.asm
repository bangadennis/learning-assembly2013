segment .data

mesg: db 'Hello Kenyans, I love ur spirit',10
mesglen: equ $-mesg

segment .txt
	global main
main:

mov eax, 4
mov ebx, 1
mov ecx, mesg
mov edx, mesglen
int 80h

mov eax, 1
xor ebx, ebx
int 80h


