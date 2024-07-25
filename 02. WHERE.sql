--CHAPTER 02. WHERE

-- WHERE절 기본 사용 방법
-- 3. SELECT 조회할 컬럼명1,....조회할 컬럼명N
-- 1. FROM  조회할 테이블 정보
-- 2. WHERE 원하는 행을 가져오기 위한 조건식 ;

-- 실습1) 직원 테이블에서 직원ID가 105인 직원의 FIRST_NAME, LAST_NAME을 출력하기

SELECT *
  FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105 ;
 
-- 실습1) 부서 테이블에서 매니저 아이디가 100인 부서 이름과 부서 아이디를 출력하기
SELECT MANAGER_ID,DEPARTMENT_NAME,DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100 ;
 
 -- 실행 단축키 : ; 이후 CTRL + ENTER / F9
 
 -- 실습3) 직원테이블에서 급여가 9000인 직원의 직원 ID, 이름(FIRST), 급여 정보를 출력하기
 SELECT *
   FROM EMPLOYEES ;
 
 SELECT  EMPLOYEE_ID, FIRST_NAME, SALARY
   FROM EMPLOYEES
  WHERE SALARY = 9000 ;
  
-- SQL에서 사용하는 연산자

-- 산술 연산자 ( +:더하기, -:빼기, *:곱하기, /:나누기)
SELECT SALARY, SALARY*12 AS 연봉
 FROM EMPLOYEES ;
 
SELECT HIRE_DATE, HIRE_DATE+1 AS 입사일다음날
 FROM EMPLOYEES ;
 
-- 비교 연산자(<(초과), <=(이상), >(미만), >=(이하))

-- 실습1) 직원 테이블에서 급여가 5000이하인 직원의 이름과 급여정보를 출력하기!!

SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000 
 ORDER BY SALARY ASC ;
 
--실습2) 직원테이블에서 연복잉 50000이하인 직원들의 급여와 연봉을 출력하기
-- 단, 연봉은 AnnSal이라는 별칭을 사용하여 출력

SELECT FIRST_NAME,SALARY, SALARY*12 AS AnnSal
  FROM EMPLOYEES
 WHERE SALARY*12 <= 50000
 ORDER BY SALARY DESC ;
 
 -- 등가비교 연산자
 -- =: 같다, 
 -- !=:같지 않다, <>:같지 않다, ^=:같지 않다)
 -- NOT A=B : 같지 않다.
 
 DESC EMPLOYEES ;
 
 -- 문자형 사이에 비교하기 위해서는 따옴표('')로 감싸줘야 한다.
 -- 날짜 등등 숫자,문자 섞인 경우도 마찬가지로 따옴표('')로 감싸줘야 한다.
 -- 대문자와 소문자 잘 구분해서 검색하기
 
 -- 실습3)직원테이블에서 직업아이디(JOB_ID)가 IT_PROG가 아닌 직원의 정보를 출력
 --(FIRST_NAME, JOB_ID)의 정보를 출력하기
 
 SELECT FIRST_NAME, JOB_ID 
   FROM EMPLOYEES
  WHERE JOB_ID != 'IT_PROG' 
  ORDER BY FIRST_NAME DESC ;
  
-- 별칭에는 쌍따옴표 사용함
-- 그 외 일반 문자를 표현할 때에는 단따옴표 사용

-- 실습) 직원 테이블에서 이메일 정보가 SKING 인 직원의 모든 정보를 출력하기!
SELECT *
  FROM EMPLOYEES ;

SELECT *
  FROM EMPLOYEES
 WHERE EMAIL = 'SKING' ;

-- 논리 연산자 : 참(True)이냐 / 거짓(False)이냐
-- AND(그리고) : 조건을 모두 만족하는 경우 -> True
-- OR (또는) : 조건 중 하나라도 만족하는 경우 -> True

--실습) 직원테이블에서 부서 아이디가 90이고 급여가 5000이상인 직원의 정보
-- 직원 아이디와 직원의 이름을 출력

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 90 
   AND SALARY >= 5000 ;
   
-- 실습) 직원테이블에서 부서아이디가 100이거나 
-- 입사일이 06년 02월 02일 이후에 입사한 직원의 정보 출력하기
-- 직원의 이름과 입사일 정보 출력하기

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100
    OR HIRE_DATE >= '06/02/02' 
ORDER BY HIRE_DATE ASC;

-- 실습3) 부서 ID가 100이거나 90인 직원 중에서
-- 직원 ID가 101인 직원의 직원 ID, 이름, 연봉을 출력 (단 연봉--> ANNSAL)

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY*12 AS "ANNSAL",EMPLOYEE_ID, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE(DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90 )
    AND EMPLOYEE_ID = 101;    
-- AND >> OR : AND가 더 우선순위임.

-- NULL 관련 연산자
-- IS NULL : 데이터 값이 NULL인 값을 조회할 때
-- IS NOT NULL : 데이터 값이 NULL이 아닌 값을 조회할 때

-- 실습) 직원테이블에서 보너스가 있는 직원의 이름과 보너스 정보를 출력하기.

SELECT EMPLOYEE_ID, COMMISSION_PCT
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL ;
 
 -- SQL 연산자 : SQL에서만 사용할 수 있는 연산자
 -- IN, BETWEEN A AND B, LIKE 연산자
 
 -- IN : 특정 컬럼에 포함된 데이터를 여러개 조회할 때 활용함
 -- IN의 특징 : 결과값 도출시, NULL 값을 제외하는 특성이 있음
 -- = + OR 연산자를 합친 결과값을 도출한다.
 -- NULL 값은 OR 연산자에서 
 
 -- 부서 아이디가 30 OR 50 OR 90 인 직원의 모든 정보를 출력하기
 
 SELECT *
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID = 30
     OR DEPARTMENT_ID = 50
     OR DEPARTMENT_ID = 90 
     OR DEPARTMENT_ID = 10 ;

-- IN 연산자 사용시
  SELECT *
   FROM EMPLOYEES
  WHERE DEPARTMENT_ID IN (30,50,90, NULL) ;
  
-- 부서 아이디가 없는 직원의 FIRST_NAME은 무엇일까요?

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES 
 WHERE DEPARTMENT_ID IS NULL ; 
 
-- 실습) 직원테이블에서 매니저 아이디가 100, 102, 103인 직원의 이름과 매니저 아이디를 출력!

SELECT FIRST_NAME, LAST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID IN (100,102,103) ; 
 
 -- NOT IN : 특정 조건에 해당하지 않은 결과값 출력할 때
 -- != + AND 가 합쳐진 결과값을 출력한다
 -- NOT IN 연산자에 NULL값을 넣으면 아무런 값이 출력되지 않는다.
 -- 직원테이블에서 매니저 아이디가 100, 120, 121 이 아닌 직원의 이름과 매니저 아이디를 출력!
 SELECT FIRST_NAME, MANAGER_ID
   FROM EMPLOYEES 
  WHERE MANAGER_ID NOT IN (100,120,121,NULL) ;
  
-- 직원테이블에서 직업아이디가 AD_VP 이거나 ST_MAN인 직원의 이름과 직업아이디를 출력하기!
SELECT FIRST_NAME, LAST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('AD_VP','ST_MAN');

-- 직원테이블에서 매니저 아이디가 145,146,147,148,149가 아닌 직원의 이름과 매니저 아이디 출력!
SELECT FIRST_NAME, MANAGER_ID
  FROM EMPLOYEES
 WHERE MANAGER_ID NOT IN (145,146,147,148,149);
 
-- BETWEEN A AND B :범위 연산자 - 일정 범위 내의 데이터를 조회할때 사용하는 연산자.
--> BETWEEN '최소값' AND '최대값'
--> 특정 열 값의 최소, 최고 범위를 지정하여 해당 범위 내의 데이터를 조회하는 것.
--> BETWEEN A 이상 B 이하의 범위 내의 값을 조회함 ( A,B값을 포함한 결과!)

-- 실습) 직원테이블에서 급여가 10000이상 20000이하의 직원의 이름과 급여를 출력하기!
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000
   AND SALARY <= 20000 ;
   
-- BETWEEN 연산자 활용
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY BETWEEN 10000 AND 20000 ; 
 
 -- 직원테이블에서 05년에 입사한 직원의 이름과 입사날짜 정보를 출력하기
 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31' ;
 
-- LIKE 연산자 : 일부 문자열이 포함된 데이터를 조회할 때 사용함
-- &, _ 등의 와일드카드를 이용해서 매칭 연산을 진행한다.


-- 와일드 카드의 종류
 -- %(퍼센트) : 길이와 상관없이 모든 문자 데이터를 의미
 -- _(언더바) : 어떤 값이든 상관없이 한개의 문자데이터를 의미
 
 -- 실습) 휴대폰번호가 650으로 시작하는 직원의 이름, 핸폰 번호 출력!!
 
 SELECT FIRST_NAME, PHONE_NUMBER 
   FROM EMPLOYEES 
  WHERE PHONE_NUMBER LIKE '650.%' ;
  
-- 문제1) 직원테이블에서 FIRST_NAME이 S로 시작하고 n으로 끝나는 직원의 이름을 출력하기!
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%'
   AND FIRST_NAME LIKE '%n';

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%n';
 
-- 문제2) 직원테이블에서 FIRST_NAME이 it으로 끝나고 총 4글자인 직원의 이름을 출력하기
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES 
 WHERE FIRST_NAME LIKE '__it' ;
 
-- 문제3) 직원테이블에서 이름 두번째 글자가 e인 직원의 이름을 출력
SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '_e%' ;
 
-- 문제4) 직원테이블에서 01월에 입사한 직원의 이름과 입사날짜를 출력 
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01/__' ;

SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE HIRE_DATE LIKE '__/01%' ;
 
 -- 