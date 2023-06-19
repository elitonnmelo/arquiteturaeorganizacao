; Correção: 1,0
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
		mov ecx, n
        .while ecx > 0
        mov eax, first
        add eax, second
        mov next, eax ;next = first + second
        mov edx, second
        mov first, edx ;first = second
		mov second, eax ;second = next
		dec ecx
        .endw
		mov n, ecx
		mov eax, first
		mov result, eax ; result = first
		INVOKE printf, ADDR msgfmt, result
		ret
main	endp
		end