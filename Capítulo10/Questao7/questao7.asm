        .686 
        .model flat,c 
        .stack 100h 
printf PROTO arg1:Ptr Byte, printlist:VARARG 
scanf PROTO arg2:Ptr Byte, inputlist:VARARG 

        .data 
in1fmt  byte "%lf",0 
in2fmt  byte "%d",0
msg0fmt byte 0Ah,"%s",0 
msg1fmt byte 0Ah,"%s%6.1f",0Ah,0 
msg0    byte "Enter a double for x: ",0 
msg1    byte "The sum is: ",0 
msg2    byte "enter the number of elements for the sum: ",0

x       real8 ? 
sum     real8 ? 
zero    real8 0.0 
value   sdword ?
cont    sdword 0

        .code 
main    proc 
        ;sum = 0.0 
        fld zero 
        fstp sum 
        INVOKE printf, ADDR msg0fmt, ADDR msg2 
        INVOKE scanf, ADDR in2fmt, ADDR value 
        mov eax, value
        ;while cont < value 
while01: nop
        
        push eax
        INVOKE printf, ADDR msg0fmt, ADDR msg0 
        INVOKE scanf, ADDR in1fmt, ADDR x 

        ;sum = sum + x 
        fld sum 
        fadd x 
        fstp sum 
        
        ;cont = cont + 1
        inc cont
        pop eax
        ;if cont < value goto while01
        cmp cont, eax
        jg endw01
        jmp while01
endw01: nop 

        INVOKE printf, ADDR msg1fmt, ADDR msg1, sum 

        ret 
main    endp 
        end 