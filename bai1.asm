.model small
.stack 100h
.data
    tb1 db 'nhap ten:$'
    tb2 db 10,13,'hien thi ten:$'
    ten db 50,0,50 dup('$') 
    tb3 db 10,13,'nhap n:$'  
    tb4 db 10,13,'ket qua:$'  
    kq dw ?
    n dw ?
.code 

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    mov ah,10
    lea dx,ten
    int 21h
    
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,9
    lea dx,ten+2
    int 21h   
    
    mov ah,9
    lea dx, tb3
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    xor bh,bh
    mov n,bx
    
    xor ax,ax
    mov cx,n 
    sub cx,48
    mov ax,1
    mov bx,1
    lap:
    mul bx
    inc bx
    loop lap
    
    mov kq,ax
    ;ket qua
    
    mov ah,9
    lea dx,tb4
    int 21h
    
    xor ax,ax
    mov ax,kq
    mov bx,10
    xor cx,cx 
    xor dx,dx
    lap1: 
    mov dx,0
    div bx 
    push dx 
    inc cx
    cmp al,0
    je ra
    jmp lap1
    
    ra:  
    xor dx,dx 
    lap2:
    mov ah,2
    pop dx
    add dl,48
    int 21h
    loop lap2
    
    ;exit
    mov ah,4ch
    int 21h 
main endp
end main