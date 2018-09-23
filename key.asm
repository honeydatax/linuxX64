section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
          mov rsi,msg
          mov rdi,msg1
          mov rcx,11
          mov rdx,5
          call KEY           
                          

 mov rdx, 15 ;message length
 mov rcx, msg    ;message to write
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
                
                



                            
KEY:                
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          mov rbx,rdi
          mov rbx,keycounter1

          KEY3:                
                    mov [rbx],rdi
                    mov [rbx+8],rdx
                    KEY1:                
                              mov al,[rsi]
                              mov ah,[rdi]
                              clc                
                              add al,ah
                              mov [rsi],al
                              inc rsi                
                              inc rdi                
                              dec rdx                
                              cmp rdx,0                
                              JNZ KEY2                
                              mov rdx,[rbx+8]
                              mov rdi,[rbx]
                              KEY2:                
                              dec rcx                
                              cmp rcx,0                
                              JNZ KEY1                
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
msg1 db 10,11,12,13,14,15,0
msg2 db 0 ,'__________________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string

          keycounter1 dq 0
          keycounter2 dq 0
          keycounter3 dq 0
