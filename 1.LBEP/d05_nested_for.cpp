#include <stdio.h>
#include <stdlib.h>
/* demo vong lap for long nhau */
int main(){
    system("cls");
    
    int dong, cot;

    printf(" - nhap so dong muon in: ");
    scanf("%d" , &dong);

    printf(" - nhap so ngoi sao tren 1 dong: ");
    scanf("%d" , &cot);

    for (int i = 0; i < dong; i++)
    {
        printf("\n");
        for (int k = 0; k < cot; k++)
        {
            printf("* ");
        }
    }
    
}