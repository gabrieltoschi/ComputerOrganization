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
		printf("2 %d\n", j);
		j++;
		if((rand()%100) <= 3) j = rand()%j+1;
	}

	return 0;
}
