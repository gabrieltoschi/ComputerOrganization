#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int main(){
	int j, i;
	int traceSize;
	srand(time(NULL));

	scanf("%d", &traceSize);
	j = 0;
	for(i=0; i<traceSize; i++){
		printf("2 %x\n", j);
		j++;
		if((rand()%100) <= 1) j = rand()%j+1;
	}

	return 0;
}
