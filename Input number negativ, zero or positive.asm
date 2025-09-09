.model small
.stack 100h
.data
msg db 'Enter a number: $'
a db 10,13,'Positive$'
b db 10,13,'Zero$'
c db 10,13,'Negative$'

.code
main proc
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,msg
    int 21h

    mov ah,1
    int 21h
    cmp al,'-'
    je IsNegative
    sub al,30h
    mov bl,al
    jmp CheckNumber

IsNegative:
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al
    neg bl

CheckNumber:
    cmp bl,0
    jg Positive
    jl Negative
    je Zero

Positive:
    mov ah,9
    lea dx,a
    int 21h
    jmp Exit

Negative:
    mov ah,9
    lea dx,c
    int 21h
    jmp Exit

Zero:
    mov ah,9
    lea dx,b
    int 21h

Exit:
    mov ah,4ch
    int 21h

main endp
end main
