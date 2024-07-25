-- ��ü : DATABASE���� �����͸� �ٷ�� ���� ���
-- ������(SEQUEUNCE) : Ư�� ��Ģ�� �°� ���ӵ� ���ڸ� �����ϴ� ��ü
-- ������ PK���� �����ϰ� ���� �� �ַ� �����

-- 0���� 100���� 1�� �����ϴ� ���ӵ� ����(������)�� �����ϴ� ���
CREATE SEQUENCE MY_SEQ -- ������ �̸� �����ϱ�
INCREMENT BY 1 -- ������ ����/���� ����
START WITH 0 -- �����ϴ� ����
MAXVALUE 100 -- �ִ밪 : 100
MINVALUE 0 ; -- �ּҰ� : 0

DROP SEQUENCE MY_SEQ ;

CREATE TABLE MEMBER(
    NUM NUMBER(3,0),
    NAME VARCHAR2(10),
    NICK VARCHAR2(20)
);
SELECT * FROM MEMBER ;

 DROP TABLE MEMBER;

-- ��������.NEXTVAL : ���� ������ ���� �������� ��.
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ3','��¥����');

INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ1','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ2','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ3','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ4','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ5','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ6','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ7','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ8','��¥����');
INSERT INTO MEMBER VALUES (MY_SEQ.NEXTVAL,'��ȯ9','��¥����');

-- ���� �������� Ȯ��
SELECT MY_SEQ.CURRVAL FROM MEMBER;

SELECT* FROM MEMBER;

-- DUAL : DATABASE ��ü ������ ���� ���̺�

-- ��(VIEW) : ������ ���̺�(�б� ���� ���̺�)
  --> ������ ���� ���̺����� �˻��ϸ� �˻��ӵ��� ������ ��������.
  --> ����, ����, ������ ���� : �Ұ����ϴ�. 
-- �������� ������ȣ, FIRST_NAME, �ش� ������ �ٹ��ϴ� �μ����� ����ϱ�

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

-- �� �����ϴ� ���
DROP VIEW V_EMP_D;

-- �������� : ���������� �ȿ��� ���ư��� �� �ٸ� ������
-- FIRST_NAME �� 'Shelley'�� ������ �޿����� �� ���� ������ �޿��� �޴� �������� 
-- FIRST_NAME, SALARY�� ��½��� �ּ���.

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
 
 --'IT'�μ����� �ٹ��ϴ� �������� FIRST_NAME�� SALARY ����ϱ�
 
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