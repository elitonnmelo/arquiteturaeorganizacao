# Resolução das questões

## Questão 1: Given the following assembly language statements, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the statement

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

---

## Questão 2: Implement the last code segment in Sect. 5.1 without using directives and using only conditional and unconditional jumps

```asm

```

---

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

---

## Questão 4:  Implement the .repeat and .until directive at the end of Sect. 5.2 using only compare and jump instructions, along with the appropriate label names

```asm

```

---

## Questão 5: Implement unsigned divide (similar to the div instruction) using repetitive subtraction, with your choice (or your instructor’s choice) of any of the following (start with the dividend in eax and the divisor in ebx, then place the quotient in eax and the remainder in edx Note: Do not worry about division by zero or negative numbers)  

* A: .while
* B: .repeat - .until
* C: .repeat - .untilcxz

* Resposta : Código à parte

---

## Questão 6:  Implement the following C segment using the .repeat - .untilcxz directives. What if the value of n is 0 or negative? Does your code segment still work properly? How can this problem be rectified?

```c
    sum 0;
    for (i 1; i< n; i++)
    sum sum + i;
```

Resposta:

```asm

```

---

## Questão 7: Implement the following do-while loop first using the .repeat - .until directives and then using only compares, and conditional and unconditional jumps

```c
    i 10;
    sum 0;
    do {
    sum sum+i;
    i i-2;
    } while i>0;
```

Resposta:

```asm

```

---

## Questão 8: Implement the last code segment in Sect. 5.5 using the loop instruction instead of .repeat and .untilcxz directives

Resposta:

```asm

```

---

## Questão 9: Given the factorial function (n!) defined iteratively as follows

```c
if n = 0 or n = 1, then 1
if n = 2, then 1 * 2=2
if n = 3, then 1 * 2 * 3=6
if n = 4, then 1 * 2 * 3 * 4 = 24
etc.
```

### Implement the above function iteratively with your choice (or your instructor’s choice) of any of the following

* A. .while
* B. .repeat - .until
* C. .repeat - .untilcxz

Resposta:

## Questão 10: Given the factorial function (n!) defined iteratively as follows

```c
if n = 0, then 0
if n = 1, then 1
if n = 2, then 0 + 1 = 1
if n = 3, then 1 + 1 = 2
if n = 4, then 1 + 2 = 3
etc.
```

### Implement the above function iteratively with your choice (or your instructor’s choice) of any of the following

* A. .while
* B. .repeat - .until
* C. .repeat - .untilcxz

Resposta:
