.model small
.stack 100h
.data
a db "Enter first number: $"
b db 10,13,'Enter second number: $'
c db ' is large $'
d db 10,13,'Both numbers are equal.$'
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


    mov ah,9
    lea dx,b
    int 21h
    
    mov ah,1
    int 21h
    sub al,48       
    mov bh,al       

   
    cmp bl,bh
    jg L1
    je L2
    jl L3

L1: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,bl
    add dl,48      
    int 21h
    mov ah,9
    lea dx,c
    int 21h
    jmp exit

L2: 
    mov ah,9
    lea dx,d
    int 21h
    jmp exit

L3: 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,bh
    add dl,48        
    int 21h
    mov ah,9
    lea dx,c
    int 21h
    jmp exit

exit:
    mov ah,4ch
    int 21h

main endp
end main
