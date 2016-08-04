section .text
global _start
;must be declared for using gcc
_start : ;t ell linker ent ry point
;creat e the file
mov eax, 8
mov ebx, file_name
mov ecx, 0777
;read, write and execute by all
int 0x80
;call kernel
mov [fd_out], eax

; writ e int o t he file
mov edx,len
;number of byt es
mov ecx, msg
;message t o writ e
mov ebx, [fd_out] ;file descript or
mov eax,4
;syst em call number (sys_writ e)
int 0x80
;call kernel
; close t he file
mov eax, 6
mov ebx, [fd_out]
; writ e t he message indicat ing end of file writ e
mov eax, 4
mov ebx, 1
mov ecx, msg_done
mov edx, len_done
int 0x80
;open t he file for reading
mov eax, 5
mov ebx, file_name
mov ecx, 0
;for read only access
mov edx, 0777
;read, writ e and execut e by all
int 0x80
mov [fd_in], eax
;read from file
mov eax, 3
mov ebx, [fd_in]
mov ecx, info
mov edx, 26
int 0x80
; close t he file
mov eax, 6
mov ebx, [fd_in]
; print t he info
mov eax, 4
mov ebx, 1
mov ecx, info
mov edx, 26
int 0x80
mov eax,1
int 0x80
;syst em call number (sys_exit )
;call kernel
section .data
file_name db 'myfile.txt '
msg db 'Welcome to Tutorials Point'
len equ $-msg
msg_done db 'Written to file', 0xa
len_done equ $-msg_done

section .bss
fd_out resb 1
fd_in resb 1
info resb 26
