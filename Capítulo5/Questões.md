# Resolução das questões

## Questão 1: Given the following assembly language statements, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the statement

> Correção: 0,1

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

    Resposta: Incorreto. Não existe .untiledx, o correto seria .untilcxz e mover o total de repetições para ecx, pois esse é o registrador responsável por essa função.

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

> Correção: 0,1

```asm
    mov ans,0 ; initialize ans to 0
    .if x! 0
    mov ecx,1 ; initialize ecx to 1
    .while ecx< y
    mov eax,ans ; load eax with ans
    add eax,x ; add x to ans
    mov ans,eax ; store eax in ans
    inc ecx ; increment ecx by one
    .endw
    mov i,ecx ; store ecx in i 
    .endif
```

* Resposta:

> Correção: aqui seria _jg endw01_ no lugar de _jge endw01_.

    ```asm
                mov ans, 0
                cmp x, 0
                je endif
                mov ecx, 1
    while01:    cmp ecx, y
                jge endw01
                mov eax,ans 
                add eax,x
                mov ans,eax
                inc ecx
                jmp while01
    endw01:     nop
                mov i, ecx
    endif:      nop
    ```

---

## Questão 3:  Given the following while loops implemented using conditional and unconditional jumps, indicate how many times the body of each loop w

> Correção: 0,1

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

> Correção: 0,1.

```asm
    mov ans,0
    .if y! 0 
    mov ecx,1
    .repeat
    mov eax,ans
    add eax,x
    mov ans,eax
    inc ecx
    .until ecx>y
    mov i,ecx
    .endif
```

* Resposta:

    ```asm
                    mov ans, 0
                    .if y! 0 
                    mov ecx,1
        repeat01:   nop
                    mov eax, ans
                    add eax, x
                    mov ans, eax
                    inc ecx
                    cmp ecx, y
                    jle repeat
        until01:    nop
                    mov i, ecx
                    .endif 
    ```

---

## Questão 5: Implement unsigned divide (similar to the div instruction) using repetitive subtraction, with your choice (or your instructor’s choice) of any of the following (start with the dividend in eax and the divisor in ebx, then place the quotient in eax and the remainder in edx Note: Do not worry about division by zero or negative numbers)  

* A: .while
* B: .repeat - .until
* C: .repeat - .untilcxz

---
Resposta : Código à parte

---

## Questão 6:  Implement the following C segment using the .repeat - .untilcxz directives. What if the value of n is 0 or negative? Does your code segment still work properly? How can this problem be rectified?

> Correção: 0,1

```c
    sum = 0;
    for (i  = 1; i < n; i++)
        sum = sum + i;
```

Resposta:

```asm
    .if n > 0 ;garante que não irá executar 
    mov sum, 0 ;o laço se n <= 0
    mov ecx, n
    .repeat
    add sum, ecx
    .untilcxz
    .endif
```

---

## Questão 7: Implement the following do-while loop first using the .repeat - .until directives and then using only compares, and conditional and unconditional jumps

> Correção: 0,2

```c
    i = 10;
    sum = 0;
    do {
        sum = sum+i;
        i = i-2;
    } while i>0;
```

Resposta:

Usando diretivas

```asm
mov eax, sum
mov ecx, i
.repeat
add eax, ecx
sub ecx, 2
.until ecx <= 0
mov sum, eax

```

Usando cmp

```asm
            mov eax, sum
            mov ecx, i
doWhile01:  nop
            add eax, ecx
            sub ecx, 2
            cmp ecx, 0
            jg doWhile01      
endDoWhile: nop
            mov sum, eax

```

---

## Questão 8: Implement the last code segment in Sect. 5.5 using the loop instruction instead of .repeat and .untilcxz directives

> Correção: 0,2

```asm
mov ecx,2
.repeat
mov tempecx,ecx
mov ecx,3
.repeat
; body of nested loop
.untilcxz
mov ecx,tempecx
.untilcxz
```

Resposta:

```asm
        mov ecx,2
for01:  nop
        mov tempecx,ecx
        mov ecx,3
for02:  nop
        ; body of nested loop
        loop for02
        mov ecx,tempecx
        loop for01
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

> Correção: 0,5. Por que fez a 10 como programa completo, mas a 9 apenas os trechos?

* A. .while
* B. .repeat - .until
* C. .repeat - .untilcxz

Resposta:

* A

> Correção: Você decrementou _ecx_ antes da primeira multiplicação. Logo os resultados estão incorretos.

    ```asm
    mov eax, number
    mov ecx, number
    .if eax == 1 || eax == 0
    INVOKE printf, ADDR msg2; caso o número seja 1 ou 0  o resultado será 1
    .else
    .while ecx > 1
    dec ecx
    imul ecx
    .endw  
    mov result, eax
    .endif
    ```

* B

    ```asm
    mov eax, number
    mov ecx, number
    .if eax == 1 || eax == 0
    INVOKE printf, ADDR msg2; caso o número seja 1 ou 0  o resultado será 1
    .else
    .repeat
    dec ecx
    imul ecx
    .until ecx <= 1
    mov result, eax
    .endif
    ```

* C

    ```asm
    mov eax, number
    mov ecx, number
    dec ecx
    .if eax == 1 || eax == 0
    INVOKE printf, ADDR msg2; caso o número seja 1 ou 0  o resultado será 1
    .else
    .repeat
    .if ecx > 0
    imul ecx
    .endif
    .untilcxz 
    mov result, eax
    .endif
    ```

---

## Questão 10: Given the Fibonacci sequence defined iteratively as follows

```c
if n = 0, then 0
if n = 1, then 1
if n = 2, then 0 + 1 = 1
if n = 3, then 1 + 1 = 2
if n = 4, then 1 + 2 = 3
etc.
```

### implement the above function iteratively with your choice (or your instructor’s choice) of any of the following

* A. .while
* B. .repeat - .until
* C. .repeat - .untilcxz

Resposta:

* A:

  * Vamos tomar como base o seguinte código:

    ```c
        #include <stdio.h>

        int main() {
            int n, first = 0, second = 1, proximo, result = 0;
            
            scanf("%d", &n);

            while (n > 0) {
                proximo = first + second;
                first = second;
                second = proximo;
                n--;
            }
            result = first;
            printf("%d, ", result);

            return 0;
        }
        ```

  * Resposta: código a parte

* B:

  * Vamos tomar como base o seguinte código:

    ```c
        #include <stdio.h>

        int main() {
            int n, first = 0, second = 1, nextTerm;

            scanf("%d", &n);
            
            if(n >0){
                do {
                    printf("%d, ", first);
                    nextTerm = first + second;
                    first = second;
                    second = nextTerm;
                    n--;
                } while (n > 0);
            }

            result = first;
            printf("%d, ", result);
            return 0;
        }
        ```

  * Resposta: código a parte

* C:

  * Vamos tomar como base o seguinte código:

    ```c
        #include <stdio.h>

        int main() {

        int n, first = 0, second = 1, nextTerm;

        scanf("%d", &n);

        for (int i = 1; i <= n; i++) {
            printf("%d, ", first);
            nextTerm = first + second;
            first = second;
            second = nextTerm;
        }

        result = first;
        printf("%d", result);

        return 0;
        }
        ```

  * Resposta: código a parte
