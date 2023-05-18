		.686
		.model flat,c
		.stack 100h
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
printf	PROTO arg1:Ptr Byte, printlist:VARARG
		.data
msgfmt		byte "%d",0
first		sdword 0
second		sdword 1
next		sdword ?
n			sdword ?
result		sdword ?
		.code
main	proc
		INVOKE scanf, ADDR msgfmt, ADDR n
		.if n > 0
		mov ecx, n
        .repeat
        mov eax, first
        add eax, second
        mov next, eax ;next = first + second
        mov edx, second
        mov first, edx ;first = second
		mov second, eax ;second = next
		dec ecx
        .until ecx <= 0
		.endif
		mov n, ecx
		mov eax, first
		mov result, eax ; result = first
		INVOKE printf, ADDR msgfmt, result
		ret
main	endp
		end