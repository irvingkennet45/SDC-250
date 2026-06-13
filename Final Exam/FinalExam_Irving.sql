-- Name: Kenneth Irving
/* Q1 */
SELECT  description, 
        course_no, 
        TO_CHAR(cost, '$9,999') AS formatted_cost
FROM course
WHERE cost < (SELECT AVG(cost) FROM course)
ORDER BY cost DESC;

/* Q2 */
SELECT  c.course_no, 
        c.description, 
        c.cost, 
        s.start_date_time
FROM course c
JOIN section s 
   ON c.course_no = s.course_no
ORDER BY c.course_no, c.description;

/* Q3 */
SELECT  z.zip, 
        COUNT(i.instructor_id) AS instructor_count
FROM zipcode z
JOIN instructor i 
  ON z.zip = i.zip
GROUP BY z.zip;

/* Q4 */
SELECT  s.student_id, 
        s.first_name, 
        s.last_name, 
        s.street_address, 
        z.state, 
        s.zip
FROM student s
JOIN zipcode z 
   ON s.zip = z.zip
WHERE z.city = 'Brooklyn'
ORDER BY    s.last_name, 
            s.first_name;

/* Q5 */
SELECT  i.first_name, 
        i.last_name, 
        COUNT(s.section_id) AS sections_taught
FROM instructor i
JOIN section s 
   ON i.instructor_id = s.instructor_id
GROUP BY    i.instructor_id, 
            i.first_name, 
            i.last_name
ORDER BY sections_taught DESC;

/* Q6 */
SELECT  first_name, 
        last_name, 
        street_address, 
        zip
FROM student
WHERE zip = (
    SELECT zip
    FROM instructor
    WHERE first_name = 'Tom' AND last_name = 'Wojick'
);

/* Q7 */
SELECT  student_id, 
        salutation, 
        first_name, 
        last_name
FROM student
WHERE registration_date < (
    SELECT registration_date
    FROM student
    WHERE first_name = 'Vera' AND last_name = 'Wetcel'
);

/* Q8 */
SELECT s.student_id
FROM student s
LEFT JOIN enrollment e 
   ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

/* Q9 */
CREATE VIEW all_people_view AS
SELECT  salutation, 
        first_name || ' ' || last_name AS full_name, 
        street_address, 
        zip, 
        phone
FROM student

UNION

SELECT  salutation, 
        first_name || ' ' || last_name AS full_name, 
        street_address, 
        zip, 
        phone
FROM instructor;

/* Q10 */
SELECT  s.first_name, 
        s.last_name, 
        s.student_id
FROM student s
JOIN enrollment e 
   ON s.student_id = e.student_id
WHERE e.final_grade = (
    SELECT MAX(final_grade) 
    FROM enrollment
);

/* Q11 */
SELECT  c.course_no, 
        c.description, 
        COUNT(s.section_id) AS number_of_sections
FROM course c
JOIN section s 
   ON c.course_no = s.course_no
GROUP BY    c.course_no, 
            c.description
HAVING COUNT(s.section_id) > 5;

/* Q12 */
SELECT  c.course_no, 
        c.description, c.cost, 
        p.course_no AS prereq_course_no, 
        p.description AS prereq_description
FROM course c
LEFT JOIN course p 
   ON c.prerequisite = p.course_no;

/* Q13 */
SELECT  c.course_no, 
        c.description, 
        COUNT(s.section_id) AS number_of_sections
FROM course c
JOIN section s ON c.course_no = s.course_no
GROUP BY    c.course_no, 
            c.description
HAVING COUNT(s.section_id) = (
    SELECT MAX(sec_count)
    FROM (
        SELECT COUNT(section_id) AS sec_count
        FROM section
        GROUP BY course_no
    )
);

/* Q14 */
SELECT  c.course_no, 
        c.description, 
        s.start_date_time, 
        s.capacity, 
        COUNT(e.student_id) AS current_enrolled
FROM course c
JOIN section s 
   ON c.course_no = s.course_no
JOIN enrollment e 
   ON s.section_id = e.section_id
GROUP BY    c.course_no, 
            c.description, 
            s.start_date_time, 
            s.capacity
HAVING COUNT(e.student_id) > s.capacity;