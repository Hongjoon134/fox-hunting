-- CHAPTER 03. 오라클 함수

-- 함수(FUNCTION)
--> 입력값을 넣어 특정한 기능을 통해 결과값을 출력

-- 사용자 정의 함수 : 사용자가 필요에 의해 정의한 함수
-- 내장 함수 : 오라클에서 미리 만들어놓은 함수, 필요할 때마다 호출해서 사용
--> 내장 함수는 문자형, 숫자형, 날짜형, 변환형, NULL처리 함수, 조건함수

-- 함수 이름 (  ) : 함수를 실행할 때 사용하는 입력 값
--               : (괄호)안에 들어가는 값-> 명칭 : '매개 변수', '인자값'

-- [ 문자형 함수 ]

-- UPPER( ) : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력해줌
-- LOWER( ) : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력해줌

-- 예제) 
SELECT LOWER('ABCDE1234@@')
  FROM DUAL ;
-- DUAL 테이블 : 오라클 최고관리자 SYS소유의 시스템
--> 임시 연산이나 함수의 결과 값 용도로 사용하는 테스트용 테이블
   = 테스트 하기 위한 임시 테이블임
   
-- 직원테이블에서 직원의 first_name과 email의 정보를 모두 출력
-- FIRST_NAME을 모두 대문자로, EMAIL의 정보를 모두 소문자로 출력하기

-- 예제)
SELECT FIRST_NAME,UPPER(FIRST_NAME), EMAIL, LOWER(EMAIL)
  FROM EMPLOYEES ;


-- LENGTH( ) : 괄호 안 문자 데이터의 길이를 구하는 함수
--          : 문자열에 사용된 '문자의 개수'를 구해줌(띄어쓰기 포함)

SELECT LENGTH('ABCDE1234@@')
  FROM DUAL ;
  -- 예제) 직원테이블에서 직원의 이름 출력해주고 직원의 이름의 길이도 출력하기
SELECT FIRST_NAME, LAST_NAME, LENGTH(FIRST_NAME)
  FROM EMPLOYEES ;
  
  -- 예제) 직원의 FIRST_NAME의 길이가 5인 이상인 직원들의 직원 ID, 이름 출력하기!
SELECT LENGTH(FIRST_NAME), FIRST_NAME, LAST_NAME, EMPLOYEE_ID
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME)>=5 
 ORDER BY LENGTH(FIRST_NAME) DESC;
 
 -- SUBSTR( ) : 원하는 문자열을 추출하는 함수 
 -- 방법1) SUBSTR(전체 입력값, 시작위치(1부터인덱스번호), 추출길이(문자개수))
 -- 문자열 데이터의 시작 위치부터 추출 길이만큼 출력해준다.
 -- 방법2) SUBSTR(전체 입력값, 시작위치)
 --> 추출 길이를 생략시 문자열의 시작위치부터 끝까지 출력한다.
SELECT SUBSTR('스마트인재개발원',4,2) AS 인재
     , SUBSTR('인공지능사관학교',1,4) AS 사관학교 
     , SUBSTR('스마트인재개발원',4) AS 인재개발원
     , SUBSTR('스마트인재개발원',6) AS 개발원
   FROM DUAL ;
   
-- 직원테이블에서 입사 날짜를 연도, 년, 월, 일 별로 출력
-- 단, 각 컬럼에는 연도 월 일 이라는 별칭을 사용해서 출력하기!


SELECT  HIRE_DATE, SUBSTR(HIRE_DATE,0,2) AS 연도
                 ,  SUBSTR(HIRE_DATE,4,2) AS 월 
                 ,  SUBSTR(HIRE_DATE,7,2) AS 일
  FROM EMPLOYEES ;
  
-- REPLACE( ) : 특정 문자를 다른 문자로 바꾸어주는 함수
-- 방법1) REPLACE('전체문자열','바꾸고싶은문자','바꿔야할문자')
-- 방법2) REPLACE('전체문자열','바꾸고싶은문자')
--> 바꿔야 할 문자를 생략 시, 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다!
  SELECT REPLACE('스마트%%인재개발원','%%',' ') 
   FROM DUAL ;
   
-- 직원 테이블에서 입사 날짜를 출력하기
-- /(슬러시) 문자열을 -(하이픈)으로 바꿔서 출력 
-- /(슬러시) 문자열을 삭제해서 출력

SELECT HIRE_DATE
     , REPLACE(HIRE_DATE,'/',' ') 
     , REPLACE(HIRE_DATE,'/')
  FROM EMPLOYEES ;
  
-- CONCAT( ) : 두 문자열 데이터를 합치는 함수
-- 매개 변수로 2개만 들어갈 수 있고 2개의 문자열만 합치는 함수이다.
-- 2개 이상의 문자열을 합치고 싶을 때 : '합성 연산자'(||) 입력하기 -> 무한대로 문자열 연결이 가능함

SELECT CONCAT('스마트','인재개발원')
  FROM DUAL ;
  
SELECT CONCAT('스마트','인재개발원'||'정말')||'최고에용'||'!!!'
  FROM DUAL ;
  
-- TRIM( ) : 입력받은 문자형 데이터의 양끝의 공백을 제거한다.

SELECT TRIM('  여러분은 최고입니다  ')
     , REPLACE(TRIM('   여 러 분 은 최 고 입 니 다   '), ' ' )
     , REPLACE(' 여 러 분 은 최 고 입 니 다  ', ' ' )
  FROM DUAL ;
-- TIP) REPLACE 함수를 겹쳐쓰면 안쪽 공백 제거 가능하다.

--[ 숫자형 함수 ]

-- ROUND( ) : 특정 위치에서 반올림하는 함수
-- 1) ROUND(반올림할 숫자, 반올림할 자릿수)
-- 2) ROUND(반올림할 숫자)
--> 반올림 위치 생략시 소수점 첫째자리에서 강제로 반올림됨.
SELECT ROUND(1234.56789,1) AS "1234.6"
  FROM DUAL ; 
  
SELECT ROUND(1234.56789)
  FROM DUAL ; 

-- TRUNC( ) : 특정 위치에서 버림하는 함수
-- 1)TRUNC(버림할 숫자, 버림할 자릿수)
-- 2)TRUNC(버림할 숫자)
--> 처음 위치 생략시 소수점 첫째자리에서 강제로 버림됨
SELECT TRUNC(1234.56789,1) AS "1234.5"
  FROM DUAL ; 
  
-- MOD( ) : 숫자를 나눈 나머지 값을 구하는 함수
-- 홀수 ,짝수를 구분할 때 유용하게 사용한다
-- MOD(나눗셈될 숫자, 나눌 숫자)
SELECT MOD(10,3) AS "1"
       ,MOD(15,6) AS "3"
  FROM DUAL ; 
  
-- [ 날짜형 함수 ]

-- SYSDATE : 현재 날짜와 시간을 출력해주는 함수
--> 입력 시 바로 출력이 되며, 현재 시간을 초단위까지 출력이 가능하다.
--> 날짜형 데이터는 연산이 가능하다. ex)HIRE_DATE+1 = '입사일 다음날'
--> 날짜형 데이터끼리는 연산이 불가능하다 ( SYSDATE + SYSDATE --> 오류!! )
SELECT SYSDATE
  FROM DUAL ; 
  
-- 날짜형식 셋팅 바꾸기
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜 형식 > YYYY-MM-DD, HH24:MI:SS 로 바꾸기

SELECT SYSDATE AS "현재 날짜"
      , SYSDATE+1 AS "내일 날짜"
      , SYSDATE-1 AS "어제 날짜"
  FROM DUAL ;
  
-- 날짜 데이터를 활용하는 방법
SELECT SYSDATE AS 현재
     , SYSDATE+1 AS "하루 더함"
     , SYSDATE+1/24 AS "한시간 더함"
     , SYSDATE+1/24/60 AS "일분 더함"
     , SYSDATE+1/24/60/60 AS "일초 더함"
  FROM DUAL ;

-- ADD_MONTHS() : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 더하거나 뺄 개월수)

SELECT SYSDATE AS "현재"
    ,ADD_MONTHS(SYSDATE, -1) AS "1개월 전"
    , ADD_MONTHS(SYSDATE, 6) AS "6개월 후"
  FROM DUAL ; 
  
-- [ 변환형 함수 ]

-- 형태 변화 형태의 종류
-- 1) 암시적 형 변환 : 데이터베이스가 자동으로 형 변환을 해주는 것.
SELECT SALARY * '12'
  FROM EMPLOYEES ;
-- 데이터베이스가 자동으로 문자를 숫자형태로 바꿔줌.
--(12:완전히 숫자형태이므로 자동으로 형태변환)
-- but ','는 의미가 달라지므로 바꿔줄 수 없음
SELECT SALARY * '12.00'
  FROM EMPLOYEES ;
-- 2) 명시적 형 변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정해주는 것.

-- TO_CHAR( ) : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
-- TO_CHAR(변환할 데이터, 원하는 문자 출력 형태)
SELECT  SALARY
    , TO_CHAR(SALARY,'L999,999') AS "|000,000"
  FROM EMPLOYEES ;
  
SELECT TO_CHAR(SYSDATE,'YY/MM/DD/DAY')
  FROM DUAL ;
  
-- TO_NUMBER( ) : 문자데이터를 숫자 데이터로 변환하는 함수
-- TO_NUMBER(문자열데이터, 인식될 숫자형태)
-- 입력 형태의 길이 < 출력 형태의 길이 : 반드시 출력 형태의 길이가 더 길어야 한다!!
-- ex) 1,0000 << 999999 
SELECT TO_NUMBER('1,000','99999' ) + 500
  FROM DUAL ;
  
-- TO_DATE( ) : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열데이터, 인식될 날짜 형태)

SELECT TO_DATE('20240612','YYYY/MM/DD')
  FROM DUAL ;
  
-- [ NULL 처리 함수 ]
-- TIP) NULL : 오직 IS NULL / IS NOT NULL로만 출력 가능하다.

-- NVL /NVL2 : NULL 값을 대체할 수 있는 함수
-- 1) NVL(NULL인지 여부를 검사할 데이터=<1>, <1>이 NULL일 경우 반환할 데이터=<2>)
--> <1>,<2> 들어갈 형태 : 문자-문자 / 숫자-숫자 지켜주기!

SELECT FIRST_NAME, DEPARTMENT_ID   
    , NVL(DEPARTMENT_ID,0)
  FROM EMPLOYEES ;
--2) NVL2(NULL인지 여부를 검사할 데이터<1>,<1>이 NULL이 아닐 경우 반환할 데이터<2>
--        ,<1>이 NULL일 경우 반환할 데이터<3>)
--2) NVL2(NULL인지 검사할 데이터<1>, <1>-NULL=X: 반환할 데이터<2>, <1>-NULL=O: 반환할 데이터<3>)
--> <1>,<2>,<3> 들어갈 형태 : 문자-문자-문자 / 숫자-숫자-숫자 지켜주기!
-- 외우는 법 : null XO소스에 담가버리겟어!

--예제) 직원테이블에서 직원 ID, FIRST_NAME, MANAGER_ID를 출력
-- 매니저가 있는 직원: '직원'으로 출력
-- 매니저가 없는 직원: '대표'로 출력하기!!

SELECT MANAGER_ID
  FROM EMPLOYEES ;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , NVL2(MANAGER_ID,'직원','대표') 
  FROM EMPLOYEES ;
  
SELECT  FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT,0)    
  FROM EMPLOYEES ;
  
--  [ 조건 함수 ] 

-- DECODE ( ) : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사 대상과 비교해서 지정한 값을 반환한다.

-- 방법1) DECODE(검사대상이 될 데이터<1>, <1>의 비교값<2>
--       , 비교해서 일치할 때 반환할 값<3>, 일치하지 않을 때 반환할 값 <4> )
-- 외우는 법 DECODE B(교)OX
-- 방법2) DECODE(기준이 될 베이스 컬럼<1>, <1>에 관련된 조건1<2>, 일치시 도출값, 조건2, 조건2 일치시 반환값,..... 
--             , 일치 않을 시 반환값)

--예제) 직원테이블에서 직원 ID, FIRST_NAME, MANAGER_ID를 출력 (DECODE함수 활용)
-- 매니저가 있는 직원: '직원'으로 출력
-- 매니저가 없는 직원: '대표'로 출력하기!!

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(MANAGER_ID,NULL,'대표','직원') 
  FROM EMPLOYEES ;
  
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(EMPLOYEE_ID,100,'대표',101,'이사',102,'팀장','직원') 
  FROM EMPLOYEES ;