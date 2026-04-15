-- 코드를 작성해주세요       
-- 대장균 개체의 ID,   부모 개체의 ID,    개체의 크기,         분화되어 나온 날짜,        개체의 형질
-- ID,               PARENT_ID,       SIZE_OF_COLONY,    DIFFERENTIATION_DATE,   GENOTYPE
SELECT A.ID 
     # , A.PARENT_ID
     # , B.ID AS '부모ID'
     # , B.PARENT_ID
     # , C.ID AS '조부모ID'
     # , C.PARENT_ID
  FROM ECOLI_DATA A
  JOIN ECOLI_DATA B
    ON A.PARENT_ID = B.ID
  JOIN ECOLI_DATA C
    ON B.PARENT_ID = C.ID
 WHERE C.ID IS NOT NULL
   AND C.PARENT_ID IS NULL
 ORDER BY A.ID ASC;