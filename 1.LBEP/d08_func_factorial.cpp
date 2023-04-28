#include <stdio.h>
#include <stdlib.h>

// khai bao ham tinh giai thua dc su dung
double factorial(int n);

/* demo lap trinh ham tinh giai thua cua so nguyen N */
int main()
{
    system("cls");
    printf(" >> nhap so nguyen duong : ");
    int n;
    scanf("%d", &n);

    printf(" => %d! = %.0f \n", n, factorial(n));
}

/* định nghĩa hàm tính giai thừa của số nguyên N : 1*2*3.. *N
- tên hàm: factorial
- tham số hình thức : n (kiểu int)
- giá trị trả về : giai thừa của n (kiểu duble)
*/
double factorial(int n)
{
    double r = 1;
    for (int i = 1; i <= n; i++)
    {
        r *= i; // tuong duong lenh  r = r * i;
    }
    return r;
}