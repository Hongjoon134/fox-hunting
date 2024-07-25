-- CHAPTER 04. GROUP BY / HAVING

-- 내장 함수의 종류
-- 단일 행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
--> ex) 문자형, 숫자형, 날짜형, 변환형, null처리 함수, 조건함수
-- 다중 행 함수 : 여러행을 입력받아 하나의 결과 값으로 출력이 되는 함수
-- 다중 행 함수를 "집계 함수"라고 부른다.

-- 다중 행 함수(집계 함수)의 특징
-- 1) 집계함수는 NULL값을 제외하는 특성을 가지고 있습니다.
-- 2) 집계함수는 그룹화(GROUP BY)가 되어 있는 상태에서만 사용이 가능하다.

-- 집계 함수의 종류
-- COUNT(데이터) - 지정한 데이터의 '개수' 출력
-- SUM(데이터) - 지정한 데이터의 '합계' 출력
-- MAX(데이터) - 지정한 데이터의 '최댓값' 출력
-- MIN(데이터) - 지정한 데이터의 '최솟값' 출력
-- AVG(데이터) - 지정한 데이터의 '평균값' 출력

-- 직원 테이블에서 직원ID의 행의 개수 조회하기
 SELECT COUNT(EMPLOYEE_ID)
   FROM EMPLOYEES
GROUP BY() ;
-- GROUP BY 가 생략된 상태 : '직원 테이블'이라는 하나의 그룹으로 묶은 걸로 인식해서
--                         집계 함수가 사용되는 것

-- 직원테이블에서 부서ID와 행의 개수를 조회하기

SELECT COUNT(DEPARTMENT_ID) AS "NULL값 제외 106개"
  FROM EMPLOYEES ;
  
-- COUNT 함수의 특징 :" * "( 아스타리스크)를 사용할 수 있다.
-- / 다른 집계 함수는 사용 불가능!!
-- *(아스타리스크)를 사용하면 NULL값까지 포함한 결과값이 출력된다.

SELECT COUNT(*) AS "107개"
  FROM EMPLOYEES;
  
SELECT  COUNT(DEPARTMENT_ID), DEPARTMENT_ID
  FROM EMPLOYEES ;
-- 서로 출력되는 행의 개수가 달라서(1개,107개) 오류가 나온다.

-- 예제1) 직원테이블에서 직원 급여의 총 합계 =??
SELECT SUM(SALARY)
  FROM EMPLOYEES ;

-- 예제2) 직원 테이블에서 직원들의 최대 급여와 최소 급여 =??
SELECT MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES ;

-- 예제3) 직원 테이블에서 부서ID가 100인 직원의 평균 급여
--       단, 결과값은 소숫점 1의자리에서 반올림해서 출력하기!
SELECT ROUND(AVG(SALARY),1)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 100 ;
 
-- 테스트 쿼리 테이블 조회
SELECT *
  FROM 수강생정보 ;
SELECT *
  FROM 성적표 ; 

-- * GROUP BY 사용방법
-- 4.SELECT   컬럼명1, 컬럼명2, 컬럼명3,,,,
--  1. FROM 조회할 테이블 이름
-- (2.WHERE 원하는 행을 선별하기 위한 조건식)
-- 3. GROUP BY 특정한 컬럼을 기준으로 그룹화(묶어주기)

-- * SQL 작성 순서
-- SELECT > FROM >  WHERE > GROUP BY > HAVING > ORDER BY
-- * SQL 실행순서
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

-- 수강생정보 테이블에서 '소속반 별'(GROUP BY) 학생의 인원수를 조회하기.
SELECT 소속반, COUNT(학생이름)
  FROM 수강생정보 
GROUP BY 소속반 ; 

-- * GROUP BY 절을 사용할 때 유의해야 할 점
-- 1. GROUP BY 절을 사용하게 되면 그룹화의 결과로 
-- 실제 행의 개수가 줄어들기 때문에 GROUP BY 절보다 늦게 실행되는 절인 
-- SELECT, HAVING, ORDERBY절에는 출력할 수 있는 행이 제한이 된다.
-- 2. 대신 집계함수로 처리하는 컬럼은 사용이 가능하다!!

SELECT 소속반, COUNT(학생이름) 
  FROM 수강생정보 
GROUP BY 소속반 ;

-- 성적표 테이블에서 과목별(GROUP BY)로 최고 성적과 최저 성적을 출력하기

SELECT *
  FROM 성적표 ;
  
SELECT 과목, MAX(성적), MIN(성적)
  FROM 성적표 
GROUP BY 과목 ;

--예제) 성적표 테이블에서 학생별(GROUP BY)로 평균 점수 출력하기
-- 단 소수점 1자리까지만 출력

SELECT 학생ID, ROUND(AVG(성적),1) AS "성적 평균 소수점1"
  FROM 성적표
GROUP BY 학생ID ;

-- 예제) 성적표 테이블에서 학생별(GROUP BY)로 JAVA, 데이터베이스 과목의 성적의 합 출력하기.

SELECT 학생ID, SUM(성적)
  FROM 성적표 
 WHERE 과목= 'JAVA' OR 과목= 'DATABASE' 
GROUP BY 학생ID ;

SELECT 학생ID, SUM(성적)
  FROM 성적표
 WHERE 과목 IN ('JAVA','DATABASE') 
GROUP BY 학생ID ; 

-- HAVING절 : GROUP BY 절이 존재할 때 사용 가능
--> 집계가 완료된 대상을 조건을 걸어서 필터링하는 문법
--> 조건이 참인 결과만 출력이 된다는 점에서 WHERE절과 비슷하지만
--> HAVING절은 그룹화(GROUP BY)가 된 대상에서 출력이 된다는 점에서 다르다.

-- 1. 성적표 테이블에서 평균 성적을 구하고
-- 2. 이 평균 성적이 75이하인 학생들만 출력하기(HAVING 조건절 이용)

SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID
  HAVING AVG(성적)<=75 ;
  
-- SQL 실행 순서에 의거하여 WHERE절은 GROUP BY보다 먼저 실행이 되기 때문에
-- WHERE 절은 집계함수에 대한 조건을 걸 수 없다.
--> GROUP BY가 되어있지 않은 상태이기 때문에 에러가 나온다.

-- 예제1) 수강생정보 테이블에서 소속반별(GROUP BY) 인원수가 3명 이상인 반만 출력하기

-- 해답) 
-- 0) 해당 테이블의 정보를 조회 SELECT * FROM 해당테이블
-- 1) 소속반 컬럼을 기준으로 GROUP BY 하기
-- 2) SELECT절에 COUNT( )을 이용해서 인원수를 조회하기
-- 3) HAVING절을 사용해서 집계함수에 대한 조건을 작성하기
SELECT * FROM 수강생정보 ;

SELECT 소속반, COUNT(학생ID)
  FROM 수강생정보
GROUP BY 소속반 
  HAVING COUNT(학생ID)>=3 ;
  
-- 예제2) 성적표 테이블에서 '학생별'(GROUP BY) 평균 성적을 출력하되
-- NULL이 아닌 값만 출력하기, 단 성적의 소수점 1의 자리까지 출력하기.
SELECT * FROM 성적표 ;

SELECT 학생ID, ROUND(AVG(성적),1)
  FROM 성적표
GROUP BY 학생ID 
  HAVING  AVG(성적)IS NOT NULL ; 

-- 예제3) 직원테이블에서 '부서별'(GROUP BY)로 최고 연봉이 100000 이상인 부서만 출력하기.
SELECT * FROM EMPLOYEES ;

SELECT DEPARTMENT_ID, MAX(SALARY*12)
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
  HAVING MAX(SALARY*12)>=100000 ; 