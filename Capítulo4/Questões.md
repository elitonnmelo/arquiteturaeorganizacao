# Resolução das questões

## Questão 1: Indicate whether the following statements are syntactically correct or incorrect in MASM. If incorrect, indicate what is wrong with the statement

* A:

    ```asm
    .if (number = 0)
    add number,2 
    .endif
    ```

    Rseposta: Incorreto. O correto seria == ao invés de = na comparação feita dentro do .if

* B:

    ```asm
    .if count >= 0 then 
    sub count,2 
    .else 
    add count,3 
    .endif
    ```

    Resposta: Incorreto. Não é para colocar o then após o .if

* C:

    ```asm
    .if x-1 
    dec x 
    .endif
    ```

    Resposta: Incorreto. O codigo esta certo mas não esta fazendo o que esta sendo pedido, pois não é possivel fazer uma operação dentro de diretivas, ele tratará como se fosse o endereço de x - 1.

* D:

    ```asm

    if01:       cmp x,y 
                jle endif01
                then01: inc x 
    endif01:    nop 
    ```

    Resposta: Incorreto. A função cmp não pode realizar uma compararação fazendo dois acessos a memória, para que o codigo ficasse correto seria preciso mover uma das variaveis para um registrador.

## Questão 2: Using MASM directives, write an assembly language code segment to implement the following

Resposta:

```asm
    .if a > b
        dec a;
    .else
        .if b >=c
            sub b,2
        .else
            .if c > d
                add c,d
            .else
                mov eax, d
                cdq
                mov ebx, 2
                idiv ebx
                mov d, eax
            .endif 
        .endif
    .endif
```

## QUETSÃO 3: Convert the following C selection structures to the corresponding assemblylanguage code segments. Do not use MASM directives, but rather only compares, jumps, and appropriate labels (hint: Problem B, use De Morgan’s rules)

* A

    ```c
    if (w == 1 && x == 2)
        y--;
    ```

    Resposta:

    ```asm
    if01:       cmp w,1 
                jne endif01
                cmp x,2 
                jne endif01
    then01:     dec y
    endif01:    nop 
    ```

* B

    ```asm
    if (!(num > 0 && num <= 3)) 
        count=count-2; 
    ```

    Resposta: Vamos tomar como base o seguinte

    ```c
    if(num <= 0 || num > 3)
        count = count - 2
    ```

    ```asm
    if01:       cmp num, 0
                jle then01
    or:         cmp num, 3
                jle endif01          
    then01:     sub count, 2
    endif01:    nop
    ```

* C

    ```asm
    if ( ( w == 1 || x == 2 ) && y == 3) 
        z++; 
    ```

    Resposta:

    ```asm
    if01:           cmp w, 1
                    je and01
    or01:           cmp x, 2
                    jne endif01
    and01:          cmp y, 3
                    jne endif01
    then01:         inc z
    endif01:        nop
    ```

* D

    ```asm
    if (a == 1 || b == 2 && c > 3 || d <= 4) 
        e--;
    ```

    Resposta:

    ```asm
    if01:       cmp a, 1
                je then01
    or01:       cmp c, 3
                jle or02
    and01:      cmp b, 2
                je then01 ;;se chegar aqui, então a != 1, mas c > 3
    or02:       cmp d, 4
                jg endif01
    then01:     dec e
    endif01:    nop
    ```

## Questão 4: Given the example of the if-then-else-if structure in Problem 2 above,re-implement it using a nested if-then-if structure

* Vamos nos baseas no seguinte código:

    ```c
        if (a <= b) 
            if (b < c) 
                if (c <= d) 
                    d = d / 2; 
                else 
                    c = c + d; 
            else 
                b = b - 2; 
        else 
            a = a - 1
    ```

* A: Use MASM directives.

    ```masm
        .if a <= b
        .if b < c
        .if c <= d
        mov eax, d
        cdq
        mov ebx, 2
        idiv ebx
        mov d, eax ; d = d/2
        .else
        mov eax, d
        add c, eax ; c = c + d
        .endif
        .else
        sub b, 2 ; b = b - 2
        .endif
        .else
        sub a, 1 ; a = a - 1
        .endif

    ```

* B: Do not use MASM directives, but rather compares, jumps, and appropriate
labels.

    ```asm
        if01:       mov eax, a
                    cmp eax, b
                    jg else01
        if02:       mov eax, b
                    cmp eax, c
                    jge else02
        if03:       mov eax, c
                    cmp eax, d
                    jg else03
        then03:     mov eax, d
                    cdq
                    mov ebx, 2
                    idiv ebx
                    mov d, eax ; d = d/2
        else03:     mov eax, d
                    add c, eax ; c = c + d
                    jmp endifs
        else02:     sub b, 2 ; b = b - 2
                    jmp endifs
        else01:     sub a, 1 ; a = a - 1
                    jmp endifs
        endifs:     nop
    ```

## Questão 5:  Implement the following C switch statement, which does not have a default statement, using compares, jumps, and appropriate labels. If number does not contain a 0 through 3, then the value of count should not change

```c
    switch number {
        case 0: 
        case 1: count = count +2; 
        break; 
        case 2: 
        case 3: count = count - 2; 
    }
```

```asm
Resposta: Código à parte
```

## Questão 6: Implement the program in Sect. 4.8 in assembly language without using high-level directives with only compares, jumps, and appropriate labels

```asm
        .686 
        .model flat,c 
        .stack 100h 
scanf PROTO arg2:Ptr Byte, inputlist:VARARG
printf PROTO arg1:Ptr Byte, printlist:VARARG 
        .data 
in1fmt byte "%d",0 
msg1fmt byte "%s",0 
msg2fmt byte 0Ah,"%s",0Ah,0
msg4fmt byte "%s",0Ah,0
msg6fmt byte 0Ah,0 
msg1 byte "Enter an AC voltage: ",0
msg2 byte "Voltage is Acceptable",0
msg3 byte "Warning!",0 
msg4 byte "Voltage too Low",0 
msg5 byte "Voltage too High",0 
voltage sdword ? 
        .code 
main    proc 
        INVOKE printf, ADDR msg1fmt, ADDR msg1
        INVOKE scanf, ADDR in1fmt, ADDR voltage 
        .if voltage >=110 && voltage <= 120 
        INVOKE printf, ADDR msg2fmt, ADDR msg2 
        .else 
        INVOKE printf, ADDR msg2fmt, ADDR msg3 
        .if voltage < 110 
        INVOKE printf, ADDR msg4fmt, ADDR msg4 
        .else 
        INVOKE printf, ADDR msg4fmt, ADDR msg5 
        .endif 
        .endif 
        INVOKE printf, ADDR msg6fmt
        ret 
main    endp
        end 

```

```asm
Resposta: Código à parte
```
