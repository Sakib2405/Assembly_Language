.model small
.stack 100h
.data

a db "Enter first number: $"
b db "Enter second number: $"
c db "The result is: $"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov bl,al
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
             
 
    mul bl
    aam  
    mov bx,ax
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,9
    lea dx,c
    int 21h
    
    mov ah,2
    mov dl,bh 
    add dl,48
    int 21h 
    
    mov ah,2
    mov dl,bl
    add dl,48
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
  