		.686
		.model flat,c
		.stack 100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
		.data
msgfmt	byte 0Ah,"%d%s%d%s%d",0Ah,0Ah,0
msg1	byte " + ",0
msg2	byte " = ",0
x		sdword ?
y		sdword ?
z		sdword ?
		.code
main	proc
		mov x,1
		mov y,2
		mov z,3
		INVOKE printf, ADDR msgfmt, x, ADDR msg1, y, ADDR msg2, z
		ret
main	endp
		end
