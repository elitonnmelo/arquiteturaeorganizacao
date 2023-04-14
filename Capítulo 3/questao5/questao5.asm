        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data

msg1fmt Byte 0Ah, "%s", 0
msg1    Byte "Enter an integer: ", 0

msg2fmt Byte 0Ah, "%s%d", 0Ah, 0Ah, 0
msg2    Byte "The integer is: ", 0

in1fmt  Byte "%d", 0
number  sdword ?
        .code

main    proc
               
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR number
        mov eax, 3
        imul number
        mov edx, 7
        sub edx, eax
        mov number, edx
        INVOKE printf, ADDR msg2fmt, ADDR msg2, number

        ret
main    endp
        end
