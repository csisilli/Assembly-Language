;Name: Caitlin Sisilli
;Class: Assembly Language
;AddTwo.asm - adds two 32-bit integers.  
include Irvine32.inc 
include macros.inc 
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS 
.model flat,stdcall 
.stack 4096 ;4KB, how many bits basically 
ExitProcess proto,dwExitCode:dword
sizes = 20 ;global variable!  
.data ;VARIABLE DECLARATIONS 

.code 
main proc 

mWrite "Enter a number: "
call ReadDec
call WriteDec
mov ecx,eax

cmp ecx,20
jg L1


mWrite"The numbers are: "

mov eax, 0
mov ebx, 1


fibonacci:
	call WriteDec
	mWrite " "
	add eax,ebx
	xchg eax, ebx
	loop fibonacci

	jmp endProg


L1:
	mWrite"N should be greater than 20"

endProg: 

invoke ExitProcess,0 ;just means return 0, exit_success  
main endp 
 end main 