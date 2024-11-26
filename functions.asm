
;-------------------------------
; int slen(String message)
; String length calculation function
slen:
	push	ebx
	mov	ebx, eax

nextchar:
	cmp	byte [eax], 0
	jz	finished
	inc	eax
	jmp	nextchar

finished:
	sub	eax, ebx
	pop	ebx
	ret

; -----------------------------
; void sprint(String message)
; String printing function
sprint:
	push	edx	;	Stores all register within the stack
	push	ecx	;	What's the point of storing all these?
	push	ebx
	push	eax
	call	slen

	mov	edx, eax	; What is being inserted here... (This stores the message length)
	pop	eax

	mov	ecx, eax	; ...as opposed to here? (This stores the message itself)
	mov	ebx, 1
	mov	eax, 4		; Calls sys_write with params 
	int	80h

	pop	ebx
	pop	ecx
	pop	edx
	ret

; ----------------------------
; void sprintLF(String message)
; String printing with line feed function
sprintLF:
	call	sprint	; 	Prints the string passed through params

	push	eax	;	Stores string in stack
	mov	eax, 0Ah ;	Saves line delimiter/linefeed onto eax, however since these need to be 4 bytes it stores 0000000Ah
	push	eax	;	When pushing eax onto the stack, the linefeed is stored in bytes in the order 0Ah, 0h, 0h, 0h
	mov	eax, esp ;	By saving the current stach pointer, we get the adress of 0Ah (the linefeed) directly
	call	sprint
	pop	eax	;	Removes linefeed from stack
	pop	eax	;	Restires eax to its value before calling the function
	ret

; ----------------------------
; void exit()
; Exit program and restore resources
quit:
	mov	ebx, 0
	mov	eax, 1 ;	Call sys_exit
	int	80h
	ret
