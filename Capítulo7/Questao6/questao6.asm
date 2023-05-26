        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
msgfmt  Byte "%s%d",0
infmt Byte "%d", 0
msg1 Byte "Digite o numero: ", 0
operand      sdword ?
number       sdword ?
number2      sdword ?
result       sdword ?


            .code

MULTACC     macro operand

            push ebx            ;; save ebx and ecx
            push ecx
            mov ebx,eax         ;; mov eax to ebx
            mov eax,0           ;; clear accumulator to zero
            mov ecx,operand     ;; load ecx with operand

            if operand LT 0     ;; if operand is negative
            neg ecx             ;; make ecx positive for loop
            endif

            if operand eq 0
            mov eax, 0
            endif

            if operand eq 1
            mov eax, ebx
            endif

            if ecx GT 0
            .while ecx >0
            add eax,ebx         ;; repetitively add
            dec ecx             ;; decrement ecx
            .endw
            endif

            if operand LT 0     ;; if operand is negative
            neg eax             ;; negate accumulator, eax
            endif

            pop ecx             ;; restore ecx and ebx
            pop ebx

            endm

main        proc
            INVOKE printf, ADDR msg1
            INVOKE scanf, ADDR infmt, ADDR number

            INVOKE printf, ADDR msg1
            INVOKE scanf, ADDR infmt, ADDR number2

            mov eax, number2
            MULTACC number
            mov result, eax
            INVOKE printf, ADDR result
            
            ret
main        endp
            end
