;AddTwo.asm - adds two 32-bit integers.    
include Irvine32.inc    
.386 ;x86 architecture    
.model flat,stdcall    
.stack 4096 ;4KB    
ExitProcess proto,dwExitCode:dword    
.data    
prompt BYTE "Enter a number: ",0
promp BYTE "Enter a second number: ",0
msgs BYTE "The add numbers are: ",0
.code   

main proc 
;ask user to enter a char and print it
	;call ReadChar
	;call WriteChar
	mov ebx, 0
	mov eax, 0
	mov edx, 0
	mov edx, offset prompt
	call WriteString
	
	call ReadDec
   mov ebx,eax
   mov edx, offset promp
	call WriteString
	call ReadDec
	mov edx,0
	 add eax, ebx

	mov edx, offset msgs
	call WriteString
	call WriteDec

	mov eax,0
	add ebx,edx

	
invoke ExitProcess,0    
main endp
init proc 

init endp

end main     