#include<stdio.h>
void main () {
	int i, j, edges=1, min, a=0, b=0, totalCost=0, visited[7];
	
//	printf("Enter the N : ");
//	scanf("%d", &n);
	
	int arr[7][7] = {{0,28,0,0,0,10,0},
					 {28,0,16,0,0,0,14},
					 {0,16,0,12,0,0,0},
					 {0,0,0,22,0,25,24},
					 {10,0,0,0,25,0,0},
					 {0,14,0,18,24,0,0}};
	
	for (j=0; j<7; j++){
		visited[j] =0;
	}
	visited[0] = 1;
	
	
//	for (i=0; i<n; i++){
//		for (j=0; j<n; j++){
//			printf("Enter the value at [%d][%d] : ", i, j);
//			scanf("%d", &arr[i][j]);
//		}
//	}
//	for (i=0; i<n; i++){
//		for (j=0; j<n; j++){
//			printf("%d ", arr[i][j]);
//		}
//		printf("\n");
//	}
	for (i=0; i<7; i++){
		for (j=0; j<7; j++){
			if (arr[i][j] == 0){
				arr[i][j] = 999;
			}
		}
	}
	while(edges < 7){
		for (i=0; i<7; i++){
			min=999;
			for (j=0; j<7; j++){
				if(arr[i][j] < min){
					min=arr[i][j];
					a=i;
					b=j;
				}
				
			}
		
		if (visited[b] != 1){
			totalCost += min;
			printf("%d - %d --> %d\n", a,b,min);
			visited[b] = 1;
			edges++;
		}
	}
	arr[a][b]=arr[b][a] =999;
	}
	
	
}
