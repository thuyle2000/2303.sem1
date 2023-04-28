#include <stdio.h>
int main()
{
    printf("\n\t *** DEMO ham printf() - version 2*** \n\n");
    int a1 = 1234, a2 = 8;
    printf("a1 = [%d]\n", a1);
    printf("a2 = [%d]\n", a2);

    printf("a1 = [%8d], format code: %%8d \n", a1);
    printf("a2 = [%8d], format code: %%8d \n\n", a2);

    printf("a1 = [%-8d], format code: %%-8d \n", a1);
    printf("a2 = [%-8d], format code: %%-8d \n\n", a2);

    printf("a1 = [%08d], format code: %%08d \n", a1);
    printf("a2 = [%08d], format code: %%08d \n\n", a2);
}