#include <stdio.h>
#include <stdlib.h>

double square(int n);
void circle(float radius, float &perimeter, float &area);
void factorial(int n);

/* bai tap lap trinh function*/
int main()
{
    system("cls");

    int op = 1;
    int n;
    double r;
    float dt,cv, bk;

    while (1 == 1)
    {
        printf("\n\n MENU \n");
        printf("=========\n");
        printf("1. tinh binh phuong \n");
        printf("2. tinh chu vi va dien tich hinh tron \n");
        printf("3. tinh giai thua \n");
        printf("4. ket thuc chuong trinh \n\n");
        printf(" >> vui long chon chuc nang [1-4]: ");
        scanf("%d", &op);

        switch (op)
        {
        case 1:
            n = 5;
            r = square(n);
            printf("\n BP cua [%d] = %.0f \n", n, r);
            break;

        case 2:
            bk = 3;
            circle(r, cv, dt);
            break;

        case 3:
            n = 6;
            factorial(n);
            break;

        case 4:
            exit(0);

        default:
            printf(" >> LOI: chon sai ma so chuc nang !!!") ;
            break;
        }
    }
}

/* ham tinh binh phuong cua 1 so nguyen - p275 */
double square(int n)
{
    printf("\n >> tinh binh phuong cua %d \n", n);
    double r = 1;
    // ...
    return r;
}

/* ham tinh dien tich va chu vi cua hinh tron */
void circle(float radius, float &perimeter, float &area)
{
    printf("\n >> tinh dien tich va chu vi hinh tron co ban kinh %.2f \n", radius);
    // tinh dien tich va chu vi hinh tron o day
}

/* ham tinh giai thua so nguyen N */
void factorial(int n)
{
    printf("\n >> tinh giai thua cua %d \n", n);
    // tinh va in giai thua cua n
}