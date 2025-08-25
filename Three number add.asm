.model small
.stack 100h
.data
a db ?
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov bl,al  
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,1
    int 21h
    mov cl,al  
    
    add bl,bh ;bl=bl+bh
    sub bl,48
    
    mov ch,bl  
    add cl,ch
    sub cl,48
    mov a,cl
    
    mov ah,2
    mov dl,a  
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    
    
    
    
    
    