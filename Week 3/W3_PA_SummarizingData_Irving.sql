-- Name: Kenneth Irving
/* Q1 */
SELECT 
    MIN(num_1) AS "minimum", 
    MAX(num_1) AS "maximum"
FROM sec1103;

/* Q2 */
SELECT  MIN(num_1) AS "minimum",
        MAX(num_1) AS "maximum"
FROM sec1103
WHERE row_ID < 8;

/* Q3 */
SELECT 
    COUNT(*) AS total_rows,
    COUNT(Num_1) AS non_null_num1_rows,
    COUNT(*) - COUNT(Num_1) AS null_num1_rows
FROM sec1106;

/* Q4 */
SELECT COUNT(DISTINCT (num_1 || '*' || num_2)) AS distinct_combinations
FROM sec1103;

/* Q5 */
-- Add each row
SELECT SUM(num_1 + num_2) AS rows_added_first
FROM sec1103;

-- Add each column
SELECT SUM(num_1) + SUM(num_2) AS columns_added_first
FROM sec1103;

-- Change all nulls to 0
SELECT SUM(NVL(num_1, 0) + NVL(num_2, 0)) AS nulls_changed_to_zeros
FROM sec1103;

/* Q6 */
SELECT 
    col_1, 
    SUM(col_3) AS sum_col_3
FROM sec1202
GROUP BY col_1;

/* Q7 */
SELECT 
    col_1, 
    col_2, 
    SUM(col_3) AS sum_col_3
FROM sec1202
GROUP BY col_1, col_2;

/* Q8 */
SELECT row_id, col_1, col_2, col_3
FROM sec1202
UNION ALL
SELECT NULL, NULL, NULL, SUM(col_3)
FROM sec1202;

/* Q9 */
SELECT 
    col_1, 
    SUM(col_2) AS total_col_2
FROM sec1211
GROUP BY col_1
HAVING SUM(col_2) > 20;