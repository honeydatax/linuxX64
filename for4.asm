section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point



mov rbx,cchar
          FFOR:                

                    call cprintff
                    mov al,[rbx]
                    inc al
                    mov [rbx],al
                    cmp al,120
          JB FFOR           
          
          
          
           mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel

cprintff:
push rbx
 mov rdx, len    ;message length
 mov rcx,cchar    ;message to write

 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 pop rbx
ret


section .data


cchar db 20
len equ $ - cchar ;length of our dear string
