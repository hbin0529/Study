-- ONLINE_SALE 
-- ONLINE_SALE_ID    , USER_ID,  PRODUCT_ID, SALES_AMOUNT, SALES_DATE
-- 온라인 상품 판매 ID  , 회원 ID,   상품 ID    ,    판매량       , 판매일

-- OFFLINE_SALE 
-- OFFLINE_SALE_ID   , PRODUCT_ID, SALES_AMOUNT, SALES_DATE
-- 오프라인 상품 판매 ID, 상품 ID    ,    판매량       , 판매일

-- 문제: 동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.
/*
ONLINE_SALE 테이블과 OFFLINE_SALE 테이블에서 
2022년 3월의 오프라인/온라인 상품 판매 데이터의 판매 날짜, 상품ID, 유저ID, 판매량을 출력하는 SQL문을 작성해주세요. 
OFFLINE_SALE 테이블의 판매 데이터의 USER_ID 값은 NULL 로 표시해주세요. 
결과는 판매일을 기준으로 오름차순 정렬
판매일이 같다면 상품 ID를 기준으로 오름차순, 
상품ID까지 같다면 유저 ID를 기준으로 오름차순 정렬해주세요.
*/

SELECT TO_CHAR(SALES_DATE, 'YYYY-MM-DD') AS SALES_DATE
     , PRODUCT_ID
     , USER_ID
     , SALES_AMOUNT
FROM ONLINE_SALE
WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') = '2022-03'

UNION

SELECT TO_CHAR(SALES_DATE, 'YYYY-MM-DD') AS SALES_DATE
     , PRODUCT_ID
     , NULL AS USER_ID
     , SALES_AMOUNT
FROM OFFLINE_SALE
WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') = '2022-03'