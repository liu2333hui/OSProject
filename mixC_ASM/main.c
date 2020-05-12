#include <stdio.h>

int _myfunc() __attribute__((cdecl));//(去掉_myfunc前的下划线也可以，不知为什么)

int main(void)
{
        myfunc();
        return 0;
}
