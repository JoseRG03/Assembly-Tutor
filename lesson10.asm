%include "functions.asm"

SECTION .text
global _start

_start:
	mov	ecx, 0		;	Initializes counter at 0

nextNumber:
	inc	ecx		;	Increases counter by 1

	mov	eax, ecx	;	Stores ecx value in eax so as to not alter ecx with the following addition
	add	eax, 48		;	Adds 48 to eax to get number value in ascii
	push	eax		;	Since sprintLF requires a memory address and not its direct value, we need to store eax somewhere. For this we will use the stack
	mov	eax, esp	;	Get the address of eax within the stack
	call	sprintLF

	pop	eax		;	Remove the memory address of eax from the stack, leaving only the counter number + 48
	cmp	ecx, 10		;	Is counter equal to 10?
	jne	nextNumber	;	If not, return to the start of the function

	call	quit
