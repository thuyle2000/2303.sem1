#include <stdio.h>
/**  Chuong trinh kiem tra nam nhuan 
 * Nam nhuan la nam co 366 ngay, cach tinh : 
 * - chia het cho 4, nhung ko chia het cho 100: 2024, 2028, 2020
 * - hoac chia het cho 400:  2000, 2400 ...
 * 
*/
int main(){
    printf("\n Chuong trinh kiem tra nam nhuan \n");
    int year;
    printf(" - nhap nam muon kiem tra: ");
    scanf("%d", &year);

    if(year%100==0){
        //day la nam the ky
        if(year%400==0){
            printf("\t %d la nam nhuan the ky ! \n", year);
        }
        else{
            printf("\t %d la nam the ky ! \n", year);
        }
    }else{
        if(year%4==0){
            printf("\t %d la nam nhuan ! \n", year);
        }
        else{
            printf("\t %d la nam binh thuong ! \n", year);
        }
    }

}