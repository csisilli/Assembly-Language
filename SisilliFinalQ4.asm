;AddTwo.asm - adds two 32-bit integers.    
include Irvine32.inc    
include macros.inc
.386 ;x86 architecture    
.model flat,stdcall    

.stack 4096 ;4KB    

ExitProcess proto,dwExitCode:dword 
max_size = 100
.data ;VARIABLE DECLARATIONS
	
array byte max_size dup(?)
mySize dword 10
two dword 2
pivot dword ?

.code
main proc 
	
	call ResetRegisters

	;populate array with random numbers
	mWrite "Initial array is: "
	call Randomize
	populate:
		mov eax, 101
		call RandomRange
		mov array[ebx], al
		inc ebx

		mov al, array[ebx-1]
		call WriteDec
		mWrite" "

		cmp ebx, mySize
		call copybuffer
	


endProgram:

	call Crlf
	mWrite"The number duplicated are by: "
;call DumpRegs

invoke ExitProcess,0 ;just means return 0, exit_success 	
main endp
copybuffer PROC


    pushad
   
L3:
    mov al,array[ebx]
    mov array[ebx],dl      ; Store byte in array copy
    inc esi             ; point to the next byte
    loop    L3
    popad
    ret
copybuffer   ENDP
;FUNCTION ZONE

ResetRegisters proc
	;reset registers
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

ret
ResetRegisters endp

end main   