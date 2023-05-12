        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
msgfmt  Byte "%d",0
number  sdword ?
count   sdword ? 

        .code

main    proc

    mov count, 7
    INVOKE scanf, ADDR msgfmt, ADDR number
    case00:         cmp number, 0
                    je thencase01
    case01:         cmp number, 1
                    jne case02
    thencase01:    add count, 2
                    je endcase  
    case02:         cmp number, 2
                    jne case03
                    je thencase03
    case03:         cmp number, 3
                    jne endcase
    thencase03:      sub count, 2
    endcase:        nop
                    INVOKE printf, ADDR msgfmt, count
                    ret
main    endp
        end