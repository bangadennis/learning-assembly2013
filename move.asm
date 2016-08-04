;Example 4­ data movement (Source Assembly language tutorial)
; This program replaces a part of a name
section .text
    global main     ;must be declared for linker (ld)
main:    ;tell linker entry point
;writing the name 'Nyag Sus'
         mov      edx,10       ;message length
         mov      ecx, name   ;message to write
         mov      ebx,1       ;file descriptor (stdout)
         mov      eax,4       ;system call number (sys_write)
         int      0x80        ;call kernel
         mov      [name], dword 'Wanj'     ; Changed the name to Wanj Sus
;writing the name 'Wanj Sus'
         mov      edx,8       ;message length
         mov      ecx,name    ;message to write
         mov      ebx,1       ;file descriptor (stdout)
         mov      eax,4       ;system call number (sys_write)
         int      0x80  ;call kernel
         mov      eax,1 ;system call number (sys_exit)
         int      0x80  ;call kernel
section .data
name db 'Nyag Sus' ; 
;
; Exercise­ explain what this program does
