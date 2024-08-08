; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

         ; this is a place holder - replace "1" with the register holding the return value
         ; r3 equals to the mininum number, r4 equals to the maximum number, and r5 = r4 - r3
         push {r3, r4, r5}

         push {r0, r1, r2}
         push {lr}
         bl stage1a_min
         mov r3, r0 ; pass minimum value in r3
         pop {lr}
         pop {r0, r1, r2}

         push {r0, r1, r2}
         push {lr}
         bl stage1b_max
         mov r4, r0 ; pass maximum value in r4
         pop {lr}
         pop {r0, r1, r2}

         sub r5, r4, r3
         mov r0, r5

         pop {r3, r4, r5}
         bx lr