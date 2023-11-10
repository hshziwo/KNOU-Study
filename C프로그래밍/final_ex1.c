#include <stdio.h>
#define SIZE 10 //배열사이즈 10을 위해 선언
void sum(const int a[], int n, int *evenSum, int *oddSum) {  // 배열 매개변수 수정을 불가하게 하기 위해 const사용, 짝수번합, 홀수번합을 위해 배열사이즈, 저장매개변수 선언
    int i;
    for (i = 0; i < n; i++) // 배열사이즈만큼 for문 수행
    {
        if ( (i+1) % 2 == 0) // 1부터 시작, 짝수번째 요소이면 짝수번합에 더함
        {
            *evenSum += a[i];
        }
        else // 홀수번째 요소이면 홀수번합에 더함
        {
            *oddSum += a[i];
        }
    }
}

void main() {
    int a[SIZE] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int evenSum = 0;
    int oddSum = 0;
    sum(a, SIZE, &evenSum, &oddSum);
    printf("짝수번합 : %d\n", evenSum);
    printf("홀수번합 : %d\n", oddSum);
}