;ejercicio de las notas	
	
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

	int 20h

