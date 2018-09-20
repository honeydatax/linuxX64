section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rax,15000
mov rbx,msg
call debugs



 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel


                
HEXX:                
          push rax                
          push rbx                
          push rdx                
          push rsi                
          push rdi                
          inc rbx                
          xor ah,ah
          mov rdx,rax
          and rax,0fh
          mov rsi,hhex
          clc                
          add rsi,rax 
          mov al,[rsi]
          mov [rbx],al
          dec rbx                
          mov rax,rdx
          and rax,0f0h
          shr rax,4                
          mov rsi,hhex
          clc                
          add rsi,rax 
          MOV al,[rsi]
          mov [rbx],al
                          
          pop rdi                
          pop rsi                
          pop rdx                
          pop rbx                
          pop rax                
          RET                
                
                           
          debugs:                
push rax                
push rbx                
push rcx                
push rdx                
inc rbx                
inc rbx                
mov rdx,rax
and rax,0ffh
call HEXX    
dec rbx                
dec rbx                
mov rax,rdx
and rax,0ff00h
shr rax,8                
call HEXX                
pop rdx                
pop rcx                
pop rbx                
pop rax                
RET                
                  
                
                     

                
                
                

section .data

endf db " "
hhex db "0123456789ABCDEF.",0

number dq 987654321,0
msg db '_________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string



