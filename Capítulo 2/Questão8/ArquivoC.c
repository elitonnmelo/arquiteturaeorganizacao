#include <stdio.h>

int main(){
    int num1, num2;
    printf("%s", "Enter a number: ");
    scanf("%d", &num1);
    printf("%s", "Enter a number: ");
    scanf("%d", &num2);
    printf("%s%s%d%s%d", "Numbers\n", "  ", num1, "\n  ", num2);
}