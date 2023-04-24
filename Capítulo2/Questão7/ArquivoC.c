#include <stdio.h>

int main(){
    int number, larger, evenlarger;

    printf("%s", "Enter a number: ");
    scanf("%d", &number);
    printf("%s", "Enter a larger number: ");
    scanf("%d", &larger);
    printf("%s", "Enter a even larger number: ");
    scanf("%d", &evenlarger);
    printf("\n%d%s%d%s%d\n\n", number, " < ", larger, " < ",evenlarger);
    printf("%d%s%d%s%d", evenlarger, " > ", larger, " > ", number);
}