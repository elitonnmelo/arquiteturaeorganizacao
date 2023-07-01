        .686
        .model flat, c
        .stack 100h
printf  PROTO arg1:ptr byte, printlist:vararg        
        .data
vet     sdword 10, 4, 5, 3, 2, 7, 8, 9, 6, 24, 0, 54, 22, 1
i       sdword 0
j       sdword 0     
n       sdword ?  
tempecx sdword ?
temp    sdword ?
msgfmt  byte "%d ",0
        .code
main    proc
        mov n, lengthof vet
        mov ecx, n
        dec ecx
        .repeat
        mov tempecx, ecx
        mov eax, n
        sub eax, i
        sub eax, 1 
        mov ecx, eax ;; ecx = n - i - 1
        mov j, 0
        .repeat
        mov edx, j
        sal edx, 2 ;; edx = j * 4
        add edx, offset vet ;; edx = &vet[j]
        mov esi, edx
        add edx, 4
        mov edi, edx ;; edi = &vet[j+1]
        mov eax, [esi]
        mov ebx, [edi]
        .if eax > ebx ;; if(vet[j] > vet[j+1])
            mov [esi], ebx 
            mov [edi], eax 
        .endif
        inc j
        .untilcxz
        mov ecx, tempecx
        inc i
        .untilcxz
        

        mov ecx, n
        mov edi, offset vet
        .repeat
        push ecx
        mov eax, [edi]
        mov temp, eax
        INVOKE printf, ADDR msgfmt, temp
        add edi, 4
        pop ecx
        .untilcxz
        ret
main    endp
        end