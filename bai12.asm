.model small
.stack 100h
.data
    tb1 db 'nhap chuoi:$'
    tb2 db 10,13,'do dai chuoi la:$'
    chuoi db 100,0,100 dup('$')
    dem dw ?
    
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
    inc cx
    inc si
    jmp nhap
    
    thoat:  
    mov ah,9
    lea dx,tb2
    int 21h
    mov dem,cx
    
    mov ax,dem
    mov bx,10
    mov cx,0
    ht:
    mov dx,0
    div bx  
    inc cx  
    push dx
    cmp ax,0
    je ex
    jmp ht
    
    ex:
    xor dx,dx
    pop dx
    add dl,48
    mov ah,2
    int 21h
    loop ex
    
    mov ah,4ch
    int 21h 
main endp
end main