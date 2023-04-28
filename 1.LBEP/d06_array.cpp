#include <stdio.h>
#include <stdlib.h>

/*demo lap trinh mang so nguyen*/
int main(){

    system("cls");
    //khai bao mang a chua 10 so nguyen
    int a[10] = {2,4,6,8,10,9,7,5,3,1};

    //in cac phan tu trong mang a ra man hinh
    printf("\n Cac phan tu cua mang a[]: \n");
    for (int i = 0; i < 10; i++)
    {
        printf(" %d ,", a[i]);
    }
    printf("\b.");

}