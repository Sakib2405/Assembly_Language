.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ; --- Add two BCD numbers ---
    MOV AL, 25H      ; 25 (BCD)
    ADD AL, 47H      ; +47 (BCD)
    DAA              ; Decimal Adjust, AL = 72 (BCD)

    ; --- Convert result in AL to ASCII digits ---
    MOV BL, AL       ; Copy result to BL
    MOV AH, 0
    MOV CX, 0

    ; Divide by 10 to get tens and ones
    MOV AH, 0
    MOV AL, BL
    MOV CL, 0AH      ; divisor = 10
    DIV CL           ; AL/10 -> Quotient in AL, Remainder in AH

    ; AL = tens, AH = ones
    ADD AL, 30H      ; make ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ADD AH, 30H      ; make ASCII from remainder
    MOV DL, AH
    MOV AH, 02H
    INT 21H

    ; --- Exit program ---
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
