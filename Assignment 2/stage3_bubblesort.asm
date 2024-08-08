; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

        ; your function must mov the address of the sorted array to r0
        push {r3 ,r4 , r5 , r6 , r7}
        mov r4, r1
        mov r5, #0
        loops3:
        cmp r5,#32
        bge exits3
        ldr r3,[r4,r5]
        add r7,r5,#4
        ldr r6,[r4,r7]
        cmp r3,r6
        bls nexts3
        bge swap
        swap:
                str r6,[r4,r5]
                str r3,[r4,r7]
                mov r5,#0
                b loops3
        nexts3:
                add r5,r5,#4
                b loops3
        exits3:
                mov r1, r0 ; size
                mov r0, r2 ; BASE
                mov r2, r4 ; array
                bl stage2_flash_array
    pop{r3,r4,r5,r6,r7}

    bx lr