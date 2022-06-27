.model small
.stack 100h
.data
    tb1 db 'nhap ten:$'
    tb2 db 10,13,'hien thi ten:$'
    ten db 50,0,50 dup('$') 
    tb3 db 10,13,'nhap chuoi:$'  
    tb4 db 10,13,'ket qua:$'  
    kq dw ?
    chuoi db 100,0,100 dup(0)
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
    
    ;nhap chuoi 
    lea si,chuoi 
    mov cx,0
    nhap:
    mov ah,1
    int 21h
    mov [si],al
    cmp al,13
    je tong
    inc si
    inc cx
    jmp nhap
    
    ;xu ly chuoi 
    tong:
    lea si,chuoi
    xor ax,ax 
    xor bx,bx
    XL:   
    cmp cx,0
    je thoat
    mov al,[si] 
    cmp al,32
    jne tinh
    inc si
    dec cx
    jmp XL
    tinh: 
    sub al,30h
    add ax,bx
    mov bx,ax  
    mov kq,ax 
    inc si
    dec cx
    jmp XL

    thoat:   
    mov ah,9
    lea dx,tb4
    int 21h
    mov ax,kq
    mov bx,10    
    mov cx,0  
    
    chia: 
    mov dx,0
    div bx
    push dx
    inc cx 
    cmp ax,0
    je ht
    jmp chia
    
    ht:
    pop dx
    add dl,48
    mov ah,2
    int 21h
    loop ht
    
    ;exit
    mov ah,4ch
    int 21h 
main endp
end main