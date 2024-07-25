--CHAPTER 01. SELECT

-- : �ּ� ��ȣ

-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�
-- �ּ� ���� Ű���  : ���� > ȯ�漳�� > �ڵ������� > PL/SQL�ּ�

-- �ּ�����(2): /**/ -> �������� �ѹ��� �ּ�ó�� ����
/*
-- SQL�� ���ǻ���
1. SQL���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���ų� �ٹٲ� ���� SQL ��ɾ� ���࿡ ������ ���� �ʴ´�.
    (DESC ����; ���ϸ�ɾ���)
3. SQL ���� ������ �ݵ�� �����ݷ�(;)�� ������ �Ѵ�.
4. SQL ���� ����Ű : CRTL + ENTER, F9
*/
--DESC : describe/�����ϴ�.
--> �ַ� SQL���� ���Ǵ� �����ͺ��̽� ���̺��� ������ Ȯ���ϴµ� ���̴� ��ɾ�!
--> ���̺��� ��(�÷�)�� ���� ������ �����ϸ�, Ư�� ���̺��̳� ���� ������ ��ȸ�Ҷ� ����Ѵ�.
desc employees ;
-- SELECT �� �⺻ ��� ���
-- SELECT ��ȸ�� �÷���
-- FROM ��ȸ�� ���̺� �̸�

SELECT FIRST_NAME 
     , SALARY 
  FROM EMPLOYEES ;

-- ����) �������̺��� ������ ID�� ������ EMAIL������ ������ ��ȭ��ȣ ������ ������ּ���!

DESC EMPLOYEES ;

SELECT EMPLOYEE_ID
     , EMAIL
     , PHONE_NUMBER
  FROM EMPLOYEES ;
  
-- *(�ƽ�Ż����ũ) : ��ü ��ȸ ���

-- ���� ���̺��� ��ü ������ ����ϱ�
SELECT *
  FROM EMPLOYEES ;
-- ����) 
-- �μ� ���̺��� ��ü ���� ����ϱ�
-- ���� ���̺��� ��ü ���� ����ϱ�

DESC DEPARTMENTS ;

SELECT *
  FROM DEPARTMENTS ;
  
DESC JOBS ;

SELECT * 
  FROM JOBS ;
  
SELECT *
  FROM REGIONS ;
  
-- �������̺��� ����ID, JOB_ID, �μ� ID, FIRST_NAME, HIRE_DATE ������ ����ϱ�

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
  
-- DISTINCT : ������ �ߺ� ���� ��ɾ�
-- �����
-- SELECT DISTICT ��ȸ�� �÷�1, ��ȸ�� �÷�2 ....
--   FROM ���̺�� ;
-- ( �⺻�����δ� SELECT 'ALL'�� �⺻�� ����
-- ����) �������̺�'s JOB_ID�� ������ �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES ;
  
-- �������̺��� �μ�ID�� �ߺ��� �����Ͽ� ����ϰ� ���� ������ �ּ����� �ۼ�
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES ;
-- 12  
  
-- �������̺��� �Ի����� �ߺ��� �����Ͽ� ����ϰ� ���� ������ �ּ����� �ۼ�
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES ;
-- 98

-- �������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT DISTINCT JOB_ID
              , DEPARTMENT_ID
           FROM EMPLOYEES ;
-- DISTINCT �ڿ� �ΰ� �̻��� �÷��� ���� �Ǹ� 
-- ���� �÷��� �ߺ��� �־ �ٸ��� �÷��� ���� �ٸ��� �ٸ��� ����Ѵ�.

SELECT * FROM EMPLOYEES ;

-- TIP! : �÷��� �������̸� ������ �����ϴ� (+,-,*,/:����)

-- �������̺��� ���� ID, FIRST_NAME, �޿�����(����)�� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * 12
  FROM EMPLOYEES ; 
  
-- ��Ī ����ϱ�
--> Alias��� �ϸ� �Ѵ��� ���� ���� ������ �� �ֵ�
--> As(~�ν� �θ�����)Ű���带 ����ϸ� ��Ī�� �����Ѵ�

-- ��Ī �����
-- 1. SELECT �÷� ��Ī
-- 2. SELECT �÷� "��Ī"
-- 3. SELECT �÷� As ��Ī(�� ���� �����)
-- 4. SELECT �÷� As "��Ī"

-- ����) ������ ������ �������� ����ϱ�
SELECT FIRST_NAME 
    , SALARY 
    , SALARY*12 AS ���޷���1���ȹ
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME
     , SALARY
     , SALARY*12 "��Ī"
  FROM EMPLOYEES ;

SELECT FIRST_NAME
     , SALARY
     , SALARY*12 ��Ī
  FROM EMPLOYEES ;
  
SELECT FIRST_NAME
     , SALARY
     , SALARY*12 AS "���޷���1���ȹ"
  FROM EMPLOYEES ;
  
-- �������̺��� ������ �̸�(FIRST_NAME), �Ի���, �Ի��ϴ������� ������ ����ϱ�
-- �� �Ի����� �Ի��Ϸ�, �Ի��� �������� �Ի��ϴ������� ��Ī ����Ͽ� ��� 

SELECT FIRST_NAME
     , HIRE_DATE AS �Ի���
     , HIRE_DATE +1 AS "�Ի��� ������"
  FROM EMPLOYEES ;
  
-- ORDER BY �� : ��� ����� ���ĵ� ���·� ����ϰ� ������
-- Ư�� �÷��� �������� �����ϰ��� �� ��
-- SQL����������� '���� �������� �ۼ��ǰ�' '���� �������� ����'�ȴ�
-- : �⺻������ ������������ ���ĵ� (���� ���Ĺ�� ����X�� ���)
-- ASC (Ascending) : �������� ���� (1,2,3,4,5,,,,,,)
-- DESC(Descending): �������� ���� (10,9,8,7,6,5,,,)
-- �ۼ���� : (���� ����) ORDER BY (���� ���� �÷���)(����/����)

-- ����)�������̺��� ��� �������� ������ �޿� �������� �������� �����Ͽ� ����ϱ�
SELECT * 
  FROM EMPLOYEES 
ORDER BY SALARY ASC ;

-- �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի� ��¥�� ����ϱ�!

SELECT FIRST_NAME
     , HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC ;

-- �������̺��� ����ID, �μ�ID, �̸�(FIRST_NAME), �޿� ������ ���
-- �� �μ�ID�� ������������, �޿��� ������������ �����Ͽ� ���
-- ������ �м� �������� �ؼ��غ���
--> �տ� ���� �μ�ID �������� ������ �޿� ������������ ����Ǿ� ��µ� 

SELECT EMPLOYEE_ID
     , DEPARTMENT_ID
     , FIRST_NAME
     , SALARY
  FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID ASC
       , SALARY DESC ;
       
-- NULL�̶�??
--> NULL���̶� '�������� ���� ������ ����ִ� ����'�� ���Ѵ�
--> ���� �������� �ʰų� �������� ���� ���� �ǹ��Ѵ�.
-- ���� 0 / ���ڿ� "  "�� NULL���� �ش����� �ʴ´�.(���� �ִ� �����.)
--> NULL�� ������ �ϸ� ������ NULL���� ���´�.
--> NULL�� ��/������ �ϸ� ������ FALSE���� ���´�.

-- �ǽ�1)�������̺��� ����ID, ���ʽ�, ���ʽ��ι��� ������ ���
-- �� ���ʽ� �ι��� ���� : UP_BONUS�� ��Ī ����Ͽ� ���

SELECT *
  FROM EMPLOYEES ;
  
SELECT EMPLOYEE_ID,COMMISSION_PCT,COMMISSION_PCT*2 AS UP_BONUS
  FROM EMPLOYEES ;
  
-- �ǽ�2) �ǽ�1)���� UP_BONUS�� ������� ����غ��� ����� Ȯ��
-- �� �׷��� ������� ���Դ��� �����ϱ�.
--> NULL ��(����ִ� ��)�̱� ������ 2�谡 �Ǵ��� NULL���� ������ ��. 