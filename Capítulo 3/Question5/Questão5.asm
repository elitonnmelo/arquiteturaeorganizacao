		.686
		.model flat,c
		.stack 100h
printf	PROTO arg1:Ptr Byte, printlist:VARARG
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
		.data
number	sdword ?
msgfmt1	byte 0Ah,"%s",0
msgfmt2	byte "%d",0
msgfmt3	byte 0Ah,"%s%d",0Ah,0Ah,0
msg1	byte "Enter an integer: ",0
msg2	byte "The integer is: ",0
		.code
main	proc
		INVOKE printf, ADDR msgfmt1, ADDR msg1
		INVOKE scanf, ADDR msgfmt2, ADDR number
		mov eax,3
		imul number
		mov ebx,7
		sub ebx,eax
		mov number,ebx
		INVOKE printf, ADDR msgfmt3, ADDR msg2, number
		ret
main	endp
		end