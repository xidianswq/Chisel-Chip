#include <stdio.h>
int main()
{
        int i = 0;
        int j = 0;
        for(i=0;i<100;i++){
        	for(j=100-i;j>0;j--){
			if(j>i)break;
        	}
        }
        asm volatile("unimp");
        return 0;
}
