; Correção: 0,5
		.686
		.model flat,c
		.stack 100h
scanf	PROTO arg2:Ptr Byte, inputlist:VARARG
printf	PROTO arg1:Ptr Byte, printlist:VARARG
		.data
		msg1fmt byte "%s",0
in1fmt		byte "%x",0 
msg2fmt		byte "%s%x",0Ah,0Ah,0 
msg1		byte 0Ah,"Enter a hexadecimal number: ",0
msgjam		byte "Paper jam",0Ah,0 
msgfeed		byte "Paper misfeed",0Ah,0
msgempty	byte "Paper tray empty",0Ah,0
msglow		byte "Toner low",0Ah,0
msgTempty	byte "Toner empty",0Ah,0
dsb			dword ?
		.code
main	proc
			INVOKE printf, ADDR msg1fmt,ADDR msg1
			INVOKE scanf, ADDR in1fmt,ADDR dsb 
			test dsb,00000001b 
			jz endif01 ; if bit 0 = 1 then 
			INVOKE printf, ADDR msg1fmt,ADDR msgjam 
			jmp end_if
endif01:	nop 
			test dsb,00000010b 
			jz endif02 ; if bit 1 = 1 then 
			INVOKE printf, ADDR msg1fmt,ADDR msgfeed 
			jmp end_if
endif02:	nop 
			test dsb,00000100b 
			jz endif03 ; if bit 2 = 1 then 
			INVOKE printf, ADDR msg1fmt,ADDR msgempty 
			jmp end_if
endif03:	nop 
			test dsb,00001000b 
			jz endif04 ; if bit 3 = 1 then 
			INVOKE printf, ADDR msg1fmt,ADDR msglow 
			jmp end_if
endif04:	nop
			test dsb,00010000b 
			jz endif05 ; if bit 4 = 1 then 
			INVOKE printf, ADDR msg1fmt,ADDR msgTempty 
			jmp end_if
endif05:	nop
end_if:		nop
		ret
main	endp
		end
