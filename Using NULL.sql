SELECT name
FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id)


SELECT teacher.name, dept.name 
FROM teacher LEFT JOIN dept ON teacher.dept= dept.id;

SELECT teacher.name, dept .name
FROM teacher RIGHT JOIN dept ON teacher.dept= dept.id;

SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON dept.id = dept;

SELECT COUNT(name), COUNT(mobile) FROM teacher;

SELECT dept.name, COUNT(dept)
FROM teacher RIGHT JOIN dept ON dept = dept.id 
GROUP BY dept.name, dept

SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' ELSE 'Art' END
FROM teacher;

SELECT name, CASE WHEN dept IN (1,2) THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END
FROM teacher;

/* Quiz */

SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

/*
Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
display 0 in result column for all teachers without department
*/

SELECT name,
CASE WHEN phone = 2752 THEN 'two'
WHEN phone = 2753 THEN 'three'
WHEN phone = 2754 THEN 'four'
END AS digit
FROM teacher /*'four' for Throd*/

SELECT name, 
CASE 
WHEN dept 
IN (1) 
THEN 'Computing' 
ELSE 'Other' 
END 
FROM teacher