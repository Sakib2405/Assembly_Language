.model small
.stack 100h
.code

main proc
    mov ah,1
    int 21h
    mov bl,al
    
    int 21h
    mov bh,al
    
    int 21h
    mov cl,al
    
    add bl,bh
    sub bl,48
    
    add bl,cl
    sub bl,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main