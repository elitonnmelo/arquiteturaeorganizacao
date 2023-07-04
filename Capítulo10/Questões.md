# Resolução das Questões

## Questão 1: Given the following variables, what are the results in the variable z for each of the following code segments?

```asm
    w real8 2.0 
    x real8 5.5
    y real8 6.5
    z sdword ?
```

---

* A:

```asm
fld w
fld y
fadd
fistp z
```

Resposta:

```asm

```

---

* B:

```asm
fld y
fld w
fdiv
fld x
fadd
fisttp z
```

Resposta:

```asm

```

---

* C:

```asm
fld y
fld w
fsub
fistp z
```

Resposta:

```asm

```

---

* D:

```asm
fld w
fld y
fadd
fist z
fld w
fadd
fistp z
```

Resposta:

```asm

```

---

## Questao 2: Convert the following C-like arithmetic instructions into post-fix form and then write the corresponding assembly language instructions. Assume that all variables are of type real8

* a. answer = x – y + z;

    Resposta:
    * *Post-fix form:* xy-z+

     ```asm
    fld x
    fld y
    fsub
    fld z
    fadd
    fstp answer
    ```

* b. result = (w + x) / (y – z);

    * *Post-fix form:* wx+yz-/

    Resposta:

     ```asm
    fld w
    fld x
    fadd

    fld y
    fld z
    fsub

    fdiv

    fstp result
    ```

* c. info = a / b * c – d;

    * *Post-fix form:* ab/c*d-

    Resposta:

     ```asm
    fld a
    fld b
    fdiv

    fld c
    fmul

    fld d
    fsub

    fstp info
    ```

* d. data = i * j + (k / (m – n));

    * *Post-fix form:* ij*kmn-/+

    Resposta:

     ```asm
    fld i
    fld j
    fmul

    fld k
    fld m
    fld n
    fsub

    fdiv

    fadd

    fstp data
    ```

---

## Questão 3: Write the equivalent assembly language code segment for the C program in Sect. 10.7.3 (which uses type long double)

### Code

```c
    #include <stdio.h>
    int main() {
    long double x,y;
    printf("\n%s", "Enter a long double for x: ");
    scanf_s("%Lf", &x);
    y = x;
    printf("\n%s%6.4Lf\n\n", "The long double in y is: ", y);
    return 0;
    } 
```

### Resposta

```asm

```

---

## Questao 4: Given the code using inline assembly in Sect. 10.7.4, rewrite it to work with float and long double types (Hint: For type float, see Sect. 10.7.1)

### Code

```c
    #include <stdio.h>

    int main() {

    double x,y;

    printf("\n%s", "Enter a double for x: ");
    scanf_s("%lf", &x);

    __asm {
    fld x
    fstp y
    }

    printf("\n%s%6.4f\n\n", "The double in y is: ", y);
    return 0;
    }
```

### Resposta float

```asm

```

### Resposta long double

```asm

```

---

## Questão 5: Alter the if-then code segment at the begining of Sect. 10.8 to implement an if-then-else structure to output the message “x is less than or equal to y” in the else section

### Code

```asm
        ;if x > y
if01:   fld y
        fld x
        fcomip st(0), st(1)
        jbe endif01
then01: INVOKE printf, ADDR msg2fmt, ADDR msg2
endif01: nop
```

### Resposta

```asm

```

---

## Questão 6: Alter the if-then-else-if code segment in Sect. 10.8 to add an else section to the nested if statement to output the message “x and y are equal”

### Code

```asm
        ;if x > y
        if01: fld y
        fld x
        fcomip st(0), st(1)
        jbe else01
then01: INVOKE printf, ADDR msg2fmt, ADDR msg2
        jmp endif01
else01: nop
        ;if x < y
if02:   fld y
        fld x
        fcomip st(0), st(1)
        jae endif02
then02: INVOKE printf, ADDR msg2fmt, ADDR msg3
endif02: nop
endif01: nop
```

### Resposta

```asm

```

---

## Questão 7: Change the complete program in Sect. 10.9 to implement a do-while structure (post-test loop) instead of while structure (pre-test loop). Make sure that it works properly for 0.0 and negative numbers

---
* Resposta: Código à Parte

---

<br>

## Questão 8: Change the complete program in Sect. 10.10 to instead prompt for and input the five numbers

* Resposta: Código à Parte
