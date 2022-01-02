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
question BYTE "Would you like to open the file?",0
answer DWORD ?
.code  
main proc 
mWrite"Enter a decimal number: "
call ReadDec

mov edx,eax
push " "
mWrite"Enter a decimal number: "
call ReadDec

push " "
mul eax
call WriteDec


invoke ExitProcess,0 ;just means return 0, exit_success   
main endp  
end main  