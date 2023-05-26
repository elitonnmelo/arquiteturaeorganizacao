        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
msgfmt  Byte "%s%d",0
infmt Byte "%d", 0
msg1 Byte "Digite o numero: ", 0
msg2 Byte "1", 0
number1      sdword ?
number       sdword ?
result       sdword ?
flag         sdword ?


            .code

fatorial    macro number:REQ

            mov eax, number
            mov ecx, number
            .if eax == 1 || eax == 0
            push ecx
            push eax
            mov flag, 1;; caso o número seja 1 ou 0  o resultado será 1
            pop eax
            pop ecx
            .else
            .while ecx > 1
            dec ecx
            imul ecx
            .endw  
            mov result, eax
            mov flag, 0
            .endif
            endm


main        proc
            INVOKE printf, ADDR msg1
            INVOKE scanf, ADDR infmt, ADDR number1

            fatorial number1
            .if flag == 1
            INVOKE printf, ADDR msg2; caso o número seja 1 ou 0  o resultado será 1
            .else
            INVOKE printf, ADDR result
            .endif
            
            ret
main        endp
            end
