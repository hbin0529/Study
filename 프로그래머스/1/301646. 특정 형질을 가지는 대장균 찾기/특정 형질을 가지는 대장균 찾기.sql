-- 코드를 작성해주세요
-- ID,              PARENT_ID,      SIZE_OF_COLONY, DIFFERENTIATION_DATE, GENOTYPE
-- 대장균 개체의 ID, 부모 개체의 ID    , 개체의 크기,       분화되어 나온 날짜  , 개체의 형질
# 0
# 1
# 10
# 11
# 101
# 110
# 111
# 1000
SELECT COUNT(*) AS COUNT
  FROM ECOLI_DATA
 WHERE (GENOTYPE & 2) = 0
   AND (GENOTYPE & 5) != 0;