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

* C-<br> mov c, 2
   <br>mov eax, c
   <br>mov b, eax
   <br>mov eax, b
   <br>mov a, eax

* D-<br> mov y, 1
   <br>mov eax, y
   <br>mov x, eax

* E- <br>mov a, 1 
   <br>mov b, 2
   <br>mov eax, a
   <br>mov c, eax
   <br>mov eax, b
   <br>mov a, eax
   <br>mov eax, c
   <br>mov b, eax

# Questão 5

* A- mov a, 'B'

* B-<br> mov al, c
   <br>mov b, al

* C-<br> mov d, 'E'
   <br>mov al, d
   <br>mov e, al

* D- <br>mov d, 'z'
   <br>mov al, d
   <br>mov a, al
   <br>mov al, a
   <br>mov b, al

* E-<br> mov a, '2'
   <br>mov b, '?'
   <br>mov al, b
   <br>mov a, al

   