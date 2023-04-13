		.686
		.model flat,c
		.stack 100h
printf	PROTO arg1:Ptr Byte, printlist:VARARG
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
		.data
msgfmt1	byte "%s",0
msgfmt2	byte "%d",0
msgfmt3	byte "%s%d",0Ah,0
msg1	byte "Enter the number of amperes: ",0
msg2	byte "Enter the number of ohms: ",0
msg3	byte 0Ah,"The number of volts is: ",0
msg4	byte "The number of watts is: ",0
amperes	sdword ?
ohms	sdword ?
volts	sdword ?
watts	sdword ?
		.code
main	proc
		INVOKE printf, ADDR msgfmt1, ADDR msg1
		INVOKE scanf, ADDR msgfmt2, ADDR amperes
		INVOKE printf, ADDR msgfmt1, ADDR msg2
		INVOKE scanf, ADDR msgfmt2, ADDR ohms
		mov eax, amperes
		imul ohms
		mov volts, eax
		mov eax, amperes
		imul volts
		mov watts, eax
		INVOKE printf, ADDR msgfmt3, ADDR msg3, volts
		INVOKE printf, ADDR msgfmt3, ADDR msg4, watts
		ret
main	endp
		end