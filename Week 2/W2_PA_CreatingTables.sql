-- Name: Kenneth Irving

/* Q1 */
-- Create a new copy of the table structure
CREATE TABLE sec0607_employees AS 
SELECT * FROM l_employees 
WHERE 1 = 0;

-- Copy all the data into the new table
INSERT INTO sec0607_employees 
SELECT * FROM l_employees;

/* Q2 */
ALTER TABLE sec0609_employees 
ADD CONSTRAINT pk_sec0609_emp PRIMARY KEY (employee_id);

/* Q3 */
ALTER TABLE sec0611_departments 
ADD (
    manager_name VARCHAR2(100), 
    annual_budget NUMBER(12, 2)
);

/* Q4 */
ALTER TABLE sec0612_employees 
MODIFY last_name VARCHAR2(50);

/* Q5 */
ALTER TABLE sec0613_employees 
DROP COLUMN phone_number;

/* Q6 */
-- Create a temporary table with only the unique rows
CREATE TABLE temp_unique_rows AS 
SELECT DISTINCT * FROM sec0616_duplicate_rows;

-- Delete all data from the original table
DELETE FROM sec0616_duplicate_rows;

-- Insert the new unique rows back into the original table
INSERT INTO sec0616_duplicate_rows 
SELECT * FROM temp_unique_rows;

-- Clean up by dropping the temp table
DROP TABLE temp_unique_rows;

/* Q7 */
-- Add a new column to hold the assigned numbers
ALTER TABLE sec0617_duplicate_rows
ADD row_number NUMBER;

-- Update the table to assign a number to each row in order
UPDATE sec0617_duplicate_rows 
SET row_number = ROWNUM;