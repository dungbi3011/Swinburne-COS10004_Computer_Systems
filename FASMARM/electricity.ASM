macro delay {
local.wait
mov r2, #0x3F0000
.wait:
	sub r2,#1
	cmp r2,#0
	bne.wait
	}

BASE = $3F000000
GPIO_OFFSET = $200000
mov r0,BASE
orr r0,GPIO_OFFSET

mov     r1,#1
lsl     r1,#24
str     r1,[r0,#4]; finished select GPIO18

loop$:
mov     r1,#1
lsl     r1,#18
str     r1,[r0,#28];28=LED ON; 40=LED OFF
delay

mov r1,#1
lsl r1,#18
str r1,[r0,#40] ; 28=LED ON; 40=LED OFF
delay

b loop$

