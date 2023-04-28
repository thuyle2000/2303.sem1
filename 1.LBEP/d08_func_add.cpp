#include <stdio.h>
#include <stdlib.h>

// khai bao prototype
int sum(int a, int b);

/* demo lap trinh ham cong 2 so nguyen */
int main()
{
    system("cls");

    int x = 12, y = 20;

    // thuc hien phep cong 12 va 20 thong qua ham sum()
    int r = sum(x, y);
    printf("\t %d + %d = %d \n", x, y, r);
    printf("\t %d + %d = %d \n", x, 20, sum(x, 20));
    printf("\t %d + %d = %d \n", x, 20, sum(x, x+8));
}

/* dinh nghia ham cong 2 so o day:
- ten ham: sum
- tham so hinh thuc : a, b (kieu int)
- gia tri tra ve : tong a va b (kieu int)
*/
int sum(int a, int b)
{
    int r = a + b;
    return r;
}
