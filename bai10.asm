.model small
.stack 100h
.data
    tb1 db 'nhap chuoi 1:$'
    tb2 db 10,13,'nhap chuoi 2:$'
    tb3 db 10,13,'2 chuoi giong nhau$'
    tb4 db 10,13,'2 chuoi khac nhau$'
    chuoi1 db 100,0,100 dup('$')
    chuoi2 db 100,0,100 dup('$') 
    dem1 dw ?
    dem2 dw ?
    
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov es,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    mov ah,10
    lea dx,chuoi1
    int 21h
    xor cx,cx
    mov cl,[chuoi1+1] 
    mov dem1,cx 
    
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,10
    lea dx,chuoi2
    int 21h
    xor cx,cx
    mov cl, [chuoi2+1]
    mov dem2,cx
    
    mov ax,dem1
    mov bx,dem2
    cmp ax,bx
    je kt
    mov ah,9
    lea dx,tb4
    int 21h
    jmp thoat
    kt:
    xor ax,ax
    xor bx,bx
    mov cx,dem1
    lea si,chuoi1+2
    lea di,chuoi2+2
    repe cmpsb
    je ht
    mov ah,9
    lea dx,tb4
    int 21h
    jmp thoat
    ht:
    mov ah,9
    lea dx,tb3
    int 21h
    
    thoat:
    mov ah,4ch
    int 21h
main endp
end main