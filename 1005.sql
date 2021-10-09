1.
LTRIM / RTRIM 좌측 여백제거, 우측 여백제거
(주로, 공백을 삭제할 때 사용)
LTRIM 은 왼쪽부터 지정한 문자를 삭제
RTRIM 은 오른쪽부터 지정한 문자를 삭제

SELECT job_title,
        LTRIM(job_title,'F'),
        RTRIM(job_title,'T')
FROM employees;

2. 
TRIM 한 번에 좌 우 여백 다 없앤다.
SELECT TRIM('   - space -       ')
FROM dual;      # dual은 dummy 테이블

3. 숫자 관련 함수
Round : 지정한 자리에서 반올림하는 함수

ex) 숫자   1  2  3 . 4 5 6 7
    인덱스 -3 -2 -1   0 1 2 3 

SELECT max_salary 월급,
        round(max_salary/30,1) 일급
FROM jobs;

TRUNC : 지정한 자리에서 버림하는 함수

SELECT max_salary 월급,
        trunc(max_salary/30,1) 일급
FROM jobs;

4. 날짜 관련 함수
날짜에 더하거나 빼면 날짜가 계산된다.

4-1.
SELECT TO_CHAR(SYSDATE,'yy/mm/dd')
FROM dual;

4-2.
SELECT TO_CHAR(SYSDATE,'yy/mm/dd'),
        SYSDATE + 1 tomorrow,
        SYSDATE - 1 yesterday
FROM dual;

4-3.
SELECT hire_date,
        ADD_MONTHS(hire_date,3) 삼개월전,                 
        ADD_MONTHS(hire_date,-3) 삼개월후
FROM employees
WHERE employee_id between 100 and 110;

4-4. 요일계산

4-4-1.일요일이 1, 월요일은 2 ....
SELECT hire_date,
        NEXT_DAY(hire_date,1) 가까운일욜일,
        NEXT_DAY(hire_date,6) 가까운금요일
FROM employees;

4-4-2. last_day  그 달의 마지막 날짜
SELECT hire_date,
        LAST_DAY(hire_date) 결과
FROM employees;

4-4-3. 날짜 반올림
SELECT hire_date,
        round(hire_date,'month') 결과,
        round(hire_date,'year') 결과2
FROM employees;


5. 변환함수
각 열에 대해 데이터 타입이 규정된다.
실행하기 위해 데이터 값의 데이터 타입을 변환할 때도 있다.
이때 사용하는 함수가 변환함수이다.

데이터 타입의 변환은 자동으로(암묵적으로) 또는 사용자에의해
수동으로(명시적으로) 변환된다.

SELECT 1 + '2'
FROM dual;

'2'는 작은따옴표로 묶여 있기 때문에 숫자가 아닌 문자이다.
하지만 결과는 3이라고 바르게 연산이 된다.
자동으로 숫자2로 변환하여 계산했기 때문이다.

다만, 자동 데이터 타입 변환을 이용할 수 있더라도 sql문의
성능과 안정성을 위해 수동 데이터 타입 변환을 권장한다.

5-1. 형변환 하는 함수
: TO_CHAR, TO_NUMBER, TO_DATE

SELECT TO_CHAR(SYSDATE,'YY'),
        TO_CHAR(SYSDATE,'YYYY'),
        TO_CHAR(SYSDATE,'MM'),
        TO_CHAR(SYSDATE,'YYMMDD')
FROM dual;


SELECT TO_CHAR(SYSDATE,'HH:MI:SS PM'),
        TO_CHAR(SYSDATE,'YYYY/MM/DD HH:MI:SS PM')
FROM dual;

SELECT TO_NUMBER('123')
FROM dual;

SELECT TO_DATE('20211005','YYMMDD')
FROM dual;

5-2. NULL 처리
특정 열의 행에 대한 데이터 값이 없으면 null이 된다.
null은 그 자체로 의미가 있다. '값이 없다.'

null을 가지지 못하게 지정할 수 있다. 이것을 not null이라고 한다.

null값을 계산하면 산술 연산의 결과도 null이 나온다.

SELECT *
FROM emp
ORDER BY comm;


SELECT sal*comm
FROM emp
ORDER BY comm;

SELECT sal*NVL(comm,1)   # comm에 있는 null값을 특정값 1로 변환하여 sal과 곱하기
FROM emp
ORDER BY comm;

# NVL 함수는 null 값을 어떤 특정한 값으로 변환하는데 사용한다.

5-3. DECODE   if와 같은 의미
DECODE (열, 조건, 치환(true), 기본값(false))

SELECT ename,
        deptno,
        sal 원래급여,
        DECODE(deptno, 20, sal*1.1, sal),
        DECODE(deptno, 20, '10%인상','미인상')
FROM emp;

----------------- 10/5 (2)