section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rbx,msg
mov al,'#'
mov rcx,12
call STRING

 mov rdx, 25 ;message length
 mov rcx, msg   ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel


LEN:                
          push rbx                
          push rcx                
          push rdx                
          mov rcx,0                
          LEN1:                
                    mov al,[rbx]
                    cmp al,0                
                    JZ LEN2                
                    inc rbx                
                    inc rcx                
                    cmp rcx,0                
                    JNZ LEN1                
          LEN2:                
          mov rax,rcx
          pop rdx                
          pop rcx                
          pop rbx                
          RET                
                
                



            STRING:                
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          STRING1:                
                    mov [rbx],al
                    inc rbx                
                    loop STRING1
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
msg db  'HELLO WORLD',0,0,0,0
msg2 db 0 ,'__________________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string