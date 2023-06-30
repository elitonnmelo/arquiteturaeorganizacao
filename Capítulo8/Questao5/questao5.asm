        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
        
msg1fmt byte "%s",0
msg2fmt byte "%d",0 

msg1    byte "Digite os 20 numeros para adicionar no arry 1",0Ah,0
msg2    byte "Numero"
msg3    byte 0Ah,"Elementos do array 2:",0Ah,0
msg4    byte ": ",0

count   sdword 0

in1fmt  sdword "%d",0

arry1    sdword 20 dup(?)
arry2    sdword 20 dup(?)

            .code
main        proc

            INVOKE printf, ADDR msg1fmt, ADDR msg1
            mov ebx, 0
            mov ecx, 20

            .repeat
            push ecx
            INVOKE printf, ADDR msg1fmt, ADDR msg2, ADDR msg2fmt, ADDR count, ADDR msg1fmt, ADDR msg4
            INVOKE scanf, ADDR in1fmt, ADDR arry1[ebx]
            add ebx, 4
            inc count
            pop ecx
            .untilcxz

            
            lea edi, arry1
            lea esi, arry2
            mov ecx, 20

            .repeat
            push ecx
            mov eax, edi
            mov [esi], eax 
            add esi, 4
            add edi, 4
            pop ecx
            .untilcxz

            INVOKE printf, ADDR msg1fmt, ADDR msg3
            mov ecx, 20
            mov ebx, 0

            .repeat
            push ecx
            mov eax, arry2[ebx]
            INVOKE printf, ADDR msg2fmt, eax
            add ebx, 4
            pop ecx
            .untilcxz
            

            ret
main        endp
            end
