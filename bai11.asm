.model small
.stack 100h
.data
    tb1 db 'nhap chuoi:$'
    tb2 db 10,13,'nhap ki tu can tim:$' 
    tb3 db 10,13,'vi tri:$'
    xuong db 10,13,'$'
    chuoi db 100,0,100 dup('$')
    kyTu db ?
    dem dw ? 
    dem1 dw 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
         
    lea si,chuoi  
    mov cx,0   
    nhap:      
    mov ah,1
    int 21h
    mov [si],al
    cmp al,13
    je thoat
    inc si    
    inc cx
    jmp nhap
    
    thoat:
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,1
    int 21h
    mov kyTu,al
    
       
    lea si,chuoi
    mov dem,cx
    kt:
    xor ax,ax
    cmp cx,0
    je ht
    mov al,[si] 
    xor bx,bx
    mov bl,kyTu
    cmp al,bl 
    je vt
    inc si
    dec cx
    jmp kt
    
    vt:
    xor dx,dx
    mov dx,dem
    xor ax,ax
    mov ax,cx
    sub dx,ax 
    push dx
    mov bx,dem1
    inc bx 
    mov dem1,bx
    dec cx
    inc si
    jmp kt
    
    ht:
    xor cx,cx 
    mov cx,dem1
    inVT: 
    mov ah,9
    lea dx,tb3
    int 21h 
    xor dx,dx
    pop dx
    add dl,48
    mov ah,2
    int 21h
    loop inVT 
    
    mov ah,4ch
    int 21h
    
main endp
end main