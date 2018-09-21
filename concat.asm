section .text

 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point


mov rdi,msg3
mov rbx,msg
mov rdx,msg2
call CONCAT

    mov rdx,12   ;message length
 mov rcx, msg3    ;message to write
call printf
call exits



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
                
COPYSTR:                
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          mov rcx,255
          mov rsi,rbx
          mov rdi,rdx
          COPYSTR1:
                    mov al,[rsi]
                    cmp al,0                
                    JZ COPYSTR2
                    mov [rdi],al
                    inc rdi                
                    inc rsi                
                    dec rcx                
                    JNZ COPYSTR1
          COPYSTR2:
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
          RET                
          
         CONCAT:                
          push rax                
          push rbx                
          push rcx                
          push rdx                
          push rdi                
          push rsi                
          push rbp                
          xchg rdx,rdi
          call COPYSTR
          call LEN                
          xchg rbx,rdi 
          clc                
          add rdx,rax
          call COPYSTR
          call LEN                
          clc                
          add rdx,rax
                          
          xchg rdx,rbx
          xor al,al
          mov [rbx],al
          pop rbp                
          pop rsi                
          pop rdi                
          pop rdx                
          pop rcx                
          pop rbx                
          pop rax                
          RET                
                 
          
          
          
   
   printf:

 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
   ret
   
   
exits:       
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel
                


section .data



msg db 'hello ',0 ;our dear string
len equ $ - msg ;length of our dear q
msg2 db 'world ',13,10,0 ;our dear string
msg3 db 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',0 ;our dear string
