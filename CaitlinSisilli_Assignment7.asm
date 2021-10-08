;AddTwo.asm - adds two 32-bit integers.   
include Irvine32.inc   
.386 ;x86 architecture   
.model flat,stdcall   
.stack 4096 ;4KB   
ExitProcess proto,dwExitCode:dword
.data   
buff dword ?
n dword 10
msg byte "Enter a decimal number:",0
msgs byte "The number of Digits:",0
.code  
main proc
	mov edx,offset msg
	call ReadString
	call WriteString 
	call ReadDec
	mov edx, 0
	mov edx, offset buff
	mov edx,0
	mov edx, offset msgs
	call WriteString
	mov edx,0
	jmp L1
	L1:
	div n
	
	cmp eax,0
	inc ebx
	je L2
	L2:
	mov eax,edx
	call WriteDec
invoke ExitProcess,0   
main endp

end main  