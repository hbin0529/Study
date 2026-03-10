-- FIRST_HALF
-- SHIPMENT_ID, FLAVOR,     TOTAL_ORDER
-- 출하 번호,     아이스크림 맛, 상반기 아이스크림 총주문량

-- ICECREAM_INFO
-- FLAVOR(PK),      INGREDITENT_TYPE 
-- 아이스크림의 맛, 아이스크림의 성분
/*
상반기 동안 각 아이스크림 성분 타입과 성분 타입에 대한 
아이스크림의 총주문량을 총주문량이 작은 순서대로 조회하는 SQL 문을 작성해주세요. 
이때 총주문량을 나타내는 컬럼명은 TOTAL_ORDER로 지정해주세요.
*/
SELECT I.INGREDIENT_TYPE
     , SUM(F.TOTAL_ORDER) AS TOTAL_ORDER
  FROM ICECREAM_INFO I
INNER JOIN FIRST_HALF F
        ON I.FLAVOR = F.FLAVOR
GROUP BY I.INGREDIENT_TYPE
ORDER BY TOTAL_ORDER ASC





