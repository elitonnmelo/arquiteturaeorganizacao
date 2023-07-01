#include <stdio.h>

void bubble_sort (int vetor[], int n) {
    int i, j, aux;

    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - i - 1; j++) {
            if (vetor[j] > vetor[j + 1]) {
                aux          = vetor[j];
                vetor[j]     = vetor[j + 1];
                vetor[j + 1] = aux;
            }
        }
    }
}

int main()
{
    int vetor[10] = {5, 3, 2, 4, 7, 1, 0, 6, 9, 8};
    int i;
    bubble_sort(vetor, 10);
    for (i = 0; i < 10; i++)
    {
        printf("%d ", vetor[i]);
    }
    return 0;
}