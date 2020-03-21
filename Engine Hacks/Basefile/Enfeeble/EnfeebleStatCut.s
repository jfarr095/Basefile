.thumb

.macro blh to, reg=r3
	ldr \reg, =\to
	mov lr, \reg
	.short 0xF800
.endm

push {r4-r6, lr}
mov r4, r0 @stat
mov r5, r1 @unit
ldr r6, EnfeebleStatus

@get status byte
mov r0,#0x30
add r0,r5
ldrb r0,[r0]
mov r3,r0

lsl r0,r3,#28
lsr r0,r0,#28 @r0 = status ID
cmp r0,r6
bne GoBack

@subtract status duration from stat
lsr r0,r3,#4 @r0 = status duration
sub r4,r0

GoBack:
mov r0, r4
mov r1, r5
pop {r4-r6,pc}

.ltorg
.align
EnfeebleStatus:
@WORD Enfeeble
