-- 객체 : DATABASE에서 데이터를 다루는 여러 방법
-- 시퀀스(SEQUEUNCE) : 특정 규칙에 맞게 연속된 숫자를 생성하는 객체
-- 임의의 PK값을 설정하고 싶을 때 주로 사용함

-- 0부터 100까지 1씩 증가하는 연속된 숫자(시퀀스)를 생성하는 방법
CREATE SEQUENCE MY_SEQ -- 시퀀스 이름 설정하기
INCREMENT BY 1 -- 시퀀스 증가/감소 숫자
START WITH 0 -- 시작하는 숫자
MAXVALUE 100 -- 최대값 : 100
MINVALUE 0 ; -- 최소값 : 0

DROP SEQUENCE MY_SEQ ;

CREATE TABLE MEMBER(
    NUM NUMBER(3,0),
    NAME VARCHAR2(10),
    NICK VARCHAR2(20)
);
SELECT * FROM MEMBER ;

 DROP TABLE MEMBER;

-- 시퀀스명.NEXTVAL : 다음 시퀀스 값을 생성해줄 것.
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환3','점짜저냉');

INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환1','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환2','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환3','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환4','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환5','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환6','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환7','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환8','점짜저냉');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'승환9','점짜저냉');

-- 현재 시퀀스값 확인
SELECT MY_SEQ.CURRVAL FROM MEMBER;

SELECT* FROM MEMBER;

-- DUAL : DATABASE 전체 정보를 가진 테이블

-- 뷰(VIEW) : 가상의 테이블(읽기 전용 테이블)
  --> 지정된 가상 테이블에서만 검색하면 검색속도가 월등히 빨라진다.
  --> 삽입, 수정, 데이터 삭제 : 불가능하다. 
-- 전직원의 직원번호, FIRST_NAME, 해당 직원이 근무하는 부서명을 출력하기

SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ; 
 

CREATE VIEW V_EMP_D
AS
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME
  FROM EMPLOYEES E, DEPARTMENTS D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ; 
 
EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME

SELECT * FROM V_EMP_D ;

-- 뷰 삭제하는 방법
DROP VIEW V_EMP_D;

-- 서브쿼리 : 메인쿼리문 안에서 돌아가는 또 다른 쿼리문
-- FIRST_NAME 이 'Shelley'인 직원의 급여보다 더 낮은 직원의 급여를 받는 직원들의 
-- FIRST_NAME, SALARY를 출력시켜 주세요.

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES 
 WHERE SALARY < (
                SELECT SALARY
                  FROM EMPLOYEES
                 WHERE FIRST_NAME = 'Shelley' 
                 );
 
SELECT SALARY
  FROM EMPLOYEES
 WHERE FIRST_NAME = 'Shelley' ; 
 
 --'IT'부서에서 근무하는 직원들의 FIRST_NAME과 SALARY 출력하기
 
 SELECT FIRST_NAME, SALARY
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID = (
                        SELECT DEPARTMENT_ID
                          FROM DEPARTMENTS
                         WHERE DEPARTMENT_NAME = 'IT'
                         ) ;
  
  SELECT DEPARTMENT_ID
    FROM DEPARTMENTS
   WHERE DEPARTMENT_NAME = 'IT' ;