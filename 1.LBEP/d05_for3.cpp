#include <stdio.h>
#include <stdlib.h>

/* demo toan tu dau phay (commas operator) trong vong lap FOR*/
int main(){
    system("cls");

    int max = 8;
    for (int i = 1, j=max;   i <= max;    i++, j--)
    {
        printf("%3d + %3d = %3d \n", i, j, i+j);
    }
    
}