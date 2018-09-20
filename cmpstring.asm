section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rcx,9
mov rbx,msg1
mov rdx,msg2
call COMPSTRING
mov rbx,number
mov [rbx],rax
mov rdx,msg
call str64
 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel

str64:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          mov rsi,rbx
          mov rdi,rdx
          mov rax,[rsi]
          mov rbp, 1000000000000000000
          STR321:                
                    xor rdx,rdx
                    xor rcx,rcx
                    mov rbx,rbp
                    clc                 
                    div rbx                
                    mov rsi,rdx
                    mov ah,'0'
                    clc                
                    add al,ah
                    mov [rdi],al
                    inc rdi                
                    mov rax,rbp
                    xor rdx,rdx
                    xor rcx,rcx
                    mov rbx,10
                    clc                
                    div rbx                
                    mov rbp,rax
                    mov rax,rsi
                    cmp rbp,0
                    JNZ STR321

          pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
ret

           COMPSTRING:
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          mov rcx,0                
          mov rsi,rbx
          mov rdi,rdx
          COMPSTRING1:
                    mov al,[rsi]
                    mov ah,[rdi]
                    cmp al,0                
                    JZ COMPSTRING2
                    cmp ah,0                
                    JZ COMPSTRING2
                    cmp al,ah
                    JNZ COMPSTRING2
                    inc rdi                
                    inc rsi                
                    inc rcx                
                    cmp rcx,0                
                    JNZ COMPSTRING1
          COMPSTRING2:
          cmp al,ah
          JZ COMPSTRING3
          JB COMPSTRING4
          mov rax,1                
          jmp COMPSTRING5
          COMPSTRING3:
          mov rax,0                
          jmp COMPSTRING5
          COMPSTRING4:
          mov rax,2                
          COMPSTRING5:
                    pop rsi                
                    pop rdi                
                    pop rdx                
                    pop rcx                
                    pop rbx                
                    RET                
                
                
                     

                
                
                

section .data

endf db " "

number dq 987654321,0
msg db '__________________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string
msg1 db 'string is =_',0xa,0,0
msg2 db 'string is not =_',0xa,0,0


