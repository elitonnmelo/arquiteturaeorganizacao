# Resolução das questões

## Questão 1: Given the following assembly language statements, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the statement:

* A
    ```asm
    .for i 1;i< 3;i++
    ;body of loop
    .endfor
    ```
    Resposta: Incorreto. Não existe diretivas nomedas como .for e nem .endfor
* B
    ```asm
    mov i,1
    while i < x
    ;body of loop
    inc i
    .endw
    ```