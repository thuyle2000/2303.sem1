#include <stdio.h>
int main()
{
    printf(" ** Demo cac phep toan so hoc *** \n");
    int n1, n2, n3;

    printf(" - nhap so thu 1: ");
    scanf("%d", &n1);

    printf(" - nhap so thu 2: ");
    scanf("%d", &n2);

    printf("\n >> Phep toan 1 ngoi : ++, -- \n");
    printf(" n1 = %d, n2=%d \n", n1, n2);
    n3 = n1++;
    printf(" n3 (=n1++) = %d, n1 = %d  \n", n3, n1);

    n3 = ++n2;
    printf(" n3 (=++n2) = %d, n2 = %d  \n", n3, n2);

    printf("\n >> Phep toan so hoc 2 ngoi : + - */ %% \n");
    printf(" %d + %d = %d \n", n1, n2, n1+n2);
    printf(" %d - %d = %d \n", n1, n2, n1-n2);
    printf(" %d * %d = %d \n", n1, n2, n1*n2);
    printf(" %d / %d = %d \n", n1, n2, n1/n2);
    printf(" %d %% %d = %d \n", n1, n2, n1%n2);

}