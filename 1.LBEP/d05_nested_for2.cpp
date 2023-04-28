#include <stdio.h>
#include <stdlib.h>
/* demo vong lap for long nhau */
int main()
{
    system("cls");

    int dong;

    printf(" - nhap so dong muon in: ");
    scanf("%d", &dong);

    for (int i = 0; i < dong; i++)
    {
        printf("\n");
        for (int k = 0; k <= i; k++)
        {
            printf("* ");
        }
    }

    printf("\n");

    for (int i = dong; i > 0 ; i--)
    {
        printf("\n");
        for (int k = 0; k < i; k++)
        {
            printf("* ");
        }
    }
}