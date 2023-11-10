#include <stdio.h>
#include <string.h> //sprintf 함수
#include <stdlib.h>    // atoi 함수가 선언된 헤더 파일
struct info { // 정보를 저장하기 위한 info구조체 정의
    char name[15]; // 이름 멤버변수
    char major[20]; // 학과 멤버변수
    char rrn[14]; // 주민등록번호
    char dateofBirth[20]; // 생년월일
    char leapYear[15]; //윤년유무
    char country[20]; // 국가
    char gender[10]; // 성별
};
struct info calc( struct info *paramInfo) { // info구조체 포인터를 매개변수로 넘겨받음
    //정보를 입력받음
    printf("%s","---------------------------------------------------------------------\n");
    printf("이름 : ");
    scanf("%s", paramInfo -> name); // 구조체 포인터 paramInfo의 멤버를 사용하기 위해 (->)연산자 사용
    printf("학과 : ");
    scanf("%s",  paramInfo -> major);
    printf("주민등록번호 : ");
    scanf("%s", paramInfo -> rrn);

    switch( (paramInfo -> rrn)[6]) { //조건 탐색 후 구조체에 넣음
        case 49 : // 1의 아스키코드
            sprintf( paramInfo -> dateofBirth, "19%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "대한민국");
            strcpy( paramInfo ->gender, "남자");
            break;
        case 50 : // 2의 아스키코드
            sprintf( paramInfo -> dateofBirth, "19%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "대한민국");
            strcpy( paramInfo ->gender, "여자");
            break;
        case 51 : // 3의 아스키코드
            sprintf( paramInfo -> dateofBirth, "20%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "대한민국");
            strcpy( paramInfo ->gender, "남자");
            break;
        case 52 : // 4의 아스키코드
            sprintf( paramInfo -> dateofBirth, "20%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "대한민국");
            strcpy( paramInfo ->gender, "여자");
            break;
        case 53 : // 5의 아스키코드
            sprintf( paramInfo -> dateofBirth, "19%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "외국");
            strcpy( paramInfo ->gender, "남자");
            break;
        case 54 : // 6의 아스키코드
            sprintf( paramInfo -> dateofBirth, "19%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "외국");
            strcpy( paramInfo ->gender, "여자");
            break;
        case 55 : // 7의 아스키코드
            sprintf( paramInfo -> dateofBirth, "20%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "외국");
            strcpy( paramInfo ->gender, "남자");
            break;
        case 56 : // 8의 아스키코드
            sprintf( paramInfo -> dateofBirth, "20%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "외국");
            strcpy( paramInfo ->gender, "여자");
            break;
        case 57 : // 9의 아스키코드
            sprintf( paramInfo -> dateofBirth, "18%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "대한민국");
            strcpy( paramInfo ->gender, "남자");
            break;
        case 48 : // 4의 아스키코드
            sprintf( paramInfo -> dateofBirth, "18%c%c년 %c%c월 %c%c일", (paramInfo -> rrn)[0], (paramInfo -> rrn)[1], (paramInfo -> rrn)[2], (paramInfo -> rrn)[3], (paramInfo -> rrn)[4], (paramInfo -> rrn)[5]);
            strcpy( paramInfo ->country, "대한민국");
            strcpy( paramInfo ->gender, "여자");
            break;
        default :
            printf( "%s", "일치하는 조건이 없습니다.");
            break;
    }
    
    // 윤년 값 넣기
    if (  condition( paramInfo -> dateofBirth) == 1)
    {
        strcpy( paramInfo -> leapYear, "윤년");
    }
    else
    {
        strcpy( paramInfo -> leapYear, "윤년아님");
    }

    // 1번 문제 출력
    printf("%s, %s, %s, %s, %s, %s\n", paramInfo ->name, paramInfo ->dateofBirth, paramInfo ->leapYear, paramInfo ->country, paramInfo->gender, paramInfo->major);
}

// 윤년 찾는 함수
int condition( char param[20]) {
    char yearStr[5];
    int year;
    sprintf( yearStr, "%c%c%c%c", param[0], param[1], param[2], param[3]);
    year = atoi(yearStr);
    if((year%4==0 && year%100 !=0) || year%400==0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

// 메인함수
void main() {
    printf("%s", "3명의 학생 정보를 입력하시오.\n");
    struct info person[3]; // 구조체 배열 선언
    // 1번 문제 함수 실행
    int i;
    for ( i = 0; i < 3; i++)
    {
        calc( &person[i]);
    }
    
    // 2번 문제 오름차순 정렬
    struct info temp;    //임의로 MAX값 넣을 공간
    int j,k;      //FOR문 증가값
    char now[9]; //현재값
    char next[9]; //비교값
    for(j=0;j<3;j++)
    {
        for(k=0;k<2;k++)
        {
            sprintf( now, "%c%c%c%c%c%c%c%c", person[k].dateofBirth[0],person[k].dateofBirth[1],person[k].dateofBirth[2],person[k].dateofBirth[3],person[k].dateofBirth[8],person[k].dateofBirth[9],person[k].dateofBirth[14],person[k].dateofBirth[15]);
            sprintf( next, "%c%c%c%c%c%c%c%c", person[k+1].dateofBirth[0],person[k+1].dateofBirth[1],person[k+1].dateofBirth[2],person[k+1].dateofBirth[3],person[k+1].dateofBirth[8],person[k+1].dateofBirth[9],person[k+1].dateofBirth[14],person[k+1].dateofBirth[15]);
            
            if( atoi(now) > atoi(next)) //연달아있는 두수중 앞에 있는수가 크다면
            {
                //위치 변경
                temp = person[k]; 
                person[k]=person[k+1];
                person[k+1] = temp;
            }//if
        }//for(k)
     }//for(j)

    printf("%s", "======================================================\n");
    printf("%s", "입력 받은 3명의 정보를 생년월일 기준으로 오름차순으로 출력\n");
    printf("%s","---------------------------------------------------------------------\n");

    // 정렬된 새로운 값 출력
    int x;
    for (x = 0; x < 3; x++)
    {
        printf("%s, %s, %s, %s, %s, %s\n", person[x].name, person[x].dateofBirth, person[x].leapYear,person[x].country, person[x].gender, person[x].major);
    }
    printf("%s","\n\n---------------------------------------------------------------------\n");
}