        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
        msg1fmt   byte  "%s", 0
in1fmt    byte  "%x", 0
msg2fmt   byte  "%s%x", 0Ah, 0Ah, 0
msg1      byte  0Ah, "Enter a hexadecimal number: ", 0
msg2      byte  "The hexadecimal number is ", 0
msgFire   byte  "Fire alarm", 0Ah, 0    
msgCarbon byte  " arbon monoxide", 0Ah, 0    
msgOutage byte  "Power outage", 0Ah, 0    
msgGate   byte  "Gate unlocked", 0Ah, 0    
msgsDoor  byte  "Door open", 0Ah, 0    
msgWindow byte  "Window open", 0Ah, 0    
dsb       dword ?


        .code

main    proc
                INVOKE printf, ADDR msg1fmt, ADDR msg1
                INVOKE scanf, ADDR in1fmt, ADDR dsb
                INVOKE printf, ADDR msg2fmt, ADDR msg2, dsb
                mov ecx, 0

                test dsb, 00000001b
                .if !ZERO?                ; if bit0 = 1 then
                INVOKE printf, ADDR msg1fmt, ADDR msgFire
                inc ecx
                .endif

                test dsb, 00000010b
                .if !ZERO?                ; if bit1 = 1 then
                INVOKE printf, ADDR msg1fmt, ADDR msgCarbon
                inc ecx
                .endif

                test dsb, 00000100b
                .if !ZERO?                ; if bit2 = 1 then
                INVOKE printf, ADDR msg1fmt, ADDR msgOutage
                inc ecx
                .endif

                cmp ecx, 0  ;; se ecx <= a 3 quer dizer que ocorreu um dos ventos anteriores entao nao precisa imprimir os outros
                je then02
                jne endprog
    then02:
                test dsb, 00001000b
                .if !ZERO?                ; if bit3 = 1 then
                INVOKE printf, ADDR msg1fmt, ADDR msgGate
                .endif

                test dsb, 00010000b
                .if !ZERO?                ; if bit4 = 1 then
                INVOKE printf, ADDR msg1fmt, ADDR msgsDoor
                .endif

                test dsb, 00100000b
                .if !ZERO?                ; if bit5 = 1 then
                INVOKE printf, ADDR msg1fmt, ADDR msgWindow
                .endif

    endprog:    nop        
        ret
main    endp
        end