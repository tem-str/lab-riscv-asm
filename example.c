#include <stdio.h>

#define N 4
#define M 2

int process(int n, int m, int matrix [M][N])
{
	int result = 0;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            result += positive(matrix[i][j]);
        }
    }
	return result;
}
int positive(int a){
	if (a > 0) return a;
	return 0;
}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int result = 0;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    result = process(N, M, matrix);

    printf("%d ", result);


    return 0;
}