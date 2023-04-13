# Questão 1

* A- Correta
* B- Incorreta, é necessário começar com letras
* C- Correta, mas usar símbolos não é recomendado
* D- Correto, mas não é recomendado utilizar símbolos no começo
* E- Correto, mas não é recomendado utilizar símbolos
* F- Incorreta, o caractere '.' não pode ser usado como símbolo especial

# Questão 2

* A- initial byte ? 

* B- grade byte 'B'

* C-  

```asm
x byte 'P'
y byte 'Q'
```

* D- amount sdword ?

* E- count sdword 0

* F- number sdword -396

# Questão 3

* A- Incorreto, o correto é mov

* B- Incorreto, não pode haver dois acessos a memória no mov

* C- Correto

* D- Correto

* E- Incorreto, não é possível mover um conteúdo de uma variável para uma constante, a ordem deveria ser invertida

* F- Correto

* G- Incorreto, não é possível realizar uma operação dentro do mov(nesse caso uma operação unária)

* H- Correto, mas procurar utilizar os registradores certos, nesse caso o eax para movimentar números

# Questão 4

* A- mov i, 1

* B-

```asm
mov eax, x
mov y, eax
```

* C-

```asm
mov c, 2
mov eax, c
mov b, eax
mov eax, b
mov a, eax
```

* D-

```asm
mov y, 1
mov eax, y
mov x, eax
```

* E-

```asm
mov a, 1 
mov b, 2
mov eax, a
mov c, eax
mov eax, b
mov a, eax
mov eax, c
mov b, eax
```

# Questão 5

* A- mov a, 'B'

* B-

```asm
mov al, c
mov b, al
```

* C-

```asm
 mov d, 'E'
mov al, d
mov e, al
```

* D-

```asm
mov d, 'z'
mov al, d
mov a, al
mov al, a
mov b, al
```

* E-

```asm
mov a, '2'
mov b, '?'
mov al, b
mov a, al
```
