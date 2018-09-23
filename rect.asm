section .text

 global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point



call creatScreen

mov rdx,15
mov rbx,2
mov rcx,75-15
mov rbp,7
call rect




call refreshScreen



call exits
                
creatScreen:

mov rcx,10
mov rbx,msg
mov al,10
creatScreen1: 
mov[rbx],al
add rbx,76
clc
dec rcx
cmp rcx,0
jnz creatScreen1
ret
  

         refreshScreen:     
 mov rdx, 76*10   ;message length
 mov rcx, msg    ;message to write
call printf         
ret       

pset:
push rax
push rbx
push rcx
push rdx
push rdi
push rsi
push rbp

cmp rbx,9
ja pset1
cmp rbx,0
jb pset1

cmp rdx,74
ja pset1
cmp rdx,0
jb pset1


push rax
push rdx
push rcx
xor rdx,rdx
xor rcx,rcx
mov rax,76
clc 
mul rbx
mov rbx,rax
pop rcx
pop rdx
pop rax
clc 
add rbx,rdx
mov rdx,msg
clc
add rbx,rdx
mov [rbx],al



pset1:
pop rbp
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rax
ret
   
   printf:

 mov rbx, 1     ;file descriptor (stdout)
 mov rax, 4     ;system call number (sys_write)
 int 0x80        ;call kernel
   ret
   
   
   line:
   
   push rax
push rbx
push rcx
push rdx
push rdi
push rsi
push rbp


cmp rbx,9
ja lineError
cmp rbx,0
jb lineError

cmp rdx,74
ja lineError
cmp rdx,0
jb lineError

cmp rcx,74
ja lineError
cmp rcx,0
jb lineError


line1:
mov al,' '
call pset
inc rdx
cmp rdx,rcx
jnz line1

lineError:

pop rbp
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rax
ret

rect:
push rax
push rbx
push rcx
push rdx
push rdi
push rsi
push rbp

cmp rbp,9
ja rectError
cmp rbp,0
jb rectError

rect1:
call line
inc rbx
cmp rbx,rbp
jnz rect1
rectError:

pop rbp
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rax
ret



exits:       
 mov rax, 1     ;system call number (sys_exit)
 int 0x80        ;call kernel
                


section .data



msg times 15*76 db '*';our dear string
len equ $ - msg ;length of our dear q
