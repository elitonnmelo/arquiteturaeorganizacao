; Correção: 1,0
        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
msg1fmt byte 0Ah,"%s%d",0Ah,0Ah,0 
msg1    byte "The contents of the accumulator are: ",0
temp    sdword ?
            .code
LOADACC     macro operand 
            mov eax,operand ;; load eax with the operand
            endm

ADDACC      macro operand 
            add eax,operand ;; add to eax the operand
            endm

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

            if operand GT 1
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
            LOADACC 12
            MULTACC 1
            CALL OUTACC
            ret
main        endp
OUTACC      proc

            push eax ; save eax, ecx, and edx
            push ecx 
            push edx 
            mov temp,eax 
            INVOKE printf, ADDR msg1fmt, ADDR msg1, temp 
            pop edx ; restore eax, ecx, and edx
            pop ecx
            pop eax
            ret
OUTACC      endp
            end
