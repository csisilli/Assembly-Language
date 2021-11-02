;AddTwo.asm - adds two 32-bit integers.  
include Irvine32.inc 
include macros.inc 
.386 ;x86 architecture, SEMI COLONS ARE COMMENTS 
.model flat,stdcall 
.stack 4096 ;4KB, how many bits basically 
ExitProcess proto,dwExitCode:dword
sizes = 50 ;global variable!  
.data ;VARIABLE DECLARATIONS 
array dword 010d, 060d,020d,033d,072d,089d,045d,065d,072d,018d
.code 
main proc 
mov ebx,0
mov ecx,0
mov eax,0
mov edx,0


mov ecx,sizeof array
L1:
cmp array[ebx], 50 
mov eax, array[ebx]
jle subs


inc ebx 
loop L1



subs:
add edx, array[ebx]
dec ebx


invoke ExitProcess,0 ;just means return 0, exit_success  
main endp 
 end main 