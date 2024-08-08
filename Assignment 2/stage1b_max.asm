; function stage1b_max
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

         ; this is a place holder - replace "1" with the register holding the return value

         ; r3 equals to the maximum number
         push {r3}

         cmp r0, r1
         movgt r3, r0 ; if r0 > r1

         cmp r2, r3
         movgt r3, r2 ; if r2 > r3

         mov r0, r3
         pop {r3}

         bx lr      