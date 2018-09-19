section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
 mov rbx, msg
      mov rcx,52
          mov al,'*'
          call fillchar

 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel

fillchar:
          push rax                
          push rbx                
          push rcx                
          FILLCHAR1:
                    mov [rbx],al
                    inc rbx                
                    dec rcx                
                    JNZ FILLCHAR1
          pop rcx                
          pop rbx                
          pop rax                
          RET                
                
                

section .data



msg db 'im love marina.',0xa ;our dear string
len equ $ - msg ;length of our dear string