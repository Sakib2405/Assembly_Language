.model small
.stack 100h
.data
a db 'Enter something that contains 2 words or number: $'
b db 10,13,'Exchange value is: $'
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,2
    xchg bl,bh
    mov dl,bl
    int 21h
    mov dl,bh
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    