section .text

 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point





    mov rdx, len    ;message length
 mov rcx, msg    ;message to write
call printf
call exits
                

                
   
   printf:

 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
   ret
   
   
exits:       
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel
                


section .data



msg times 512 db '*';our dear string
len equ $ - msg ;length of our dear q
