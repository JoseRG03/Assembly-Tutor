%include	"functions.asm"

SECTION .text
global _start

_start:
	pop	ecx		; Since the first value of the stack is the number of arguments, this can me skipped

nextArg:
	cmp	ecx, 0h		; Checks if there's an argument remaining
	jz	noMoreArgs	; If the previous compare shows the values are the same, it jumps to the end
	pop	eax		; Removes the argument off of the stack
	call	sprintLF	; Prints said argument (Wasn't it just popped off?)
	dec	ecx		; Decreases ecx to the address of the next argument (decreases remaining arguments by 1)
	jmp	nextArg		; Returns to the start of the loop

noMoreArgs:
	call	quit
