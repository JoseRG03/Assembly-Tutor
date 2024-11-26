%include	"functions.asm"

SECTION .data
msg1	db	"Please enter your name: ", 0h
msg2	db	"Hello, ", 0h

SECTION .bss
sinput:	resb	255	;	Reserves 255 bytes for the sinput string variable (this will store the user Input)

SECTION .text
global _start

_start:
	mov	eax, msg1	;	Parameter 1 for sprint: Get Message string (msg1)
	call	sprint		;	Calling sprint

	mov	edx, 255	;	Argument 1: Number of bytes to read (Reserve 255 bytes of space for the sinput variable)
	mov	ecx, sinput	;	Argument 2: Variable in which to store input (sinput variable declared in .bss)
	mov	ebx, 0		;	Argument 3: File to read (STDIN file)
	mov	eax, 3		;	Invokes sys_read (kernel opcode 3)
	int	80h

	mov	eax, msg2	;	Prints message 2 
	call	sprint

	mov	eax, sinput	;	Prints the value stored in sprint
	call	sprint

	call	quit
