#include <stdio.h>
#include <stdlib.h>

/**Demo cau truc lap trinh switch-case */
int main()
{
    system("cls"); // lenh xoa man hinh, thay the cho lenh clrsrc() trong sach GK

    char ch;
    printf(" vui long nhap 1 ky tu (ket thuc <enter>): ");
    ch = getchar();

    // kiem tra gia tri cua ch
    if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
    {
        // ch la ky tu chu tu a-z
        printf(" >> %c la ky tu chu \n", ch);

        // phan loai nguyen am, phu am
        if (ch == 'a' || ch == 'A' || ch == 'e' || ch == 'E' || ch == 'o' || ch == 'O' || ch == 'i' || ch == 'I' || ch == 'u' || ch == 'U')
        {
            printf(" >> %c la nguyen am \n ", ch);
        }
        else
        {
            printf(" >> %c la phu am \n ", ch);
        }

        // phan loai nguyen am, phu am : viet theo switch-case
        switch (ch)
        {
        case 'a':
        case 'A':
        case 'e':
        case 'E':
        case 'i':
        case 'I':
        case 'o':
        case 'O':
        case 'u':
        case 'U':
            printf(" *** [%c] la nguyen am *** \n", ch);
            break;       
        default:
            printf(" *** [%c] la phu am *** \n", ch);
            break;
        }
    }
    else if (ch >= '0' && ch <= '9')
    {
        // ch la ky tu so tu 0-9
        printf(" >> %c la ky so \n", ch);
    }
    else
    {
        // ch la ky tu dac biet
        printf(" >> %c la ky tu dac biet \n", ch);
    }
}