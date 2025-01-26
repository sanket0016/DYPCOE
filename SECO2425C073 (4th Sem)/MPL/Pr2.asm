section .data
msg1 db "Enter 5 64 bit numbers",10,13,0;Added Null Terminator
len1 equ $-msg1
msg2 db "Enter 5 64 bit numbers",10,13,0;Added Null Terminator
len2 equ $-msg2
section .bss
array resd 200
counter resb 1

section .text
global _start
_start:
;display
mov Rax,1
mov Rdi,1
mov Rsi,msg1
mov Rdx,len1
syscall
;accept
mov byte[counter],05
mov rbx,00

loop1:
mov rax,0;0 for read
mov rdi,0;0 for Keyboard
mov rsi,array;move pointer to start of array
add rsi,rbx
mov rdx,17
syscall

add rbx,17;to move counter

dec byte[counter]
JNZ loop1

;display
mov Rax,1
mov Rdi,1
mov Rsi,msg2
mov Rdx,len2
syscall
;display
mov byte[counter],05
mov rbx,00

loop2:
mov rax,1;1for write
mov rdi,1;1 for monitor
mov rsi,array
add rsi,rbx
mov rdx,17;16 bit+1 for center
syscall

add rbx,17
dec byte[counter]
JNZ loop2

;exit system call
mov rax,60
mov rdi,0
syscall

