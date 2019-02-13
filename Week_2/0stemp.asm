;;Read num

string_to_num:
	push eax
	push ebx
	push ecx
	mov eax,0
while: 
	mov bl,byte[ecx]
	cmp bl,0x0a
	je end
	muli ax,10
	add ax,bl
	inc ecx
	jmp while
	
end :
	pop ecx
	pop ebx
	pop eax
	ret	
