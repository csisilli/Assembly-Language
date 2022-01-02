;Name: Caitlin Sisilli 
;Class: Assembly Language 
;AddTwo.asm - adds two 32-bit integers.   
include Irvine32.inc  
include macros.inc  
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS  
.model flat,stdcall  
.stack 4096 ;4KB, how many bits basically  
ExitProcess proto,dwExitCode:dword 

.data ;VARIABLE DECLARATIONS  
.code  
main proc 

mov eax,0
mov edx,0
mov ebx,0
mov ecx,0

mWrite"Enter a three-digit integer: "
call ReadDec
call WriteDec
mov edx, eax


jmp check
check:
add edx,eax
sub edx,eax
cmp eax,edx
jmp l1
l1:
mWrite" is a palindrome"



invoke ExitProcess,0 ;just means return 0, exit_success   
main endp  
end main  