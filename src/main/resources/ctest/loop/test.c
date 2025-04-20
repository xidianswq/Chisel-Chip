#include <stdio.h>
int main()
{
        unsigned int i = 0;
        unsigned int j = 100;
        unsigned int k = 0;
	for(i<0;i<50;i++){
		for(j=100-i;j>50;j--){
			if(j>i)k++;
			else k--;
		}
	}
        asm volatile("unimp");
        asm volatile("unimp");
        return 0;
}
