#include <stdio.h>
#include <stdlib.h>
/*
Accept two numbers num1 and num2. Find the sum of all odd numbers between the two numbers entered.
*/
int main(){
    system("cls");

    int n1, n2;

    printf(" - nhap so nguyen thu 1 (n1) : ");
    scanf("%d", &n1);

    do
    {
        printf(" - nhap so nguyen thu 2 (n2 >= n1): ");
        scanf("%d", &n2);
    } while (n1>n2);
    
    printf("\n => n1 = %d, n2 = %d \n\n", n1, n2);

    int sum = 0;
    int start = (n1%2==0)? n1+1: n1;

    for (int i = start; i <= n2; i+=2)
    {
        sum += i;
        printf(" %d +", i);
    }

    printf("\b = %d \n", sum);
}