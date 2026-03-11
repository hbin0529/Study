-- ANIMAL_OUTS
/*
문제: 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
이때 결과는 시간대 순으로 정렬해야 합니다.
*/

-- (SELECT LEVEL -1 AS HOUR
--   FROM DUAL
-- CONNECT BY LEVEL <= 24) T
  
-- SELECT TO_NUMBER(TO_CHAR(DATETIME, 'HH24')) AS HOUR
--      , COUNT(ANIMAL_ID) AS COUNT
--   FROM ANIMAL_OUTS
-- GROUP BY TO_CHAR(DATETIME, 'HH24')
-- ORDER BY 1

SELECT T.HOUR
     , NVL(S.COUNT, 0) AS COUNT
  FROM (SELECT LEVEL -1 AS HOUR
          FROM DUAL
        CONNECT BY LEVEL <= 24
       ) T
LEFT JOIN (
           SELECT TO_NUMBER(TO_CHAR(DATETIME, 'HH24')) AS HOUR
                , COUNT(ANIMAL_ID) AS COUNT
             FROM ANIMAL_OUTS
           GROUP BY TO_NUMBER(TO_CHAR(DATETIME, 'HH24'))
          ) S
ON T.HOUR = S.HOUR
ORDER BY T.HOUR