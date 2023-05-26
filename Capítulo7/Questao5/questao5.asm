		.686
		.model flat,c
		.stack 100h
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
printf	PROTO arg1:Ptr Byte, printlist:VARARG
		.data
msgfmt		byte "%d",0
msgfmt2		byte "The fibbonaci number in the %d posicion is: %d",0
first		sdword 0
second		sdword 1
next		sdword ?
n			sdword ?
result		sdword ?
		.code
fibbo   macro
        push ecx
        push eax
        push edx
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
		mov eax, first
		mov result, eax ; result = first
        pop edx
        pop eax
        pop ecx
        endm           
main	proc
		INVOKE scanf, ADDR msgfmt, ADDR n
		fibbo; como first, second e n foram iniciados, não é necessário fazer nada antes da chamada do procedimento
		INVOKE printf, ADDR msgfmt2, n, result
		ret
main	endp     
		end