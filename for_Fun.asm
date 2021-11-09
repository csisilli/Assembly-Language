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

mov ecx,eax 

mWrite "Enter a number: " 

call ReadDec 

mov ebx,eax 

mov eax,ecx 

cmp eax,20 

jmp loops 

  

loops: 

  

  

mov edx, eax 

add eax,ebx 

add ebx,eax 

dec ecx 

cmp ecx,0 

jmp check 

  

jmp L1 

jb loops 

check: 

cmp eax,20 

jb loops 

jmp L1 

L1: 

mWrite"N should be greater than 20" 

call WriteDec 

invoke ExitProcess,0 ;just means return 0, exit_success   

main endp  

end main 