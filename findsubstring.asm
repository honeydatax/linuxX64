section .text
 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
mov rdx,msg2
mov rbx,msg
call FINDSTRING


 mov rdx, 10   ;message length
 mov rcx,rax   ;message to write
 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel



LEN:                
          push rbx                
          push rcx                
          push rdx             
                    
          push rsi         
          push rdi
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
          pop rdi                
          pop rsi          
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
                    JZ COMPSTRING3
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
          mov al,1                
          jmp COMPSTRING5
          COMPSTRING3:
          mov al,0                
          jmp COMPSTRING5
          COMPSTRING4:
          mov al,2                
          COMPSTRING5:
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
          push rbp         
          mov rbp,rdx       
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
         
         
          FINDSTRING1:
                    mov rax,rdi
                   
                     call FINDCHAR
                    cmp rax,0ffffh
                    
                    JZ FINDSTRING8
                    clc                 
                    add rbx,rax
                   mov rdx,rbp
                    call COMPSTRING
                    cmp al,0

                    JZ FINDSTRING10
                    
                    inc rbx         
                    
                    jmp FINDSTRING1
                    FINDSTRING10:
                    mov rax,rbx
                    FINDSTRING8:
                    pop rbp
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


