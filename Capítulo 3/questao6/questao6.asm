        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data

msg1fmt Byte "%s", 0
msg1    Byte "Enter the number of amperes: ", 0

msg2fmt Byte "%s", 0
msg2    Byte "Enter the number of ohms: ", 0

msg3fmt Byte 0Ah, "%s%d", 0Ah, 0
msg3    Byte "The number of volts is:  ", 0

msg4fmt Byte "%s%d", 0
msg4    Byte "The number of watts is: ", 0

in1fmt  Byte "%d", 0
in2fmt  Byte "%d", 0

number1  sdword ?
number2  sdword ?
        .code

main    proc
               
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR number1
        INVOKE printf, ADDR msg2fmt, ADDR msg2
        INVOKE scanf, ADDR in2fmt, ADDR number2
        mov eax, number1
        imul number2
        mov ebx, eax
        INVOKE printf, ADDR msg3fmt, ADDR msg3, ebx
        mov eax, number1
        imul ebx
        INVOKE printf, ADDR msg4fmt, ADDR msg4, eax

        ret
main    endp
        end
