# Questões do Terceiro Capítulo

## Questão 1

* A- Incorreto, inc é uma operação unária, então só tem um operando
* B- Correto
* C- Incorreto, não podemos fazer operações com dois dados na memória
* D- Incorreto, idiv só pode ser feito com memória ou registrador
* E- Incorreto, não é possível subtrair e guardar o resultado no imediato, é necessário inverter a ordem para fazer essa operação
* F- Correto, esse caso seria como elevar o valor de eax ao quadrado

## Questão 2

* A-

```asm
mov eax, 3
imul number
mov product, eax
```

* B-

```asm
mov eax, number
cdq
idiv amount
mov result, edx
```

* C-

```asm
mov eax, number
mov ebx, 2
cdq
idiv ebx
mov answer, eax
```

* D-

```asm
mov eax, number
neg eax
add eax, 4
mov difference, eax
```

## Questão 3

* A-

```asm
mov eax, x
imul y
mov ecx, eax
mov eax, z
mov ebx, 2
imul ebx
add ecx, eax
mov x, ecx
```

* B-

```asm
mov eax, c
mov ebx, 3
cdq
idiv ebx
neg eax
add eax, b
mov a, eax
```

* C-

```asm
mov eax, num3
imul num4
mov ebx, eax
mov eax, num1
cdq
idiv num2
sub eax, ebx
mov total, eax
```

* D-

```asm
mov eax, s
neg eax
add eax, t
inc t
mov r, eax
```

* E-

```asm
mov eax, i
sub eax, j
imul k
imul n
mov m, eax
```

* F- 

```asm
mov eax, c
cdq
idiv d
imul e
mov ebx, eax
mov eax, b
neg eax
add eax, a
add eax, ebx
mov q, eax
```

## Questão 4

* A-

```asm
dec i
```

* B-

```asm
inc k
mov eax, m
neg eax
add eax, k
mov j, eax
```

* C-

```asm
mov eax, x
add eax, y
neg eax
mov z, eax
```

* D-

```asm
inc b
mov eax, c
neg eax
add eax, b
inc c
mov a, eax
```

* E-

```asm
mov eax, y
neg eax
add eax, z
dec z
mov x, eax
```

## Questão 5 a 7

* Código à parte
