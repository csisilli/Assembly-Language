include Irvine32.inc  
include macros.inc  
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS  
.model flat,stdcall  
.stack 4096 ;4KB, how many bits basically  
ExitProcess proto,dwExitCode:dword  
buffer = 10
point STRUCT
		sname BYTE buffer dup(?)
		sgrade BYTE 20 dup(?)
		point ENDS
.data ;VARIABLE DECLARATIONS 

p point<>

.code  
main proc
mWrite "The students name is: "
mov ecx, buffer
mov edx, offset p.sname
call ReadString
mWrite "The students grade is: "
mov ecx,2
mov edx, offset p.sgrade
call ReadString
call Crlf
mov ecx, buffer
mov edx, offset p.sname
call WriteString
mWrite " student grade is this: "

mov ecx, 2
 mov edx, offset p.sgrade
 call WriteString
 call Crlf
 call Crlf


invoke ExitProcess,0 ;just means return 0, exit_success   

main endp  

end main  