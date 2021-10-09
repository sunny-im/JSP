1. DML  데이터 삽입/갱신/삭제
Data Manipulation Language 데이터 조작 명령어
SELECT도 DML에 속하지만, 단지 조회하여 출력만 한다.
INSERT, UPDATE, DELETE 는 직접 데이터를 삽입,갱신,삭제
트랜잭션 transaction 데이터를 조작하여 저장하는 과정
DML은 트랜잭션을 다루는 명렁어
테이블의 행을 기준으로 삽입 갱신 삭제 한다.
최종 DB에 반영할 때에는 꼭 commit 처리를 해줘야 한다.

1-1. INSERT 행 삽입하기
새로운 데이터를 행 단위로 입력한다.

INSERT INTO departments(department_id, department_name,manager_id,location_id)
VALUES (271,'Sample_Dept',200,1700);

축약버전)
INSERT INTO departments
VALUES (271,'Sample_Dept',200,1700);

1-2. UPDATE 기존의 값을 변경할 때 사용

UPDATE departments
SET manager_id=201,
    location_id=1800
WHERE department_name='IT';

1-3. DELETE 행 삭제
WHERE 생략하면 조건식이 없으므로 모두 삭제되니 주의

DELETE FROM departments
WHERE department_id = 271;

2. DDL 
Data Definition Language 데이터 정의어
따로 커밋하지 않아도 데이터베이스에 즉각 반영된다.

2-1. CREATE 테이블 생성

CREATE TABLE product (
    productid number,
    productname varchar2(30),
    manudate date
);

2-1-1. 테이블 생성 후 데이터 넣기
insert into product values (1,'tv',to_date('211007','YYMMDD'));
insert into product values (1,'washer',to_date('201127','YYMMDD'));
insert into product values (1,'cleaner',to_date('180307','YYMMDD'));

2-1-2. 테이블과 열의 이름을 정할 때는
- 동일한 테이블의 이름을 중복하여 생성할 수 없다.
  테이블 안의 열 이름도 동일한 이름으로 생성 할 수 없다.
- SELECT INTO FROM 과 같은 예약어는 사용할 수 없다.
- 문자로 시작한다.
  한글과 특수문자도 사용할 수 있지만 권장하진 않는다.
- 너무 긴 이름으로 사용은 권장하지 않는다.

2-2. ALTER 테이블 수정
이미 생성한 테이블에 열(컬럼)을 추가,변경,삭제 할 수 있다.
ALTER TABLE 을 사용하여 구조를 변경할 수 있다.

2-2-1. 컬럼 추가
ALTER TABLE product
ADD (factory varchar(10));

새로 생성되는 열은 위치를 지정할 수 없다.
테이블의 마지막에 위치한다.
이미 행이 있다면 열을 추가했을 때 새로운 열의 데이터 값은 null로 초기화 된다.

2-2-2. 컬럼의 데이터형 변경
ALTER TABLE product
MODIFY (factory char(10));

ALTER TABLE product
MODIFY (productname varchar(5));
--> 기존 보다 더 작은 형으로는 변경할 수 없다. 데이터가 손실될 수 있다.

2-2-3. 컬럼 이름 변경
ALTER TABLE product
RENAME COLUMN factory to factoryname;

2-2-4. 컬럼 삭제
ALTER TABLE product DROP COLUMN factoryname;

2-2-5. 테이블 내용만 삭제
TRUNCATE TABLE product;

2-3. 테이블 내용과 구조까지 전부 삭제
DROP TABLE product;

3. 되돌리기
트랜잭션 내의 DML 명령문은 실행되어 결과가 반영되더라고 commit 전까지는
임시적인 상태이다.
이 상태에서는 ROLLBACK 을 할 경우 트랜잭션이 취소되고 
커밋 직후로 돌아간다.

그러나 DDL은 즉각 반영되므로 ROLLBACK 이 불가능하다.

즉, DML인 DELETE 는 데이터만 삭제되므로 ROLLBACK 이 가능하다.

delete < truncate < drop 순으로 강력..
