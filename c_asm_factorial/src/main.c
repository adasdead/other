#include <stdio.h>

#define FMT "%d! = %d\n"

extern int factorial(int n);

int main(void)
{
    int n = 5;
    int r = factorial(n);

    printf(FMT, n, r);
    return 0;
}