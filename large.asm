section .text
     global main               ;must be declared for using gcc
main:      ;tell linker entry point
           mov     ecx, [num1]
           cmp     ecx, [num2]
           jge    check_third_num

           mov ecx, [num2]

    check_third_num:
        cmp  ecx, [num3]
        jge  value_exit
        mov   ecx, [num3]
      
value_exit:
        mov   [largest], dword ecx
        mov   ecx,msg
        mov   edx, len
        mov   ebx,1       ;file descriptor (stdout)
        mov   eax,4       ;system call number (sys_write)
        int   80h       ;call kernel
;
        mov   ecx,largest
        mov   edx, 2
        mov   ebx,1       ;file descriptor (stdout)
        mov   eax,4       ;system call number (sys_write)
        int   0x80        ;call kernel
        mov   eax, 1    ; exit system call
        int   80h
section .data
    msg: db "The largest digit is: ", 10;
    len: equ $-msg 
    num1 dd '47'
    num2 dd '47'
    num3 dd '44'
segment .bss
   largest resb 4
; run this program and explain how it works, modify it to work properly.

