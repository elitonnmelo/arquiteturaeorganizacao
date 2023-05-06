        .686
        .model  flat, c 
        .stack  100h 

printf  PROTO arg1:Ptr Byte, printlist:VARARG
scanf   PROTO arg2:Ptr Byte, inputlist:VARARG

        .data
number  sdword ?
count   sdword ?

        .code

main    proc
    case00:         cmp number, 0
                    je case01
    case01:         cmp number, 1
                    jne endcase
    thencases01:    add count, 2
    case02:         cmp number, 2
                    je case03
    case03:         cmp number, 3
                    jne endcase
    thecase03:      sub count, 2
    endcase:        nop

        ret
main    endp
        end