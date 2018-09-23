section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point


mov rbx,10
 mov rcx,number    ;message to write
fors:



call printf

inc rcx
dec rbx
cmp rbx,0
jnz fors


call exit



printf:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
 mov rdx, 1    ;message length

 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
           pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
ret


exit:
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel
ret


section .data

endf db " "

number db 'A','D','F','H','P','U','M','+','!','0','0','0','0','0','0'
msg db '__________________________________________',0xa ;our dear string
len equ $ - msg ;length of our dear string