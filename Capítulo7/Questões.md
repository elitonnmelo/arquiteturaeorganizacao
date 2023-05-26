# Resolução das Questões

## Questão 1: Given the following assembly language statements and assuming memory locations and labels are properly declared, indicate whether they are syntactically correct or incorrect. If incorrect, indicate what is wrong with the stateme

---

* A : Incorreto, o correto é ret
* B : Correto
* C : Incorreto, o correto é ifb sem o ponto
* D : Correto
* E : Incorreto, não podemos comparar eax com um número, já que o valor dele só é definido na execução
* F : Incorreto, faltou os parâmetros de comparação após o endif
* G : Correto
* H : Correto
* I : Incorreto, não existe ifne

---

## Questão 2: Write a procedure to implement the factorial function as defined in the exercise section of Chap. 5

---

* Resposta: Código à parte

---

## Questão 3: Write a procedure to implement the Fibonacci numbers as defined in the exercise section of Chap. 5

---

* Resposta: Código à parte

---

## Questão 4: Write a macro to implement the factorial function as defined in the exercise section of Chap. 5

---

* Resposta: Código à parte

---

## Questão 5: Write a macro to implement the Fibonacci numbers as defined in the exercise section of Chap. 5

---

* Resposta: Código à parte

---

## Questão 6: Using conditional assembly, modify the MULACC macro defined in this chapter to not only eliminate the redundant looping but also not generate the loop instruction itself in the case that the multiplier in the operand is 0 and the answer is 0, or when it is 1 and the answer is just the value in the accumulator. (Hint: Use the power macro as an example.)

---

* Resposta:
    ```asm
    MULTACC macro operand

            push ebx            ;; save ebx and ecx
            push ecx
            mov ebx,eax         ;; mov eax to ebx
            mov eax,0           ;; clear accumulator to zero
            mov ecx,operand     ;; load ecx with operand

            if operand LT 0     ;; if operand is negative
            neg ecx             ;; make ecx positive for loop
            endif

            if operand eq 0
            mov eax, 0
            endif

            if operand eq 1
            mov eax, ebx
            endif

            if ecx GT 0
            .while ecx >0
            add eax,ebx         ;; repetitively add
            dec ecx             ;; decrement ecx
            .endw
            endif

            if operand LT 0     ;; if operand is negative
            neg eax             ;; negate accumulator, eax
            endif

            pop ecx             ;; restore ecx and ebx
            pop ebx

            endm
    ```

---

## Questao 7: Implement the following instructions as macros as part of the macro calculator problem in the last section of this chapter. For the division macro, use conditional assembly to solve any problems with negative numbers. Also, when dealing with the possibility of division by 0, a -1 should be returned from the macro to indicate an error

---

* Resposta:

---
