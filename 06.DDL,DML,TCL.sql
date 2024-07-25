-- DDL : 데이터 정의어
-- CREATE, ALTER, DROP

-- CREATE : 테이블 등 새로운 객체 생성 명령
-- ALTER : 완성된 테이블 수정, 제약조건 추가
-- DROP : 테이블 삭제

-- 직원테이블 생성하기(한글 버전)
/*
// 테이블 생성 형식
-> CREATE TABLE 테이블 명(
               컬럼명 자료형(크기)[기본값][NULL 여부] 
             ( [ ](대괄호: 선택사항),기본값은 둘다 NULL )
               컬럼명 자료형(크기)[기본값][NULL 여부] 
             ( [ ](대괄호: 선택사항),기본값은 둘다 NULL )
 );
 */
 
-- * 테이블 생성 규칙
-- 1. 테이블 이름은 대소문자를 구분하지 않는다.
-- 2. 테이블 명은 중복될 수 없다.
-- 3. 같은 테이블 내에서 컬럼명은 중복될 수 없다.
-- 4. 테이블명은 문자로 시작해야 하며, 예약어는 사용이 불가능하다.
-- EX) 0직원 -> 사용 불가! / SELECT ~ -> 사용 불가!

-- 제약조건 : PK(PRIMARY KEY):식별자,고유번호 /  NOT NULL, 
-- * PK(PRIMARY KEY) -> UNIQUE KEY, NOT NULL의 의미를 포함함
-- NOT NULL : NULL이 들어갈 수 없다.
-- UNIQUE (KEY) : NULL값은 포함 가능하지만, 해당 컬럼 :고유값으로 만들 때 (중복 불가)
-- CHECK : 데이터의 범위 지정 -> 지정된 값만 들어갈 수 O ex)0보다 크다/ 작다 등등
-- FOREIGN KEY(FK) : 참조 데이터, 참조 키값 
-- -> 다른 테이블의 특정 데이터 가져와서 사용할 때 표시하는 것.
CREATE TABLE 직원( 
직원ID NUMBER(3,0) PRIMARY KEY,
이름 VARCHAR2(10),
이메일 VARCHAR2(20),
휴대폰번호 VARCHAR2(10),
고용일 DATE,
급여 NUMBER(5,0) CHECK(급여>0), 
부서번호 NUMBER(3,0) 
);
-- 제약 조건 필요함 (고유한 성질, NULL 허용여부) 

-- 휴대폰 번호 01054155257 형식에서 0으로 시작하는 숫자로 형식 설정하면 
-- 컴퓨터는 이진법으로 인식함

-- INSERT : 데이터 삽입 명령
INSERT INTO 직원 VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL) ; 

-- DROP : 객체(테이블) 삭제
DROP TABLE 부서 ;

SELECT *
  FROM DEPARTMENTS;

CREATE TABLE 부서(
     부서ID NUMBER(3,0) PRIMARY KEY,
     부서이름 VARCHAR2(30) NOT NULL,
     매니저ID NUMBER(3,0),
     위치ID NUMBER(4,0)
);

-- 데이터의 '무결성' : 데이터가 결함이 없는 상태 
--                즉, 데이터의 내용이 정확하고 유효하게 유지가 된 상태
-- 참조 무결성 제약조건 : 외래키(FK)는 구별O(고유성O),
--                     참고할 수 있는 내용(해당 데이터 존재O)을 가져야 한다.
                   --> 1) 참조할 테이블에 데이터가 존재하는지 안하는지?
                   --> 2) 참조할 컬럼에 중복된 데이터가 있는지 없는지? 
-- 개체 무결성 제약조건 : 식별자(PK)는 NULL 값을 가질 수 없다)
-- * FOREIGN KEY 를 사용하려면, 참조하려는 컬럼이 'UNIQUE'하거나 'PK'여야한다.

-- ALTER TABLE : 테이블 수정
--> 테이블이 만들어진 뒤에: 제약조건 추가, 컬럼 추가, 컬럼 데이터타입 변경 등등
-- 직원 테이블에서 직원 ID컬럼을 참조해서 부서테이블의 매니저 ID로 지정시켜주는 경우 
-- ALTER TABLE 직원 ADD CONSTRAINT ( 수정 내용 ->임시 별칭 ) ( 제약조건(컬럼명) ) ;

ALTER TABLE 부서 ADD CONSTRAINT FK_매니저ID
 FOREIGN KEY(매니저ID) REFERENCES 직원(직원ID); 
-- 매니저ID를 직원 테이블의 직원ID를 참조하는 행위 --> "FK_매니저ID"로 지칭한 것. 

ALTER TABLE 부서 DROP CONSTRAINT FK_매니저ID ;

INSERT INTO 직원 VALUES(100,'승환','TEST@TEST','010','20/06/06', 10000,60) ;
INSERT INTO 직원 VALUES(200,'보미','TEST@TEST','010','20/06/06', 10000,60) ;

SELECT *
  FROM 직원 ;
  
INSERT INTO 부서 VALUES(60,'IT',200,10) ;
INSERT INTO 부서 VALUES(70,'SALES',200,10) ;

SELECT * 
  FROM 부서 ;
  
  
 CREATE TABLE 네이버_회원(
 회원ID VARCHAR2(15),
 이름 VARCHAR2(12)NOT NULL,
 비밀번호 VARCHAR2(16),
 생년월일 DATE,
 성별 VARCHAR2(3)
 );
 
 DROP TABLE 네이버_회원;
 
 CREATE TABLE 네이버블로그(
 블로그번호 NUMBER(3,0),
 블로그제목 VARCHAR2(100) NOT NULL,
 블로그내용 VARCHAR2(4000),
 회원ID VARCHAR2(15)
 );
 
DROP TABLE 네이버블로그;

 ALTER TABLE 네이버_회원 ADD CONSTRAINT 회원_ID_PK
 PRIMARY KEY(회원ID);
 
 ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_번호_PK
 PRIMARY KEY(회원ID);
 
 SELECT * FROM 네이버_회원;
 
 ALTER TABLE 네이버_회원 ADD CONSTRAINT 회원_성별_CK
 CHECK(성별 IN ('남','여'));
 
 ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_회원ID_FK
 FOREIGN KEY (회원ID) REFERENCES 네이버_회원(회원ID); 
 
 ALTER TABLE 네이버블로그 ADD CONSTRAINT 블로그_회원ID_FK
 FOREIGN KEY (회원ID) REFERENCES 네이버_회원(회원ID);
 
ALTER TABLE 네이버_회원 ADD CONSTRAINT 회원_성별_CK
CHECK (성별 = '남' OR 성별 = '여') ; 
-- DROP : 제약조건 삭제, 테이블 삭제

--//
-- DML(데이터 조작어) : 테이블에 원하는 데이터를 입력/수정/삭제하는 등등 
--                    데이터에 변형을 가하는 명령어
-- DML의 경우 실행 명령어는 '한 행'으로 구성된다.
-- EX) INSERT, UPDATE, DELETE 

-- 승환쌤이 네이버 회원가입을 합니다.
-- --> 승환쌤 정보를 네이버 회원 테이블에 넣겠습니다

-- 1. INSERT : 데이터 삽입 명령어
--  형식 : INSERT INTO 테이블명 VALUES(삽입할 데이터);
--  주의할 점: 삽입할 데이터 순서는 테이블의 컬럼 순서와 같아야 한다.
INSERT INTO 네이버_회원 VALUES('LIM','승환','123','05/06/06','남');
INSERT INTO 네이버_회원 VALUES('BO','미','123','05/06/06','여');
INSERT INTO 네이버_회원 VALUES('LIM2','승환','123','05/06/06','남');

-- 보미쌤이 블로그를 작성합니다.
-- 작성한 블로그 내용을 테이블에 삽입시켜주어야 다음에 조회할 수 있다.
INSERT INTO 네이버블로그(블로그번호,블로그제목,회원ID) VALUES ('1','보미쌤일기','BO');
-- 원하는 컬럼에만 데이터를 넣고 싶을 때:
-- 형식 : INSERT INTO 테이블명(원하는 컬럼1,컬럼2,컬럼3) 
--                   VALUES(삽입할 데이터1,데이터2,데이터3);

-- 2. UPDATE : 데이터 수정 명령어
INSERT INTO 네이버블로그 VALUES('2','DB','즐거운DB','LIM');
UPDATE 네이버블로그 SET 블로그내용='즐거운PYTHON' ;
UPDATE 네이버블로그 SET 블로그내용='즐거운PYTHON' 
 WHERE 블로그번호 = 2 ;
--> 형식 : UPDATE (테이블명) SET (컬럼명)='수정내용' WHERE PK=()

-- 3.DELETE : 데이터 삭제 명령어
--  회원탈퇴의 경우 : 회원 데이터 삭제해야 함.
--  승환쌤이 네이버 회원 탈퇴
DELETE 
  FROM 네이버블로그
 WHERE 회원ID = 'LIM' ; 
DELETE 
  FROM 네이버_회원 
 WHERE 회원ID= 'LIM';
--  삭제하기 위해선 이전에 참조가 들어간 데이터를 먼저 삭제해줘야 한다.
-- (참조 데이터 무결성)

-- 트랜잭션 : 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행 단위
-- TCL(트랜젝션 제어어) ex) COMMMIT(실행), ROLLBACK(되돌리기), ,,,,,

-- & 트랜잭션의 정의, 명령어
-- * 트랜잭션 : 데이터베이스의 상태를 변화시키기 위해서 수행하는 최소 수행 단위
               = 어떤 하나의 업무를 수행하기 위한 하나의 과정 묶음 
-- TCL(트랜젝션 제어어) ex) COMMMIT(실행), ROLLBACK(되돌리기)
/*
 * 트랜잭션의 4가지 특징
- 원자성 : ALL OR NOTHING, 모두 실행되거나 실행되지 않거나
- 일관성 : 일정하게 수행될 수 있는 상태가 유지되어야 함
- 고립성 : 하나의 트랜잭션 실행시 다른 트랜잭션의 영향을 받지 않는 것
- 지속성 : 성공적으로 수행된 트랜잭션은 영원히 반영 될 수 있어야 함. 

& 트랜잭션의 종류 2가지
* COMMIT : 수행한 트랜잭션을 영구적으로 반영할 때 사용함
마지막 COMMIT 시점 이후 트랜잭션 결과를 저장함

* ROLLBACK : 실행한 트랜잭션 결과를 취소하고 싶을 때 사용
마지막 COMMIT 시점까지만 복구 가능함.
*/

-- TCL : 트랜잭션 명령어
-- 트랜잭션 : 특정 업무를 수행하기 위한 명령어 집합
-- 트랜잭션 반영 : COMMIT
-- 트랜잭션 복구 : ROLLBACK
-- 주의!!) ROLLBACK은 이전 COMMIT 시점 명령어까지만 복구 가능하다.
-- 보미쌤이 네이버 회원 탈퇴할 때
DELETE FROM 네이버블로그 WHERE 회원ID = 'BO';
DELETE FROM 네이버_회원 WHERE 회원ID = 'BO' ;

COMMIT;

ROLLBACK;

SELECT * FROM 네이버_회원 ;

-- DCL : 데이터 제어어
-- 데이터를 안전하게 사용할 수 있게끔 사용자를 제한한다.
--


