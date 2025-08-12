.model small
.stack 100h
.data

a db "Enter first number: $"
b db "Enter second number: $"
c db "The result is: $"
d db "Quotient: $"
e db "Remainder: $"
newline db 0dh, 0ah, "$"

.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'   
    mov bl, al    
    
    
    mov ah, 9
    lea dx, newline
    int 21h

    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ah, 1
    int 21h
    sub al, '0'   
    mov bh, al    
    
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    
    mov ax, 0     
    mov al, bh    
    div bl        
    
    
    mov ah, 9
    lea dx, c
    int 21h
    
    mov ah, 9
    lea dx, newline
    int 21h
   
    mov ah, 9
    lea dx, d
    int 21h
    
    mov dl, al    
    add dl, '0'   
    mov ah, 2     
    int 21h
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    mov ah, 9
    lea dx, e
    int 21h
    
    mov dl, ah    
    add dl, '0'   
    mov ah, 2     
    int 21h
    
    ; Print a new line
    mov ah, 9
    lea dx, newline
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main