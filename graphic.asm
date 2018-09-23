section .text

 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point



call creatScreen

    mov rdx, 76*10   ;message length
 mov rcx, msg    ;message to write
call printf
call exits
                
creatScreen:
mov rcx,10
mov rbx,msg
mov al,10
creatScreen1: 
mov[rbx],al
add rbx,76
clc
dec rcx
cmp rcx,0
jnz creatScreen1
ret
                
   
   printf:

 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
   ret
   
   
exits:       
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel
                


section .data



msg times 11*76 db '*';our dear string
len equ $ - msg ;length of our dear q
