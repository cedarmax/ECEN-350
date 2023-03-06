/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int my_mul(long long int a, long long int b);
extern long long int lab04b(long long int m);

int main(void)
{
//    long long int a = my_mul(3, 5);
//    printf("Result of my_mul(3, 5) = %lld\n", a);
	long long int n = lab04b(6);
	printf("Result of lab04b(6) = %lld\n", n);
    return 0;
}
