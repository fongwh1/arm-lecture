	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}
    cmp r0, #2
    bmi RET
    mov r1, #0
    mov r2, #1
Loop:
    add r1, r1, r2
    eors r1, r1, r2
    eors r2, r1, r2
    eors r1, r2, r1
    sub r0, r0, #1
    cmp r0, #1
    bne Loop
    mov r0, r2
RET:
	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
