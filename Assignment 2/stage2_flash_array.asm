; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        ; implement your function here
        ; remember to push any registers you use to the stack before you use them
        ; ( and pop them off at the very end)

        ; your function should make use of the existing functions FLASH and PAUSE

        push {r3, r4, r5, r6, r7}

        mov r4, r2 ; array
        mov r5, #0 ; index of array
        mov r6, $3F000000 ; saving BASE address in r6

        loops2: 
            ldr r3, [r4, r5] ; r3 = array[index]
            push {r0, r1, r2}
            mov r0, r6 ; BASE address
            mov r1, r3 ; number of flashes = array[index]
            mov r2, $30000 ; delay flashes
            push {lr}
            bl FLASH ; flashing "array[index]" times
            pop {lr}
            pop {r0, r1, r2}

            push {r0, r1}
            mov r0, r6 ; BASE address
            mov r1, $200000 ; pause for 2 seconds
            push {lr}
            bl PAUSE ; pause 2 seconds
            pop {lr}
            pop {r0, r1}
            
            add r5, #4 ; index++
            cmp r5, #32
            blt loops2
            bge exits2 ; end of loops2 with 8 times running
        
        exits2:
            pop {r3, r4, r5, r6, r7}

        bx lr
