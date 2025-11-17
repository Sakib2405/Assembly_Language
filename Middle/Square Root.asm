; Square Root of a number using successive subtraction
; Input: Number in register B
; Output: Root in register C

MVI B, 16H      ; Number = 22 decimal (try changing value)
MVI D, 01H      ; First odd number = 1
MVI C, 00H      ; Root counter = 0

SQRT_LOOP:
    MOV A, B
    SUB D        ; A = B - D
    JC SQRT_END  ; if result < 0 ? exit
    MOV B, A     ; Update B = B - D
    INR C        ; Root++
    INX D        ; D = D + 2 (next odd number)
    JMP SQRT_LOOP

SQRT_END:
    ; Root is in C
    MOV A, C
    ADI 30H      ; convert to ASCII
    OUT 01H      ; print root

HLT
