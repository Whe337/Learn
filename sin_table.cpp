#include <iostream>
#include <cmath>
#include <stdlib.h>
using namespace std;

int main()
{
    double s0,c0,s,c;
    int n;
    cout << "三角函数表 Date:2021.12.26 Author:XMH"<<endl;
    cout << "请输入sin1' = ";
    cin >>s0;
    c0 = sqrt(1-s0*s0);
    cout <<"s0:"<<s0<<"  "<<"c0="<<c0<<endl;
    s = s0;
    c= c0;
    n = 2;
    do
    {
        s = s*c0 + c*s0;
        c = sqrt(1-s*s);
        cout <<"sin"<<n<<"' ="<<s<<endl;
        n =n + 1;
    } while (n <= 5400);
    system("pause");
    return 0;
}
