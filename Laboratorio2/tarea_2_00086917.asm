;ejercicio 1 de las notas	
	
	org 100h

	;00086917

	mov	ax, 8d
	add	ax, 6d
	add	ax, 9d
	add	ax, 1d
	add	ax, 7d

	mov	bx, 5d ;cantidad de numeros para div
	div	bx

	cmp	ax, 6d ; comparamos el valor que trae ax si es igual a 6
			;si es asi llamamos a la lupe
	
	je	lupita 

lupita:
	mov	dl, "P"
	mov	[200h], dl
	mov	dl, "E"
	mov	[201h], dl
	mov	dl, "O"
	mov	[202h], dl
	mov	dl, "R"
	mov	[203h], dl
	mov	dl, " "
	mov	[204h], dl
	mov	dl, "E"
	mov	[205h], dl
	mov	dl, "S"
	mov	[206h], dl
	mov	dl, " "
	mov	[207h], dl
	mov	dl, "N"
	mov	[208h], dl
	mov	dl, "A"
	mov	[209h], dl
	mov	dl, "D"
	mov	[20Ah], dl
	mov	dl, "A"
	mov	[20Bh], dl



;ejercicio 2 de nayib y las graficas

        mov si, 0d
        mov ax, 2d
        mov cx, 2d
        
parte1:  
        mul cx
        mov [si+210h], ax
        inc si ; incrementamos en 1
        cmp ax, 256d ;comparamos para ver si se pasa de 255
        jb parte1 ;si aun es menor seguimos en parte 1

parte2:  
        mul cx
        inc si
        mov [si+210h], ax
        inc si
        cmp si, 14d 
        jb parte2

        
;ejercicio 3 fibonacci

mov	al, 00h ; al tiene el primer numero de la secuencia
	mov	si, 220h  ;lugar de memoria para la salida
	mov 	[si], al ;movemos 0 a la primera posicion
	add	si, 1 
	add	al, 1 ;al tiene el segundo elemento de la secuencia
	mov	[si], al 
	mov	cx, 16d ;cantidad de veces en el loop
	sub	cx, 2d

	l1:
		mov	al, [si-1] ;movemos (i-1) a la posicion de al
		add	al, [si]
		add 	si, 1
		mov	[si], al ;guardamos la suma en la nueva posicion
		loop 	l1 ;repetimos

		int 20h