#include <stdio.h>
int main()
{
        unsigned int i = 0;
        unsigned int j = 5;
        while(i<10){
		if(j>=i)i+1;
        }
        asm volatile("unimp");
        asm volatile("unimp");
}
