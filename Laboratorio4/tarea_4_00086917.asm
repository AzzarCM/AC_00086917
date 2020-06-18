org	100h

section .text

	call texto 
    mov bl, 00h
	mov si, 0d 
	mov di, 0d
	mov cx, [len]

lupi:   
        mov  bl, [comnt+di]
	    mov  [di+200h], bl   
		inc  di
		cmp di, 14d
		jbe  lupi

lupi1:call kb

mov	[300h+si], al
	inc si
	cmp si, 5d
	je show_message1
	jmp lupi1

show_message1:
    call w_strng
	mov cx, 4d
	mov si, 1d
	jmp lupi2

lupi2:
	mov ah, 0d
	mov bl, [300h]
	sub bl, 30h
	mov al, bl
subs:
	mov bl, [300h+si]
	sub bl, 30h
	add al, bl
	inc si
	dec cx
	cmp cx, 0d
	jne subs
	mov [310h], al
	mov bl, 5h
	div bl
	mov [320h], al
	cmp al, 5d
	je show_message

show_message:

    call message
	call kb
	int 20h

texto:	
    mov ah, 00h
	mov	al, 03h
	int 10h
	ret

kb:	
    mov	ah, 00h
	int 16h
	ret	

w_strng:

    mov	ah, 13h
	mov al, 01h 
	mov bh, 00h 
	mov	bl, 00001111b ; atributo de caracter
	mov	cx, 5d 
	mov	dl, 10h ; columna inicial
	mov	dh, 5h	; fila inicial
	mov	bp, 300h
	int 10h
	ret

message:
    mov	ah, 13h
	mov al, 01h 
	mov bh, 00h 
	mov	bl, 00001111b ; atributo de caracter
	mov	cx, 14d 
	mov	dl, 10h ; columna inicial
	mov	dh, 13h	; fila inicial
	mov	bp, 200h
	int 10h
	ret

section .data

    comnt   db      "Piores nada "
    len     equ     $-comnt