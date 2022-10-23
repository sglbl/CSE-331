#include <stdio.h>

int pairFinder(int array[], int size, int k){
	int counter;

	for(int i = 0; i < size; i++){
		for(int j = i+1; j < size; j++){
			if(i < j && (array[i] + array[j] ) % k == 0){
				counter++;
				printf("(%d, %d) -> ar[%d] + ar[%d] = %d + %d = %d\n", i,j, i,j, array[i], array[j], array[i] + array[j]);
			}
		}
	}

	return counter;
}

int main(){
	int k = 3;
	// int size = 6; // need also allocate memory with memset because in compile time; size is not known.
	int array[6] = {1,3,2,6,1,2};

	pairFinder(array, 6, k);

	return 0;
}