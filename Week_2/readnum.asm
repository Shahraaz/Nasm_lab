section .data
msg1 : db 'Enter a number'
len1 : equ $-msg1

section .bss

array : resb 100
size : resb 1
time : resb 1
size1 : resb 1
scan1 : resb 1
scan2 : resb 1
junk : resb 1
k : resb 1
cnt1 : resb 1
cnt2 : resb 1
cnt3 : resb 1

section .text
global _start:
_start:

	mov eax,3
	mov ebx,0
	mov ecx,scan1
	mov edx,1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,scan2
	mov edx,1
	int 0x80

	mov eax,3
	mov ebx,0
	mov ecx,junk
	mov edx,1
	int 0x80

	sub byte[scan1],48
	sub byte[scan2],48
	mov ax,word[scan1]
	mov bl,10
	mul bl
	add ax,word[scan2]
	mov byte[size],al
	mov byte[size1],al

	mov byte[size],100
while1:
	cmp byte[size],0
	je end1
	dec byte[size]
	mov eax,array
	mov ebx,0
	mov bl,byte[size]
	mov byte[eax+ebx],0
	jmp while1
end1:
	mov dl,byte[size1]
	mov byte[size],dl
while:
	cmp byte[size],0
	je end
	dec byte[size]

	mov eax,3
	mov ebx,0
	mov ecx,scan1
	mov edx,1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,scan2
	mov edx,1
	int 0x80

	mov eax,3
	mov ebx,0
	mov ecx,junk
	mov edx,1
	int 0x80

	sub byte[scan1],48
	sub byte[scan2],48
	mov ax,word[scan1]
	mov bl,10
	mul bl
	add al,byte[scan2]
	mov ecx,array
	mov ebx,0
	mov bl,al
	add word[ecx+ebx],1

	jmp while
end:
	mov byte[size],0
while2:
	cmp byte[size],100
	je end2
	mov eax,array
	mov ebx,0
	mov bl,byte[size]
	mov dl, byte[eax+ebx]
	mov byte[time],dl

	for :
		cmp byte[time],0	
		je endfor
		dec byte[time]
		mov al,byte[size]
		mov ah,0
		mov bl,10
		div bl
		mov byte[scan1],al
		mov byte[scan2],ah
		add byte[scan1],48		
		add byte[scan2],48
		mov eax,4
		mov ebx,1
		mov ecx,scan1
		mov edx,1
		int 0x80
		mov eax,4
		mov ebx,1
		mov ecx,scan2
		mov edx,1
		int 0x80
		mov byte[scan2],32
		mov eax,4
		mov ebx,1
		mov ecx,scan2
		mov edx,1
		int 0x80
		jmp for
	endfor:
	inc byte[size]
	jmp while2
end2	:
	mov eax ,1
	mov ebx ,0
	int 0x80
