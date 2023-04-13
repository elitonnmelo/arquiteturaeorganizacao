		   .686
		   .model flat,c
		   .stack 100h
printf	   PROTO arg1:Ptr Byte, printlist:VARARG
scanf	   PROTO arg2:Ptr Byte, printlist:VARARG
		   .data
msgfmt1	   byte "%s",0
msgfmt2	   byte "%d",0
msgfmt3	   byte 0Ah,"%s%d",0Ah,0
msg1	   byte "Enter the degrees in Fahrenheit: ",0
msg2	   byte "The degrees in Celsius is: ",0
celsius	   sdword ?
fahrenheit sdword ?
		   .code
main	   proc
		   INVOKE printf, ADDR msgfmt1, ADDR msg1
		   INVOKE scanf, ADDR msgfmt2, ADDR fahrenheit
		   mov eax, fahrenheit
		   sub eax, 32
		   cdq
		   mov ebx, 9
		   idiv ebx
		   mov ecx,5
		   imul ecx
		   mov celsius, eax
		   INVOKE printf, ADDR msgfmt3, ADDR msg2, celsius
		   ret
main	   endp
		   end