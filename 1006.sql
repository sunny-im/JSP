1. CASE 표현식 복잡한 조건 논리 처리

조건식을 여러개 적용할 때는 DECODE 보다 CASE를 사용하는 것이 편하다.
DECODE는 정확히 맞거나 틀린 경우 조건을 처리하기 쉬운 반면
CASE는 조건의 범위가 다양한 경우 쉽게 처리한다.

SELECT empno,ename,sal,
    CASE
        WHEN sal >= 1500 then '상위급여'
        WHEN sal BETWEEN 1200 and 1499 then '중위급여'
        ELSE '하위급여'
    END AS 급여등급
FROM emp
WHERE job='SALESMAN';

2. 순위매기기
2-1. RANK 
공통순위를 출력하되 공통 순위만큼 건너뛰어 다음 순위를 출력  1,2,2,4

2-2. DENSE_RANK
공통순위를 출력하되 건너뛰지 않고 바로 다음 순위 1,2,2,3

2-3. ROW_NUMBER 
공통 순위를 없이 출력한다. 1,2,3,4

SELECT ename,
        sal,
        RANK() OVER(ORDER BY sal DESC) RANK_급여,
        DENSE_RANK() OVER(ORDER BY sal DESC) DENCE_급여,
        ROW_NUMBER() OVER(ORDER BY sal DESC) ROW_급여
FROM emp;

3. 그룹함수
집계함수, 기준열의 값에 대한 데이터끼리 그룹으로 묶고 
묶은 행에대해 연산을 수행한다.

3-1. COUNT
SELECT COUNT(sal)
FROM emp;

count 함수는 컬럼명을 넣지 않을 경우에는 null값도 행으로 계산한다.
컬렴명을 넣으면 null값을 제외 
(대부분의 함수들은 null을 제외하고 연산)

3-2. SUM
SELECT SUM(sal)
FROM emp;

3-3. AVG
SELECT AVG(sal)
FROM emp;

avg 함수는 null값을 제외하고 연산, 
null 값을 포함하여 평균을 계산하려면 
NVL함수를 사용하여 AVG(sal,0) 해야 계산이 된다.

3-4. MAX / MIN
SELECT MAX(sal), MIN(sal), MAX(ename), MIN(ename)
FROM emp;

문자도 최소/최대가 있다.

3-5. GROUP BY
SELECT job, SUM(sal) 직무별총급여,AVG(sal) 직무별평균급여
FROM emp
GROUP BY job
ORDER BY 직무별총급여 DESC;

3-6. HAVING
연산된 그룹 함수 결과에 조건 적용

SELECT job, SUM(sal) 직무별총급여,AVG(sal) 직무별평균급여
FROM emp
GROUP BY job
HAVING sum(sal) > 5000;

3-7. UNION
SQL을 이용해서 SELECT문의 실행 결과를 하나로 합친다.
즉, 각기 다른 두개 이상의 SELECT문을 실행한 결과를
하나로 묶어서 출력할 수 있다.
집합을 하나로 묶을 때 사용, 중복 행은 한 번 만 출력한다.

SELECT deptno 
FROM emp
UNION
SELECT deptno 
FROM dept;

----------------------------------------------------------10/6 블로그 포스팅
4. DML
Data Manipulation Language
SELECT문의 경우는 단지 조회하여 출력만 한다.
INSERT(새로운 행 삽입)
UPDATE(갱신)
DELETE(삭제)

4-1. INSERT
1) 기본 !!
INSERT INTO departments (department_id,department_name,manager_id,location_id)
VALUES (271,'sample_Dept',200,1700);

열 순서에 따라 차례로 데이터 값을 기술해서 새로운 행을 삽입
values절에는 삽입될 값을 기술한다.

2) 실제 사용할땐 !!
INSERT INTO departments
VALUES (272,'sample_Dept',200,1700);

4-2. UPDATE
1)
UPDATE departments
SET manager_id = 201,
    location_id = 1800
WHERE department_name = 'sample_Dept';

2) 다중열 서브쿼리
UPDATE departments
SET (manager_id, location_id) = (SELECT manager_id,location_id FROM departments WHERE department_id = 40)
WHERE department_name = 'sample_Dept';

departments 테이블에서 department_id가 40인 
manager_id,location_id의 데이터 값을 찾아서 
department_name = 'sample_Dept'인 행의 
manager_id,location_id를 찾아낸 데이터값과
동일하게 변경

4-3. DELETE
DELETE FROM departments
WHERE department_name = 'sample_Dept';
