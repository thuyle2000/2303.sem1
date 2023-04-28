#include <stdio.h>
#include <stdlib.h>

double factorial(int n);
double square(int n);

/*demo ve con tro ham (function pointer) */
int main()
{
    system("cls");

    int n = 5;

    // khai bao con tro ham ten la fn, co kieu double va co 1 tham so int
    double (*fn)(int);

    //de tinh binh phuong cua n, thong qua fn:
    fn = square;
    double r = fn(n);
    printf("\t Binh phuong cua %d = %.0f \n", n, r);

    //de tinh giai thua cua n, thong qua fn:
    fn = factorial;
    r = fn(n);
    printf("\t Giai thua cua %d = %.0f \n", n, r);

}

double factorial(int n)
{
    double r = 1;
    for (int i = 2; i <= n; i++)
    {
        r *= i;
    }
    return r;
}

double square(int n)
{
    double r = n * n;
    return r;
}