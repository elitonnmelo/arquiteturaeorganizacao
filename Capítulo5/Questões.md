# Resolução das questões

## Questão 1: Given the following assembly language statements, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the statement:

* A
    ```asm
    .for i 1;i< 3;i++
    ;body of loop
    .endfor
    ```
    Resposta: Incorreto. Não existe diretivas nomedas como .for e nem .endfor.
* B
    ```asm
    mov i,1
    while i < x
    ;body of loop
    inc i
    .endw
    ```
    Resposta: Incorreto. Não é possivel realizar dois acessos a memória ao mesmo tempo em diretivas .while, e não existe somente while e sim .while.
* C
    ```asm
    mov i,0
    .repeat
    ; body of loop
    add i,2
    .until i>10
    ```
    Resposta: Correto.
* D 
    ```asm
    mov edx,3
    .repeat
    ;body of loop
    .untiledx
    ``` 
    Resposta: Incorreto. Não existe .untiledx, o correto seria .untilczx e mover o total de repetições para ecx, pois esse é o registrador responsável poressa função.

* E
    ```asm
    mov ebx,2
    .do
    ;body of loop
    .while ebx>0
    ```
    Resposta: Incorreto. Não existe em diretivas .do ( que corresponde ao do while), o correto a se usar seria .repeat e .until 
<hr>

## Questão 3:  Given the following while loops implemented using conditional and unconditional jumps, indicate how many times the body of each loop w

* A
    ```asm
                mov i,2 
    while04:    cmp i,8 
                jge endwhile04 
                ;body of loop
                add i,2 
                jmp while04
    endwhile04: nop 
    ```
    Resposta: 3 vezes.

* B
    ```asm
                    mov k,0 
    repeat05:       nop 
                    ; body of loop
                    add k,3 
                    cmp k,3 
                    jl repeat05
    endrepeat05:    nop 
    ```
    Resposta: 1 vez.
    
* C
    ```asm
                mov j,1 
    while06:    cmp j,0 
                jg endwhile06 
                ; body of loop
                inc j 
                jmp while06
    endwhile06: nop 
    ``` 
    Resposta: 0 vezes.

<hr>

