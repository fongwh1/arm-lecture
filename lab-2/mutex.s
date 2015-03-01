	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
    ldrex r1, [r0]
    cmp r1, #locked
    beq lock_mutex
    mov r3, #locked
    strex r2, r3, [r0]
    cmp r2, 1
    beq lock_mutex

        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
    ldrex r1, [r0] @ without this instruction, it hangs that
    mov r3, #unlocked
    strex r2, r3, [r0]
    cmp r2, 0
    bne unlock_mutex
       
    @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
