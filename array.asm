section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point


mov rcx,10
mov rbx,number
fors:


mov rdx,msg
call str64
call printf

mov rax,8
clc
add rbx,rax
dec rcx
cmp rcx,0
jnz fors


call exit

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

printf:
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
 mov rdx, len    ;message length
 mov rcx, msg    ;message to write
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

number dq 0,1111111111111,2222222222222,3333333333333,444444444444,5555555555555,66666666666666,7777777777777,88888888888888,9999999999999,0,0,0,0,0,0
msg db '__________________________________________',0xa ;our dear string
len equ $ - msg ;length of our dear string