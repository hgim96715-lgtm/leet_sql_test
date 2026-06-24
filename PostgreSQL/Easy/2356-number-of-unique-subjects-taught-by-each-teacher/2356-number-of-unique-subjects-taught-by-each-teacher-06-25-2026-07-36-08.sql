-- Write your PostgreSQL query statement below
-- SELECT t1.teacher_id
-- FROM Teacher t1
-- JOIN Teacher t2 ON t1.subject_id=t2.dept_id
-- OR t1.teacher_id=t2.subject_id
-- GROUP BY t1.teacher_id

SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id