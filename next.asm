section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point


mov rcx,0
mov rbx,number
fors:
push rbx
push rcx
push rdx
mov [rbx],rcx

mov rdx,msg
call str64
mov rbx,msg
call ZERO64

call printf
pop rdx
pop rcx
pop rbx

inc rcx
cmp rcx,10
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
       mov rcx,msg
mov rdx,len
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


ZERO64:                
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          mov rcx,18        
          ZERO641:                
                    mov al,[rbx]
                    cmp al,'0'
                    JNZ ZERO642
                    mov al,32
                    mov [rbx],al
                    inc rbx                
                    dec rcx                
                    cmp rcx,0                
                    JNZ ZERO641
          ZERO642:                
          pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
          RET                
                


exit:
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel
ret


section .data

endf db " "

number dq 0,0,0,0,0,0,0
msg db '__________________________________________',0xa ;our dear string
len equ $ - msg ;length of our dear string