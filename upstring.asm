section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rcx,len
mov rbx,msg
call UPPERSTRING

 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel

                
UPPERSTRING:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          mov rcx,0                
          UPPERSTRING1:
                    mov al,[rbx]
                    cmp al,0                
                    JZ UPPERSTRING2
                    cmp al,'a'
                    JB UPPERSTRING3
                    cmp al,'z'
                    JA UPPERSTRING3
                    mov ah,'a'-'A'
                    sub al,ah
                    mov [rbx],al
                    UPPERSTRING3:
                    inc rbx                
                    inc rcx                
                    cmp rcx,255
                    JNZ UPPERSTRING1
          UPPERSTRING2:
          mov rax,rcx
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
          RET                
                
                
                
                
                     

                
                
                

section .data

endf db " "

number dq 987654321,0
msg db 'this is a string._________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string



