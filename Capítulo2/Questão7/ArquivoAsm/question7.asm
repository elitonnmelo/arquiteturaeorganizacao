; Correção: 0,5
		.686
		.model flat,c
		.stack  100h
printf	PROTO arg1:Ptr Byte, printlist:VARARG
scanf	PROTO arg1:Ptr Byte, printlist:VARARG
		.data
msgfmt1	byte "%s",0
msgfmt2 byte "%d",0
msgfmt3 byte 0Ah,"%d%s%d%s%d",0Ah,0Ah,0
msgfmt4 byte "%d%s%d%s%d",0
msg1	byte "Enter a number: ",0
msg2	byte "Enter a larger number: ",0
msg3	byte "Enter a even larger number: ",0
msg4	byte " < ",0
msg5	byte " > ",0
num1	sdword ?
num2	sdword ?
num3	sdword ?
		.code
main	proc
		INVOKE printf, ADDR msgfmt1, ADDR msg1
		INVOKE scanf, ADDR msgfmt2, ADDR num1
		INVOKE printf, ADDR msgfmt1, ADDR msg2
		INVOKE scanf, ADDR msgfmt2, ADDR num2
		INVOKE printf, ADDR msgfmt1, ADDR msg3
		INVOKE scanf, ADDR msgfmt2, ADDR num3
		INVOKE printf, ADDR msgfmt3, num1, ADDR msg4, num2, ADDR msg4, num3
		INVOKE printf, ADDR msgfmt4, num3, ADDR msg5, num2, ADDR msg5, num1
		ret
main	endp
		end