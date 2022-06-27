.model small
.stack 100h
.data

    tb1 db 'nhap chuoi:$'
    tb2 db 10,13,'so luong snt:$'
    chuoi db 100,0,100 dup(0)
    dem dw 0  
    x dw ?
.code 

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    ;nhap chuoi
    lea si,chuoi   
    mov cx,0
    nhap:
    mov ah,1
    int 21h
    cmp al,13
    je ra
    mov bl,al  
    sub bl,48
    mov [si],bl
    inc si 
    inc cx
    jmp nhap
    
    ;xu ly
    ra:
    mov ah,9
    lea dx,tb2
    int 21h
    
    lea si,chuoi
    lap: 
    cmp cx,0
    je hienThi
    xor ax,ax 
    mov al,[si]
    add al,48  
    cmp al,32
    je nhay  
    sub al,48 
    cmp al,1
    je nhay
    cmp al,2
    je cong
    call snt
    dec cx
    inc si
    jmp lap
    
    nhay:
    dec cx 
    inc si
    jmp lap 
    
    cong:
    dec cx 
    inc si 
    mov ax,1
    mov bx,dem
    add ax,bx
    mov dem,ax
    jmp lap
    ;hien thi 
    hienThi:
    mov ax,dem 
    mov bx,10   
    mov cx,0
    lap2:
    mov dx,0
    div bx
    push dx  
    inc cx
    cmp ax,0
    je thoat1
    jmp lap2
    
    thoat1:
    lap3:
    pop dx 
    add dl,48
    mov ah,2
    int 21h
    loop lap3
    
    mov ah,4ch
    int 21h      
main endp 

snt proc
    mov bx,2   
    xor ah,ah
    mov x,ax
    lap1:
    mov dx,0   
    div bx
    mov ax,x
    cmp bx,ax
    je thoat
    cmp dx,0
    je ot
    inc bx
    jmp lap1
    
    ot:
    ret
    
    thoat:
    mov ax,dem
    inc ax
    mov dem,ax
    ret
    
snt endp
end main