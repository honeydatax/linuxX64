section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
                  
          mov rdi,msg
          clc                
          add rdi,7                
          mov rsi,rdi
          clc                
          add rsi,4                
          mov rcx,18
          call MOVEBACK



 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel


                
MOVEBACK:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
                          
          MOVEBACK1:
                    mov al,[rsi]
                    mov [rdi],al
                    inc rsi                
                    inc rdi                
                    dec rcx                
                    cmp rcx,0                
                    JNZ MOVEBACK1
                          
          pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
          RET       
                
                
                     

                
                
                

section .data

endf db " "
hhex db "0123456789ABCDEF.",0

number dq 987654321,0
msg db 'abcdefghijk_________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string



