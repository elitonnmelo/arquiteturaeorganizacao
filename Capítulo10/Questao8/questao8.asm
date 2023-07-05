        .686
        .model flat, c
        .stack 100h
printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg1:Ptr Byte, inputlist:VARARG
        .data
msg1fmt byte 0Ah,"%s",0Ah,0Ah,0
msg2fmt byte " %3.1f",0Ah,0
msg3fmt byte "%lf",0
msg1    byte "Array",0
msg2    byte "Input a float number: ", 0        
n       sdword 5
array   real8 5 dup(?)
aux     real8 ?
        .code
main    proc

        mov ecx, n
        mov ebx,0

        .repeat
        push ecx
        INVOKE printf, ADDR msg1fmt, ADDR msg2
        INVOKE scanf, ADDR msg3fmt, ADDR array[ebx]
        add ebx, 8
        pop ecx
        .untilcxz

        INVOKE printf, ADDR msg1fmt, ADDR msg1
        lea esi,array
        mov ecx,n
        .repeat
        push ecx
        INVOKE printf, ADDR msg2fmt, real8 ptr [esi]
        pop ecx
        add esi,8
        .untilcxz

        INVOKE printf, ADDR msg1fmt, ADDR msg1
        mov ebx,0
        mov ecx,n
        .repeat
        push ecx
        INVOKE printf, ADDR msg2fmt, array[ebx]
        pop ecx
        add ebx,8
        .untilcxz

        ret 
main    endp
        end