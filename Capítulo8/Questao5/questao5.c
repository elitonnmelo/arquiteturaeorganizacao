#include <stdio.h>

#define TAMANHO_ARRAY 20

int main() {
    int array1[TAMANHO_ARRAY];
    int array2[TAMANHO_ARRAY];

    printf("Digite os 20 números:\n");

    // Preenchendo o array1 com os números fornecidos pelo usuário
    for (int i = 0; i < TAMANHO_ARRAY; i++) {
        printf("Número %d: ", i + 1);
        scanf("%d", &array1[i]);
    }

    // Copiando os elementos de array1 para array2
    for (int i = 0; i < TAMANHO_ARRAY; i++) {
        array2[i] = array1[i];
    }

    // Imprimindo o conteúdo de array2
    printf("\nElementos do array2:\n");
    for (int i = 0; i < TAMANHO_ARRAY; i++) {
        printf("%d ", array2[i]);
    }
    printf("\n");

    return 0;
}
