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

        push {r3, r4, r5, r6, r7, r8, r9, r10, r11, r12}

        mov r4, r1 ; array
        mov r6, r2; saving BASE address in r6
        mov r7, r0 ; saving size of array
        mov r8, #0 ; index r8 = i
        mov r11, #28 ; final index 

        loops3:
            mov r9, #0 ; index r9 = j 
            sub r12, r11, r8 ; n - i - 1
            loops3j:
                add r10, r9, #4 ; index r10 = j+1
                ldr r3, [r4, r10]
                ldr r5, [r4, r9]
                cmp r3, r5 ; comparing array[j+1] with array[j]   
                bls swap ; swapping if array[j+1] <= array[j]

                add r9, #4
                cmp r9, r12
                blt loops3j

            add r8, #4
            cmp r8, #28
            blt loops3
            bge flashing

        swap: ; input r9 r10
                    str r3, [r4, r9]
                    str r5, [r4, r10]

        flashing: ;; flashing based on new numarray1
            push {r0, r1, r2}   
            push {lr}
            mov r0, r6 ; BASE address of peripherals
            mov r1, r7 ; size of array
            mov r2, r4 ; new numarray1
            bl stage2_flash_array
            pop {lr}
            pop {r0, r1, r2}

        mov r0, r4 ; mov the address of the sorted array to r0
        pop {r3, r4, r5, r6, r7, r8, r9, r10, r11, r12}

       
        bx lr