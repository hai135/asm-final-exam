.model small
.stack 100h
.data
    fileName db 30 dup(?),'$'
    fileP dw ?  
    tb1 db 'nhap ten file can doc:$' 
    tb2 db 10,13,'noi dung file:$'
    chuoi db 100,0,100 dup('$')
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
    
    ;mo file
    mov ah,3Dh 
    mov al,0
    lea dx,fileName
    int 21h
    mov fileP,ax
    
    ;doc file
    mov ah,3Fh 
    mov bx,fileP
    mov cx,6 ;so luong ky tu trong file  (emu8086\MyBuild)
    lea dx,chuoi
    int 21h
    
    mov ah,9
    lea dx,tb2
    int 21h
    
    mov ah,9
    lea dx,chuoi
    int 21h
    
    ;dong file 
    mov ah,3eh
    mov bx,fileP
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
    inc si
    inc cx
    jmp l1
    ou:
    ret
nhap endp
end main