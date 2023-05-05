; Correção: 0,5
		.686
		.model flat,c
		.stack 100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf	PROTO arg1:Ptr Byte, inputlist:VARARG
		.data
msgfmt1	byte 0Ah,"%s",0
msgfmt2	byte 0Ah,"%s",0 
msgfmt3	byte 0Ah,"%s",0Ah,0Ah,0
msgfmt4	byte "%s%d%s%d",0Ah,0Ah,0
msgfmt5 byte "%d",0
msg1	byte "Enter a value for num1: ",0
msg2	byte "Enter a value for num2: ",0
msg3	byte "num1    num2",0
msg4	byte " ",0
msg5	byte "       ",0
num1	sdword ?
num2	sdword ?
		.code
main	proc
		INVOKE printf, ADDR msgfmt1, ADDR msg1
		INVOKE scanf, ADDR msgfmt5, ADDR num1
		INVOKE printf, ADDR msgfmt2, ADDR msg2
		INVOKE scanf, ADDR msgfmt5, ADDR num2
		INVOKE printf, ADDR msgfmt3, ADDR msg3
		INVOKE printf, ADDR msgfmt4, ADDR msg4, num1, ADDR msg5, num2
		ret
main	endp
		end
