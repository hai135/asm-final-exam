.model small 
.stack 100h
.data
    msg1 db "Nhap MSV: $"
    msg2 db 10,13,"Ho ten sinh vien: $"
    msg3 db 10,13,"!!!Thong tin sai$"
    hoten db "Pham Viet Hoang$" 
    xuongdong db 10,13,'$'
    msv db "AT160717"
    str db 100,?,100 dup('$') 
    
.code
main proc 
    mov ax,@data
    mov ds,ax 
    mov es,ax
;nhap chuoi
    nhapmsv:
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,10
    lea dx,str
    int 21h    
     
kiemtra:   
    cld  
    mov cx,8
    lea si,str+2
    lea di,msv
    repe cmpsb
    je intb1 
    mov ah,9
    lea dx,msg3
    int 21h 
    mov ah,9
    lea dx,xuongdong 
    int 21h
    jmp nhapmsv
    jmp thoat
    
intb1:
    mov ah,9
    lea dx,msg2
    int 21h
    mov ah,9
    lea dx,hoten
    int 21h
thoat: 
    mov ah,8
    int 21h
    mov ah,4ch
    int 21h    
    main endp
end main