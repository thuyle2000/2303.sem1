#include <stdio.h>
int main(){
    printf(" *** DEMO Ep kieu du lieu (Type Casting) *** \n");
    float x, y = 3.7879;
    printf(" x = %f, y = %f \n", x, y);
    x =(int)y;
    printf(" >> after x =(int)y; =>  x= %f \n\n", x);

    int a=10, b=3;
    printf(" a = %d, b = %d \n", a, b);
    printf(" %d / %d = %d\n", a,b, a/b);
    printf(" (float)%d / %d = %f \n", a,b, (float)a/b);
}