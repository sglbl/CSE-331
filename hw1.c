#include <stdio.h>

int pairFinder(int array[], int size, int k){
	int counter = 0;

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

/* OUTPUT -> 5 VALID PAIRS
(0, 2) -> ar[0] + ar[2] = 1 + 2 = 3                                                                                                                                                 
(0, 5) -> ar[0] + ar[5] = 1 + 2 = 3                                                                                                                                                 
(1, 3) -> ar[1] + ar[3] = 3 + 6 = 9                                                                                                                                                 
(2, 4) -> ar[2] + ar[4] = 2 + 1 = 3                                                                                                                                                 
(4, 5) -> ar[4] + ar[5] = 1 + 2 = 3
*/