include Irvine32.inc  
include macros.inc  
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS  
.model flat,stdcall  
.stack 4096 ;4KB, how many bits basically  
ExitProcess proto,dwExitCode:dword  
BUFFER_SIZE = 50  ;global variable!   
.data ;VARIABLE DECLARATIONS  
buffer byte BUFFER_SIZE dup(?)  
filename byte 80 dup(?)  
fileHandle handle ? ;type is handle, something handler type? idk'  
.code   

main proc ;  

	;find input file name from user
	mWrite "Enter an input filename: "
	mov edx, offset filename
	mov ecx, sizeof filename
	call ReadString
	
	;open input file
	mov edx, offset filename
	call OpenInputFile
	mov fileHandle, eax

	;read file
	mov edx, offset buffer
	mov ecx, offset BUFFER_SIZE
	call ReadFromFile

	; find out how many bytes is in the file
	mov buffer[eax], 0	;insert null terminator IMPORTANT
	mWrite "File Size: "
	call WriteDec	;display the file size
	mWrite " bytes"
	call Crlf
	
	;display the buffer, the contents of the file?
	mWrite "Buffer contains: "
	mov edx, offset buffer
	call WriteString
	call Crlf

	;project 2		3 is the spot where 11 is, 2 is the amount of bytes (digits) 11 is... use the findDigits function to increment this code and add up the values;)
	mov edx, offset buffer[0]
	mov ecx, 2
	call ParseInteger32
	add ebx, eax
	mov edx, offset buffer[3]
	mov ecx, 2
	call ParseInteger32
	add ebx, eax
	mov edx, offset buffer[6]
	mov ecx, 1
	call ParseInteger32
	add ebx, eax
	mov eax, ebx

	mWrite "The sum is: "
	call WriteDec

	;close the file
	close_file:
		mov eax, fileHandle
		mov ebx, edx
		call CloseFile

	call Crlf
	call Crlf

endProgram: 

invoke ExitProcess,0 ;just means return 0, exit_success   

main endp  

end main 