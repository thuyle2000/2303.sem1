#include <stdio.h>
#include <stdlib.h>

int main(){
    system("cls");

    int ds[] = {10, 20, 6, 24, 76, 5};
    int n = 6;

    printf(" day so: ");
    for (int i = 0; i < n; i++)
    {
        printf(" %d,", ds[i]);
    }
    printf("\b. \n");
    
    printf(" day so dao nguoc: ");
    for (int i = n-1; i >=0 ; i--)
    {
        printf(" %d,", *(ds+i) );
    }
    printf("\b. \n");
}