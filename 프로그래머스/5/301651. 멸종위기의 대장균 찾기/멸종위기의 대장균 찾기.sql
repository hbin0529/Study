-- 코드를 작성해주세요
-- ID,              PARENT_ID,      SIZE_OF_COLONY,     DIFFERENTIATION_DATE,   GENOTYPE
-- 대장균 개체의 ID, 부모 개체의 ID,    개체의 크기,         분화되어 나온 날짜,        개체의 형질

-- 1세대
# SELECT ID
#      , PARENT_ID
#      ,  AS GENERATION
#   FROM ECOLI_DATA
#  WHERE PARENT_ID IS NULL;

WITH RECURSIVE ECOLI_TREE AS (
    -- 앵커 멤버: 부모ID 없는 세대
    SELECT ID
         , PARENT_ID 
         , 1 AS GENERATION
      FROM ECOLI_DATA
     WHERE PARENT_ID IS NULL
    
     UNION ALL
    
    -- 재귀 멤버: 이전 결과의 하위 세대 찾기 (자식세대 = 부모 세대 + 1)
    SELECT E.ID
         , E.PARENT_ID
         , ET.GENERATION + 1
      FROM ECOLI_DATA E
      JOIN ECOLI_TREE ET
        ON E.PARENT_ID = ET.ID
)
SELECT COUNT(T.ID) AS COUNT
     # , T.PARENT_ID
     , T.GENERATION
  FROM ECOLI_TREE T
  LEFT JOIN ECOLI_DATA C
         ON C.PARENT_ID = T.ID
 WHERE C.ID IS NULL
 GROUP BY T.GENERATION
 ORDER BY T.GENERATION;

# ------------------ 1, 3, 5, 7, 8 자식이 없음
