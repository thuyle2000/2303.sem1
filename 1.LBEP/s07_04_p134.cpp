#include <stdio.h>
#include <stdlib.h>

int main()
{
    int basic_salary;
    int allowance;
    char grade;

    system("cls");
    printf(" - nhap luong co ban: ");
    scanf("%d", &basic_salary);

    fseek(stdin, 0, SEEK_END);  //xoa bo dem ban phim

    printf(" - nhap bac luong [a|b|c]: ");
    scanf("%c", &grade);

    switch (grade)
    {
    case 'a':
    case 'A':
        allowance = 300;
        break;
    case 'b':
    case 'B':
        allowance = 250;
        break;
    default:
        allowance = 100;
        break;
    }

    printf(" >> luong co ban : %d \n", basic_salary);
    printf(" >> phu cap : %d \n", allowance);
    printf(" >> luong cuoi thang : %d \n", basic_salary + allowance);
}