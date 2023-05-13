        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
msgfmt  Byte "%s%d",0
infmt Byte "%d", 0
msg1 Byte "Digite o dividendo: ", 0
msg2 Byte "Digite o divisor: ", 0

msg3 Byte "Quociente: ", 0
msg4 Byte 0Ah, "Resto: ", 0
dividendo       sdword ?
divisor         sdword ?
result         sdword ?
resto         sdword ?

        .code

main    proc
        INVOKE printf, ADDR msg1
        INVOKE scanf, ADDR infmt, ADDR dividendo
        INVOKE printf, ADDR msg2
        INVOKE scanf, ADDR infmt, ADDR divisor
        
        mov eax, dividendo
        mov ebx, divisor
        mov ecx, 0
        .while (eax >= ebx)
        sub eax, ebx
        inc ecx
        .endw
        mov result, eax
        mov resto, ecx
        INVOKE printf, ADDR msgfmt, ADDR msg3, result
        INVOKE printf, ADDR msgfmt, ADDR msg4, resto
        ret
main    endp
        end