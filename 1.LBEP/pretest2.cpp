#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Q1();
void Q2();

int main()
{
    system("cls");
    int op = 0;
    while (1 == 1)
    {
        printf("\n\n");
        printf("**************************************************\n");
        printf("* Selecting appropriate action:                  *\n");
        printf("* 1. Question 1                                  *\n");
        printf("* 2. Question 2                                  *\n");
        printf("* 3. Quit program                                *\n");
        printf("**************************************************\n");
        printf("  plz choice [1-3]: ");
        scanf("%d", &op);
        switch (op)
        {
        case 1:
            Q1();
            break;
        case 2:
            Q2();
            break;
        case 3:
            return 0;
        default:
            printf(" >> ERROR: invalid choice !!!\n");
            break;
        }
    }
}

void Q1()
{
    int n;
    printf("\n >> Enter an integer number N: ");
    scanf("%d", &n);

    // dem cac uoc so le cua N
    int cntOdd = 0;
    printf("Odd divisors of %d are:", n);
    for (int i = 1; i <= n; i += 2)
    {
        if (n % i == 0)
        {
            printf(" %d ", i);
            cntOdd++;
        }
    } // ket thuc FOR

    printf("\nNumber of odd divisors of %d : %d \n", n, cntOdd);
}

struct RECTANGLE
{
    int w, h;
    char color[21];
};

void Q2()
{
    int n;

    while (1 == 1)
    {
        printf(" Enter the number of rectangles [3-10]: ");
        scanf("%d", &n);
        if (n >= 3 && n <= 10)
        {
            break;
        }
    }

    struct RECTANGLE ds[n];
    printf("\n Please enter the data for \n");
    for (int i = 0; i < n; i++)
    {
        printf(" Rectangle no %d:\n", i + 1);
        printf("\t Width: ");
        scanf("%d", &ds[i].w);

        printf("\t Height: ");
        scanf("%d", &ds[i].h);

        fseek(stdin, 0, SEEK_END);
        printf("\t Color: ");
        gets(ds[i].color);
    }

    printf("\n\n Lists of Rectangles \n");
    printf(" %6s %8s %8s %10s %8s\n", "No", "Width", "Height","Area", "Color");

    for (int i = 0; i < n; i++)
    {
        printf(" %6d %8d %8d %10d %8s\n", i+1, ds[i].w, ds[i].h,ds[i].w*ds[i].h, ds[i].color);
    }
    printf(">> Total %d Rectangles \n", n);

}