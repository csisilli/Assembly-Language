;AddTwo.asm - adds two 32-bit integers.    
include Irvine32.inc    
include macros.inc
.386 ;x86 architecture    
.model flat,stdcall    

.stack 4096 ;4KB    

ExitProcess proto,dwExitCode:dword 
max_size = 100
.data ;VARIABLE DECLARATIONS
	
array dword max_size DUP(?)

.code
main proc 
mWrite"The numbers are: "

call Randomize
call WriteDec
mov eax, array
call Crlf
;check if there is any duplicates in the numbers


cmp edx, array
jmp l1

l1:
mov eax, array
mov array,eax
inc edx
loop l1
mWrite"The new numbers are:"
call WriteDec

invoke ExitProcess,0  
main endp
end main    