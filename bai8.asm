.model small
.stack 100h
.data
    tb1 db 'nhap chuoi:$'
    tb2 db 10,13,'chuoi in hoa het:$'
    chuoi db 100,0,100 dup('$')
    
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
    mov bl,al
    cmp al,13
    je thoat
    mov [si],al
    inc si
    inc cx
    jmp nhap
    
    thoat:
    
    mov ah,9
    lea dx,tb2
    int 21h
    
    lea si,chuoi
    inThuong: 
    cmp cx,0
    je ra
    mov dl,[si]
    cmp dl,'A'
    jl nhay
    cmp dl,'Z'
    ja nhay
    add dl,32
    mov ah,2
    int 21h
    inc si
    dec cx
    jmp inThuong
    
    nhay:
    mov ah,2
    int 21h
    inc si
    dec cx
    jmp inThuong  
    
    ra:
    mov ah,4ch
    int 21h
main endp
end main