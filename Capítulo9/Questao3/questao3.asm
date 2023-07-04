        .686
        .model flat, c
        .stack 100h
printf   PROTO   arg1:Ptr Byte, printlist:VARARG
scanf    PROTO   arg2:Ptr Byte, inputlist:VARARG
        .data
arraystr     byte "aaabbbbaaa", "hhfihhskfg", "kinikkinik", "hhhhhdddda", "nknfkdhkdj", "abakhwetha", "5555555555", "1234554321", "palindrome", "zythepsary"
n       sdword 10
cont    sdword 0
tempecx sdword ?
aux     sdword 0
straux  byte 10 dup(?) , 0
msgfmt  byte "%s", 0
msg1    byte "The string is a palindrome", 0Ah, 0
msg2    byte "The string is not a palindrome", 0Ah, 0
        .code
main    proc
        mov ecx, n
        .while ecx > 0
                mov tempecx, ecx


                mov ecx, 10
                mov ebx, offset arraystr
                add ebx, aux
                mov esi, ebx
                lea edi, straux
                cld

                repe cmpsb
                
                .if ecx > 0             ; check if ecx > 0
                        INVOKE printf, ADDR msgfmt, ADDR msg2
                .else 
                        dec esi                 ; back up esi one position
                        dec edi                 ; back up edi one position
                        mov al, [esi]           ; load al with [esi]
                        .if al != [edi]         ; if not equal
                                INVOKE printf, ADDR msgfmt, ADDR msg2
                        .else 
                                INVOKE printf, ADDR msgfmt, ADDR msg1
                        .endif
                .endif

                mov ecx, tempecx
                dec ecx
                add aux, 10
        .endw
MOV_INV proc
        mov ecx, 10
        mov ebx, offset arraystr
        add ebx, aux
        add ebx, 9
        mov esi, ebx
        lea edi, straux
        
        .repeat
                mov al, [esi]
                mov [edi], al
                inc edi
                dec esi
        .untilcxz
        ret
MOV_INV endp        
        ret
main    endp
        end