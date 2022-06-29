.model small
.stack 100h
.data
    fileName db 30 dup(?),'$'
    fileP dw ?
    tb1 db 'nhap ten file muon xoa:$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    
    lea si,fileName
    mov cx,0
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
    ;xoa file
    mov ah,41h
    lea dx,fileName
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