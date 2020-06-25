org 	100h

section .text

		; Llamada a iniciar modo grafico 13h

	xor 	si, si
	xor 	di, di
    call 	grafico
	mov 	si, 25d ; X -> Columna
	mov 	di, 25d ; Y -> Fila
	call 	linea_h

    mov     si, 45d
    mov     di, 40d
    call    linea_h2

    mov     si, 75d
    mov     di, 25d
    call    linea_v

    mov     si, 25d
    mov     di, 25d
    call    lupi_v2

    mov     si, 25d
    mov     di, 100d
    call    linea_h3

    mov     si, 45d
    mov     di, 80d
    call    linea_h2

    mov     si, 75d
    mov     di, 80d
    call    linea_v3

    mov     si, 45d
    mov     di, 40d
    call    linea_v4
    

	call 	kb		; Utilizamos espera de alguna tecla

	int 	20h

grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 1010b
	int 	10h
	ret

linea_h: 
lupi_h:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 75d
	jne 	lupi_h
	ret

linea_h2: 
lupi_h2:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 75d
	jne 	lupi_h2
	ret
linea_h3: 
lupi_h3:	mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 75d
	jne 	lupi_h2
	ret
linea_h4: 
lupi_h4:	
    mov 	cx, 0d ; Columna 
	add 	cx, si
	mov	    dx, di ; Fila
	call 	pixel
	inc 	si
	cmp 	si, 75d
	jne 	lupi_h2
	ret

linea_v:
lupi_v:	mov 	cx, si ; Columna 
	mov	    dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 40d
	jne 	lupi_v
	ret

linea_v2:
lupi_v2:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 100d
	jne 	lupi_v2
	ret

linea_v3:
lupi_v3:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 100d
	jne 	lupi_v3
	ret

linea_v4:
lupi_v4:	mov 	cx, si ; Columna 
	mov	dx, 0d ; Fila
	add 	dx, di
	call 	pixel
	inc 	di
	cmp 	di, 80d
	jne 	lupi_v4
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data