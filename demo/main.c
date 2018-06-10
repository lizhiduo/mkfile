/*************************************************************************
	> File Name: main.c
	> Author: 
	> Mail: 
	> Created Time: 2018年06月10日 星期日 15时34分46秒
 ************************************************************************/

#include <stdio.h>
#include "multiplication.h"
#include "osal_file.h"

int main()
{
    int a = 40;
    int b = 20;
    int sum  = 0;
    
    sum = add(a, b);
    printf("sum: %d\n", sum);
    printf("sub result: %d\n", sub(a, b));

    osal_openFile();
    osal_closeFile();

    return 0;
}
