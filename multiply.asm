section .text
    global main     ;must be declared for using gcc
main:    ;tell linker entry point
        mov      al,'3'
        sub       al, '0'
        mov      bl, '2'
        sub       bl, '0'
        imul      bl
        add      al, '0'
        mov      [res], al
        mov      ecx,msg
        mov      edx, len
        mov      ebx,1    ;file descriptor (stdout)
        mov      eax,4    ;system call number (sys_write)
        int      0x80     ;call kernel
        ;nwln
  ; if error generated, replace with a comment 
        mov      ecx,res
        mov      edx, 1
        mov      ebx,1    ;file descriptor (stdout)
        mov      eax,4    ;system call number (sys_write)
        int      0x80     ;call kernel
        mov      eax,1    ;system call number (sys_exit)
        int      0x80     ;call kernel
section .data
msg: db "The result is:", 10
len: equ $-msg
segment .bss
res resb 1
; run this program and explain how it works
