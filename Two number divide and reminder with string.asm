.model small
.stack 100h
.code

main proc
    mov al,8
    mov bl,3
    div bl
    
    mov cl,al
    mov ch,ah
    
    mov ah,2
    mov dl,cl
    add dl,48
    int 21h
    mov dl,ch 
    add dl,48
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main