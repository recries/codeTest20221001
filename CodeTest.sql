
--있었는데요 없었습니다
SELECT a.ANIMAL_ID, a.name
FROM ANIMAL_INS a, ANIMAL_OUTS B
WHERE  a.animal_id = b.animal_id AND a.DATETIME > b.DATETIME
Order BY a.DATETIME;
--오랜 기간 보호한 동물(1)

SELECT NAME, DATETIME 
FROM (SELECT A.NAME, A.DATETIME
      FROM ANIMAL_INS A, ANIMAL_OUTS B
      WHERE A.ANIMAL_ID = B.ANIMAL_ID(+)
      AND  B.ANIMAL_ID IS NULL
      ORDER BY A.DATETIME)
WHERE ROWNUM <=3

--보호소에서 중성화한 동물
SELECT a.animal_id, a.animal_type, a.name
FROM ANIMAL_INS a, ANIMAL_OUTS b
WHERE a.animal_id = b.animal_id AND a.sex_upon_intake != b.sex_upon_outcome;

--루시와 엘라 찾기

SELECT animal_id, name, sex_upon_intake
FROM ANIMAL_INS
WHERE name = 'Lucy' or name ='Ella' or name = 'Pickle' or name = 'Rogan'
or name= 'Sabrina' or name = 'Mitty'
ORDER BY animal_id

--이름에 el이 들어가는 동물 찾기

SELECT animal_id, name
FROM ANIMAL_INS
WHERE LOWER(name) LIKE '%el%' AND animal_type = 'Dog'
ORDER BY name

--중성화 여부 파악하기

SELECT animal_id, name, 
            case when sex_upon_intake LIKE 'Neutered%' then 'O'
            when sex_upon_intake LIKE 'Spayed%' then 'O'
            else 'X' end as 중성화
FROM ANIMAL_INS
ORDER BY animal_id

--오랜 기간 보호한 동물(2)

SELECT animal_id, name
FROM (SELECT a.animal_id, a.name
      FROM ANIMAL_INS a, ANIMAL_OUTS b
      WHERE a.animal_id = b.animal_id 
      ORDER BY a.datetime - b.datetime)
WHERE ROWNUM <= 2

--DATETIME에서 DATE로 형 변환

SELECT animal_id, name, TO_CHAR(datetime,'YYYY-MM-DD') as 날짜
FROM ANIMAL_INS
ORDER BY animal_id