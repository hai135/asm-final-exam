.model small
.stack 100h
.data
    tb1 db 'nhap ten file muon doi:$'
    tb2 db 10,13,'ten file moi la:$'
    fileName db 30 dup(?),'$'
    fileP dw ?
    chuoi db 30 dup(?),'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    lea si,fileName
    mov cx,0
    call nhap
    
    mov ah,9
    lea dx,tb2
    int 21h
    mov cx,0
    lea si,chuoi
    call nhap
    
    xor cx,cx 
    ;mo file
    mov ah,3dh 
    mov al,0
    lea dx,fileName
    int 21h
    mov fileP,ax
    ;dong file
    mov ah,3eh
    mov bx,fileP
    int 21h
    ;doi ten file
    mov ah,56h
    lea dx,fileName
    lea di,chuoi
    int 21h
    
    mov ah,4ch
    int 21h
main endp
nhap proc
    l1:
    mov ah,1
    int 21h
    cmp al,13
    je ou
    mov [si],al
    inc cx
    inc si
    jmp l1
    ou:
    ret
nhap endp
end main