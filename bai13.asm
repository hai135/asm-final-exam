.model small
.stack 100h
.data
    fileName db 30 dup(?),'$'
    tb1 db 'nhap ten file:$' 
    tb2 db 10,13,'nhap noi dung:$'
    fileP dw ?
    chuoi db 100,0,100 dup('$')           
    buffer db 100,0,100 dup('$')
    dem dw ?        
.code
main proc
        mov ax,@data
        mov ds,ax
        
    ;create new file         
        lea dx, tb1
        mov ah,9
        int 21h 
        
        ;nhap ten file               
        lea si,fileName 
        call nhap
	;tao file
        mov cx,0  
        lea dx,fileName
        mov ah,3Ch  
        int 21h
                     
    ;ghi noi dung
        mov fileP, ax      
        mov ah,9
        lea dx,tb2
        int 21h
        
        lea si,chuoi 
        xor cx,cx
        call nhap
        mov dem,cx
                   
    ;ghi va luu file  
        lea dx,chuoi
        mov bx,fileP
        mov cx,dem
        mov ah,40h
        int 21h
        inc si
                               
    ;dong file
     
        mov ah,3Eh
        mov bx,fileP
        int 21h 
               
            
    ;Exit
        mov ah,4Ch
        int 21h
    
main endp  

nhap proc
    mov ah,1
    int 21h  
    cmp al,13
    je ou
    mov [si],al
    inc cx
    inc si
    jmp nhap
    ou:
    ret 
nhap endp
end main