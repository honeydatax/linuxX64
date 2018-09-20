section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rdx,msg2
mov rbx,msg
call FINDCHAR

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
                
                



           FINDCHAR:
          push rbx                
          push rcx                
          push rdx                
          mov rcx,0                
          mov ah,al
          FINDCHAR1:
                    mov al,[rbx]
                    cmp al,0                
                    JZ FINDCHAR2
                    cmp al,ah
                    JZ FINDCHAR3
                    inc rbx                
                    inc rcx                
                    cmp rcx,255
                    JNZ FINDCHAR1
          FINDCHAR2:
          mov rcx,0ffffh
          FINDCHAR3:
          mov rax,rcx
          pop rdx                
          pop rcx                
          pop rbx                
          RET                
                
                
                
            COMPSTR:                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          mov rcx,0                
          mov rsi,rbx
          mov rdi,rdx
          COMPSTR1:
                    mov al,[rsi]
                    mov ah,[rdi]
                    cmp al,0                
                    JZ COMPSTR2
                    cmp ah,0                
                    JZ COMPSTR2
                    cmp al,ah
                    JNZ COMPSTR2
                    inc rdi                
                    inc rsi                
                    inc rcx                
                    cmp rcx,0                
                    JNZ COMPSTR1
          COMPSTR2:
          mov rax,rcx
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          RET                
                    
                
         FINDSTRING:
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          mov rsi,rdx
          xor rax,rax
          mov al,[rsi]
          mov rdi,rax
          mov rsi,rbx
          mov rbx,rdx
          call LEN
          cmp rax,0                
          JNZ FINDSTRING9
          mov rax,0ffffh
          jmp  FINDSTRING8
          FINDSTRING9:
          mov rbx,rsi
          mov rsi,rax
          FINDSTRING1:
                    mov rax,rdi
                    call FINDCHAR
                    cmp rax,0ffffh
                    JZ FINDSTRING8
                    clc                 
                    add rbx,rax
                    call COMPSTR
                    cmp rsi,rax
                    JZ FINDSTRING10
                    inc rbx                
                    jmp FINDSTRING1
                    FINDSTRING10:
                    mov rax,rbx
                    FINDSTRING8:
                    pop rsi                
                    pop rdi                
                    pop rdx                
                    pop rcx                
                    pop rbx                
                                    
                    RET                
                
                           
                
                
                     

                
                
                

section .data

endf db " "

number dq 987654321,0
msg db 'THIS IS A STRING _________________________________',0xa,0,0 ;our dear string
len equ $ - msg ;length of our dear string
msg2 db 'STRING',0


