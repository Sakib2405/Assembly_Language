; Fibonacci series in 8080 Assembly
; Prints first 10 terms

MVI C, 0AH       ; Counter = 10 terms
MVI D, 00H       ; First term = 0
MVI E, 01H       ; Second term = 1

; --- Print first term (D) ---
MOV A, D
ADI 30H          ; Convert to ASCII
OUT 01H
MVI A, ' '       ; Print space
OUT 01H

; --- Print second term (E) ---
MOV A, E
ADI 30H
OUT 01H
MVI A, ' '
OUT 01H

; --- Generate next terms ---
FIBO_LOOP:
    MOV A, D     ; A = prev term
    ADD E        ; A = D+E
    MOV D, E     ; Shift D <- E
    MOV E, A     ; E <- New term

    ; Print the new term
    MOV A, E
    ADI 30H
    OUT 01H
    MVI A, ' '
    OUT 01H

    DCR C
    JNZ FIBO_LOOP

HLT
