        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data

msg1fmt Byte "%s", 0
msg1    Byte "Enter the degrees in Fahrenheit: ", 0

msg2fmt Byte 0Ah, "%s%d", 0
msg2    Byte "The degrees in Celsius is: ", 0

in1fmt  Byte "%d", 0
number  sdword ?
celcius sdword ?
        .code

main    proc

        ; celsius = (F −32)/9 * 5      
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR number
        moc ebx, 32
        sub number, eax;(fahrenheit - 32)
        mov ecx, 9
        mov eax, number
        cdq
        idiv ecx;(fahrenheit - 32) / 9
        mov ebx, 5
        imul ebx
        mov celcius, eax
        INVOKE printf, ADDR msg2fmt, ADDR msg2, celcius

        ret
main    endp
        end
