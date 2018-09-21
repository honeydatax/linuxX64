section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rbx,msg
call CRIPT

 mov rdx, 50  ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel


                
CRIPT:                
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          mov rcx,0                
          CRIPT1:                
                    mov al,[rbx]
                    cmp al,0                
                    JZ CRIPT2
                             inc al     
                              mov [rbx],al
                              inc rbx                
                              dec rcx                
                              cmp rcx,0                
                              JNZ CRIPT1
                    CRIPT2:      
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

number dq 987654321,0
msg db  'HELLO WORLD',0,0,0,0 ,'__________________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string