--CHAPTER 01. SELECT

-- : 주석 기호

-- 글자 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴
-- 주석 색깔 키우기  : 도구 > 환경설정 > 코드편집기 > PL/SQL주석

-- 주석형태(2): /**/ -> 여러줄을 한번에 주석처리 가능
/*
-- SQL의 주의사항
1. SQL문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰거나 줄바꿈 또한 SQL 명령어 수행에 영향을 주지 않는다.
    (DESC 예외; 단일명령어임)
3. SQL 문장 끝에는 반드시 세미콜론(;)을 찍어줘야 한다.
4. SQL 실행 단축키 : CRTL + ENTER, F9
*/
--DESC : describe/묘사하다.
--> 주로 SQL에서 사용되는 데이터베이스 테이블의 구조를 확인하는데 쓰이는 명령어!
--> 테이블의 열(컬럼)에 대한 정보를 제공하며, 특히 테이블이나 뷰의 구조를 조회할때 사용한다.
desc employees ;
-- SELECT 절 기본 사용 방법
-- SELECT 조회할 컬럼명
-- FROM 조회할 테이블 이름

SELECT FIRST_NAME 
     , SALARY 
  FROM EMPLOYEES ;

-- 문제) 직원테이블에서 직원의 ID와 직원의 EMAIL정보와 직원의 전화번호 정보를 출력해주세요!

DESC EMPLOYEES ;

SELECT EMPLOYEE_ID
     , EMAIL
     , PHONE_NUMBER
  FROM EMPLOYEES ;
  
-- *(아스탈리스크) : 전체 조회 명령

-- 직원 테이블의 전체 정보를 출력하기
SELECT *
  FROM EMPLOYEES ;
-- 문제) 
-- 부서 테이블의 전체 정보 출력하기
-- 직업 테이블의 전체 정보 출력하기

DESC DEPARTMENTS ;

SELECT *
  FROM DEPARTMENTS ;
  
DESC JOBS ;

SELECT * 
  FROM JOBS ;
  
SELECT *
  FROM REGIONS ;
  
-- 직원테이블에서 직원ID, JOB_ID, 부서 ID, FIRST_NAME, HIRE_DATE 순으로 출력하기

SELECT EMPLOYEE_ID
     , JOB_ID
     , DEPARTMENT_ID
     , FIRST_NAME
     , HIRE_DATE
  FROM EMPLOYEES ;
  
SELECT DEPARTMENT_ID 
     , DEPARTMENT_NAME
     , LOCATION_ID
  FROM DEPARTMENTS ;
  
SELECT JOB_ID
  FROM EMPLOYEES ;
  
-- DISTINCT : 데이터 중복 제거 명령어
-- 사용방법
-- SELECT DISTICT 조회할 컬럼1, 조회할 컬럼2 ....
--   FROM 테이블명 ;
-- ( 기본적으로는 SELECT 'ALL'이 기본값 상태
-- 예제) 직원테이블's JOB_ID의 정보의 중복을 제거하여 출력
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES ;
  
-- 직원테이블에서 부서ID의 중복을 제거하여 출력하고 행의 개수를 주석으로 작성
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES ;
-- 12  
  
-- 직원테이블에서 입사일을 중복을 제거하여 출력하고 행의 갯수를 주석으로 작성
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
-- 98

-- 직원테이블에서 JOB_ID와 부서ID의 중복을 제거하여 출력
SELECT DISTINCT JOB_ID
              , DEPARTMENT_ID
           FROM EMPLOYEES ;
-- DISTINCT 뒤에 두개 이상의 컬럼을 적게 되면 
-- 한쪽 컬럼에 중복이 있어도 다른쪽 컬럼의 값이 다르면 다르게 취급한다.

SELECT * FROM EMPLOYEES ;

-- TIP! : 컬럼이 숫자형이면 연산이 가능하다 (+,-,*,/:가능)

-- 직원테이블에서 직원 ID, FIRST_NAME, 급여정보(연봉)을 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * 12
  FROM EMPLOYEES ; 
  
-- 별칭 사용하기
--> Alias라고 하며 한눈에 보기 좋게 설정할 수 있따
--> As(~로써 부를꺼야)키워드를 사용하며 별칭을 지정한다

-- 별칭 사용방법
-- 1. SELECT 컬럼 별칭
-- 2. SELECT 컬럼 "별칭"
-- 3. SELECT 컬럼 As 별칭(젤 많이 사용함)
-- 4. SELECT 컬럼 As "별칭"

-- 예제) 직원의 연봉의 정보까지 출력하기
SELECT FIRST_NAME 
    , SALARY 
    , SALARY*12 AS 월급루팡1년계획
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME
     , SALARY
     , SALARY*12 "별칭"
  FROM EMPLOYEES ;

SELECT FIRST_NAME
     , SALARY
     , SALARY*12 별칭
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME
     , SALARY
     , SALARY*12 AS "월급루팡1년계획"
  FROM EMPLOYEES ;
  
-- 직원테이블에서 직원의 이름(FIRST_NAME), 입사일, 입사일다음날의 정보를 출력하기
-- 단 입사일은 입사일로, 입사일 다음날은 입사일다음날로 별칭 사용하여 출력 

SELECT FIRST_NAME
     , HIRE_DATE AS 입사일
     , HIRE_DATE +1 AS "입사일 다음날"
  FROM EMPLOYEES ;
  
-- ORDER BY 절 : 출력 결과를 정렬된 상태로 출력하고 싶을때
-- 특정 컬럼을 기준으로 정렬하고자 할 때
-- SQL실행순서에서 '가장 마지막에 작성되고' '가장 마지막에 실행'된다
-- : 기본적으로 오름차순으로 정렬됨 (따로 정렬방식 지정X의 경우)
-- ASC (Ascending) : 오름차순 정렬 (1,2,3,4,5,,,,,,)
-- DESC(Descending): 내림차순 정렬 (10,9,8,7,6,5,,,)
-- 작성방법 : (제일 끝에) ORDER BY (정렬 기준 컬럼명)(오름/내림)

-- 예제)직원테이블에서 모든 직원들의 정보를 급여 기준으로 오름차순 정렬하여 출력하기
SELECT * 
  FROM EMPLOYEES 
ORDER BY SALARY ASC ;

-- 최근에 입사한 날짜를 기준으로 직원의 이름과 입사 날짜를 출력하기!

SELECT FIRST_NAME
     , HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- 직원테이블에서 직원ID, 부서ID, 이름(FIRST_NAME), 급여 순으로 출력
-- 단 부서ID는 오름차순으로, 급여는 내림차순으로 정렬하여 출력
-- 데이터 분석 차원에서 해석해보기
--> 앞에 적은 부서ID 오름차순 내에서 급여 내림차순으로 적용되어 출력됨 

SELECT EMPLOYEE_ID
     , DEPARTMENT_ID
     , FIRST_NAME
     , SALARY
  FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID ASC
       , SALARY DESC ;
       
-- NULL이란??
--> NULL값이란 '데이터의 값이 완전히 비어있는 상태'를 말한다
--> 값이 존재하지 않거나 정해지지 않은 것을 의미한다.
-- 숫자 0 / 문자열 "  "은 NULL값에 해당하지 않는다.(값이 있는 경우임.)
--> NULL과 연산을 하면 무조건 NULL값이 나온다.
--> NULL과 비교/대입을 하면 무조건 FALSE값이 나온다.

-- 실습1)직원테이블에서 직원ID, 보너스, 보너스두배의 정보를 출력
-- 단 보너스 두배의 정보 : UP_BONUS로 별칭 사용하여 출력

SELECT *
  FROM EMPLOYEES ;
  
SELECT EMPLOYEE_ID,COMMISSION_PCT,COMMISSION_PCT*2 AS UP_BONUS
  FROM EMPLOYEES ;
  
-- 실습2) 실습1)에서 UP_BONUS의 결과값을 출력해보고 결과값 확인
-- 왜 그렇게 결과값이 나왔는지 설명하기.
--> NULL 값(비어있는 값)이기 때문에 2배가 되더라도 NULL값이 나오게 됨. 