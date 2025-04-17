#include <stdio.h>
int main()
{
        int i = 0;
        int j = 0;
        for(i=0;i<15;i++){
        	for(j=15-i;j>0;j--){
			if(j>i)break;
        	}
        }
        asm volatile("unimp");
        asm volatile("unimp");
        return 0;
}
