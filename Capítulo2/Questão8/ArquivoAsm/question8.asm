; Correção: 0,5
		.686
		.model flat,c
		.stack  100h
printf	PROTO arg1:Ptr Byte, printlist:VARARG
scanf	PROTO arg1:Ptr Byte, printlist:VARARG
		.data
msgfmt1	byte "%s",0
msgfmt2 byte "%d",0
msgfmt3 byte "%s%s%d%s%d",0
msg1	byte "Enter a number: ",0
msg2	byte "Numbers",0Ah,0
msg3	byte "  ",0
msg4	byte 0Ah,"  ",0
num1	sdword ?
num2	sdword ?
		.code
main	proc
		INVOKE printf, ADDR msgfmt1, ADDR msg1
		INVOKE scanf, ADDR msgfmt2, ADDR num1
		INVOKE printf, ADDR msgfmt1, ADDR msg1
		INVOKE scanf, ADDR msgfmt2, ADDR num2
		INVOKE printf, ADDR msgfmt3, ADDR msg2, ADDR msg3, num1, ADDR msg4, num2
		ret
main	endp
		end