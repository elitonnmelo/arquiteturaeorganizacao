        .686
        .model  flat, c 
; Correção: 0,1
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
msgfmt  Byte "%s",0
msgfmt2 Byte "The factorial of %d is: %d", 0
infmt   Byte "%d", 0
msg1    Byte "Digite o numero: ", 0
msg2    Byte "1", 0
number1      sdword ?
result       sdword ?
flag         sdword ?


            .code

FATORIAL    macro number:REQ
            push ecx
            push eax
            push edx
            mov eax, number
            mov ecx, number
            .if eax == 1 || eax == 0
            mov flag, 1;; caso o número seja 1 ou 0  o resultado será 1
            .else
            .while ecx > 1
            dec ecx
            imul ecx
            .endw  
            mov result, eax
            mov flag, 0
            .endif
            pop edx
            pop eax
            pop ecx
            endm


main        proc
            INVOKE printf, ADDR msgfmt, ADDR msg1
            INVOKE scanf, ADDR infmt, ADDR number1

            FATORIAL number1
            .if flag == 1
            INVOKE printf, ADDR msgfmt, ADDR msg2; caso o número seja 1 ou 0  o resultado será 1
            .else
            INVOKE printf, ADDR msgfmt2, number1, result
            .endif
            
            ret
main        endp
            end
