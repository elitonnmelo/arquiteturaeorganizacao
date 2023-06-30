# Resolução das questões

## Questão 1:  Given the following assembly language statements, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the statement

* A. Resposta: Incorreto, o corrreto seria movsb e não movesb

    ```asm
    movesb
    ```

* B. Resposta: Correto.

    ```asm
    cmpsb
    ```

* C. Resposta: Correto.

    ```asm
    scasb
    ```

* D. Resposta: Incorreto, o correto seria storsb e não stosb

    ```asm
     stosb
    ```

* E. Resposta: Incorreto, o correto seria rep stosb e não rept strsb

    ```asm
     rept strsb
    ```

* F. Resposta:  Incorreto, o correto seria lodsb e nao loadsb

    ```asm
    loadsb
    ```

---

## Questão 2: Given the following declarations, walk through the following code segments and indicate the contents of the ecx, esi, edi, and al registers upon completion of each segment. You may assume that string1 starts at memory location 100 and string2 at memory location 105. With problem D, in addition to the registers, what would be the contents of string2?

´´´´string1 byte "abcde"
>string2 byte "abcyz"

* A

    ```asm
    mov ecx,5
    mov al,"c"
    mov edi,offset string1
    rep scasb
    ```

* B

    ```asm
    mov esi,offset string1+3 
    Lodsb
    ```

* C

    ```asm
    mov ecx,5
    mov esi,offset string1
    mov edi,offset string2
    repe cmpsb
    ```

* D

    ```asm
    mov ecx,5 
    mov esi,offset string1
    mov edi,offset string2
    repne cmpsb
    ```

* E

    ```asm
    lea edi,string2
    mov al,"d"
    stosb
    ```

---

## Questão 3:  Using the esi and edi registers and a.repeat-untilcxz loop, determine whether the word in a string is a palindrome. For the sake of convenience, assume that the string is 10 elements long and all the words in the string are also 10 characters long. Do not use a stack

* Resposta: Código à parte
