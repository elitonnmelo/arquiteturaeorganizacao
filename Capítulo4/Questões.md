# Questão 1: Indicate whether the following statements are syntactically correct or incorrect in MASM. If incorrect, indicate what is wrong with the statement:
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
    Resposta: Correto.

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


# QUETSÃO 3: Convert the following C selection structures to the corresponding assemblylanguage code segments. Do not use MASM directives, but rather only compares, jumps, and appropriate labels (hint: Problem B, use De Morgan’s rules):

* A
    ```asm 
    f (w == 1 && x == 2)
        y-;
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
    Resposta: 
    ```asm
    if01:       cmp num, 0
                jg endif01
    and01:      cmp num, 3
                jle endif01
                sub count,2
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
                je and01
    or01:       cmp c, 3
                jne endif01
    and01:      cmp c, 3
                jle endif01
    or02:       cmp d, 4
                jg endif01
    then01:     dec e
    endif01:    nop
    ```