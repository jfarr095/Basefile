.thumb
.align

.global NewWrankIconGetter
.type NewWrankIconGetter, %function

.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

.equ ReturnPoint,0x80877B9

NewWrankIconGetter:
@we broke r3 so
@mov r3,r1
@and now we do the vanilla func verbatim until the point we need

ldr r0,=#0x2003BFC
ldr r0,[r0,#0xC]
add r0,#0x28
add r0,r0,r1
ldrb r5,[r0]
lsl r4,r2,#5
add r0,r4,r6
lsl r0,r0,#1
ldr r2,=#0x2003D2C
mov r8,r2
add r0,r8
mov r3,#4 @sheet ID
lsl r3,r3,#8 @shifted left 8 bits
orr r1,r3
mov r2,#0xA0
lsl r2,r2,#7

ldr r3,=ReturnPoint
bx r3

.ltorg
.align

