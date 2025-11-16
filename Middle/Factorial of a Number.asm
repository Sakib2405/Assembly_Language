.MODEL SMALL
.STACK 100H
.DATA
    NUM DW 5
    MSG DB 'Factorial = $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; --- Calculate Factorial ---
    MOV CX, NUM   ; CX = N
    MOV AX, 1     ; AX = result

FACT_LOOP:
    MUL CX        ; AX = AX * CX
    LOOP FACT_LOOP

    ; --- Print message ---
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; --- Convert result (AX) to decimal string ---
    ; Result stored in AX
    MOV BX, 10        ; divisor
    XOR CX, CX        ; digit counter

CONVERT:
    XOR DX, DX        ; clear remainder
    DIV BX            ; AX ÷ 10 -> quotient=AX, remainder=DX
    PUSH DX           ; store remainder (digit)
    INC CX
    CMP AX, 0
    JNE CONVERT

    ; --- Print digits from stack ---
PRINT_DIGITS:
    POP DX
    ADD DL, 30H       ; convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_DIGITS

    ; --- Exit ---
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
