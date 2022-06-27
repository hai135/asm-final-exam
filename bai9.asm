.model small
.stack 100h
.data
    tb1 db 'nhap chuoi:$'
    tb2 db 10,13,'chuoi nguoc:$' 
    tb3 db 10,13,'$'
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
    mov [si],al
    xor dx,dx
    mov dl,al
    push dx 
    inc cx
    cmp al,13
    je thoat
    inc si
    jmp nhap
    
    
    thoat:
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,9
    lea dx,tb3
    int 21h
    inN:
    xor dx,dx
    pop dx
    mov ah,2
    int 21h
    loop inN
    
    mov ah,4ch
    int 21h
main endp
end main