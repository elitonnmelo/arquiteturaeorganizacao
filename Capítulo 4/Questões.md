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
    Resposta: 