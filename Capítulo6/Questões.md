# Resolução das Questões

## Questão 1: Given the following assembly language statements, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the statement

> Correção: 0,5

---

* A: Correto

* B: Correto

* C: Incorreto. Não existe a instrução rotate, e sim rol ou ror

* D: Correto

* E: Correto

* F: Incorreto. Não é possivel realizara operação xchg realizando dois acessos a memória

* G: Incorreto. Não existe o registrador exc, e sim ecx

* H: Incorreto. Não existe a instrução lol, e sim rol.

* I: Incorreto. Não existe a intrução shift e sim shr e shl que são usados como operções de shifts.  

---

## Questão 2: Given the following C arithmetic instructions, implement them using arithmetic shift instructions, where possible

> Correção: 0,5

---

* A: answer = num - total / 32

    ```asm
        mov eax, total
        sar eax, 5
        mov edx, num
        sub edx, eax
        mov answer, edx
    ```

* B: result = (amount + number) * 4

    ```asm
        mov amount, eax
        add eax, number
        sal eax, 2
        mov result, eax
    ```

* C: x = y * 8 + z / 2

    ```asm
        mov eax, y
        sal eax, 3
        mov edx, z
        sar edx, 1
        add eax, edx
        mov x, eax
    ```

* D: a = a / 16 – b * 6

    ```asm
        sar a, 4 ; a / 16
        mov eax, b
        mov ebx, 3
        imul ebx ; b * 3
        sal eax, 1 ; (b * 3) * 2 = b * 6
        sub a, eax
    ```

---

## Questão 3: Write a code segment that takes the contents of eax, ebx, ecx, and edx, and puts them in the reverse order of edx, ecx, ebx, and eax using only the push and pop instructions. In other words, eax should contain the contents of edx and vice versa, etc

> Correção: 0,5

---

* Resposta

    ```asm
    ;; levando valores de eax, ebx, ecx, edx para a pilha
    push eax
    push ebx
    push ecx
    push edx

    ;; retirando os valores de eax, ebx, ecx, edx da pilha já com os valores trocados
    pop eax
    pop ebx
    pop ecx
    pop edx
    ```

---

## Questão 4: Assume that a status register in a processor indicates the current state of a photocopying machine according to the following table. For each bit, output an appropriate message indicating the status of the machine. Note that although there can be more than one bit set at one time, only one error message can be generated, where bit 0 has the highest priority, followed by bit 1, etc. At the discretion of the instructor, implement using high-level directives, without high-level directives, or a combination as shown in the text

---

### Bit Message

* 0 Paper jam
* 1 Paper misfeed
* 2 Paper tray empty
* 3 Toner low  
* 4 Toner empty

---

* Resposta: Código à parte

---

## Questao 5: Similar to the program in Sect. 6.8, write a program to simulate a security alarm system according to the following table, where it is possible that any of the first three high-priority items could happen at the same time. Although the last three items can also occur at the same time, the program should check and output messages for them only when none of the higher priority first three items have occurred

---

### Bit Message

* 0 Paper jam
* 1 Paper misfeed
* 2 Paper tray empty
* 3 Toner low  
* 4 Toner empty

---

* Resposta: Código à parte

---
