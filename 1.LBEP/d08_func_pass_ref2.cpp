#include <stdio.h>
#include <stdlib.h>
/*
   demo truyen tham so theo pp call-by-reference (version 2):
   truyen gia tri cua tham so thuc te -> tham so hinh thuc
 */
void sum(int a, int b, int &r);
int main()
{
    system("cls");

    int n1 = 10, n2 = 23, r = 0;
    printf(" >> gia tri cua r, truoc khi goi ham sum(): %d \n", r);
    sum(n1, n2, r);
    printf(" >> gia tri cua r, sau khi goi ham sum(): %d \n", r);
}

/* dinh nghia ham cong 2 so nguyen, nhung ko co gia tri tra ve
   ten ham : sum
   tham so : int a, int b, int *r
   gia tri tra ve: void
*/
void sum(int a, int b, int &r)
{
    r = a + b;
    printf("\t %d + %d = %d \n", a, b, r);
    return;
}