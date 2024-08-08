BASE = $3F0000000
GPIO_OFFSET = $200000
mov     r0,BASE
orr     r0,GPIO_OFFSET

mov     r1,#1
lsl     r1,#24
str     r1,[r0,#4]; finished select GPIO18

mov     r1,#1
lsl     r1,#18
str     r1,[r0,#28];28=LED ON; 40=LED OFF

