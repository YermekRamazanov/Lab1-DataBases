-1st exercise 
-a)
SELECT course_id,title
FROM course
WHERE credits>3;

-b)
SELECT building,room_number
FROM classroom
WHERE building='Watson' OR building='Packard';

-c)
SELECT course_id,title
FROM course
WHERE dept_name='Comp. Sci.';

-d)
SELECT course.course_id,course.title
FROM course,section
WHERE course.course_id=section.course_id AND section.semester='Fall';

-e)
SELECT id,name
FROM student
WHERE tot_cred BETWEEN 45 AND 90;

-f)
SELECT id,name
FROM student
WHERE name LIKE '%a' OR
      name LIKE '%e' OR
      name LIKE '%i' OR
      name LIKE '%o' OR
      name LIKE '%u' OR
      name LIKE '%y';

-g)
SELECT course.course_id,course.title
FROM course,prereq
WHERE course.course_id=prereq.course_id AND prereq_id='CS-101';


-2nd exercise
-a)
SELECT dept_name,avg(salary) AS average_salary_of_department
FROM instructor
GROUP BY dept_name
ORDER BY average_salary_of_department;

-b)
SELECT building,count(building)
FROM section
GROUP BY building
LIMIT 1;

-c)
SELECT department.dept_name,count(course.dept_name)
FROM department,course
WHERE department.dept_name=course.dept_name
GROUP BY department.dept_name
HAVING count(course.dept_name)=1;

-d)
SELECT student.id,student.name,count(student.name)
FROM student,takes
WHERE student.id=takes.id AND student.dept_name='Comp. Sci.'
GROUP BY student.id,student.name
HAVING count(student.name)>=3;

-e)
SELECT id,name
FROM instructor
WHERE dept_name='Biology' OR dept_name='Philosophy' OR dept_name='Music';

-f)
SELECT DISTINCT instructor.id,instructor.name
FROM instructor,teaches
WHERE instructor.id=teaches.id AND teaches.year='2018' AND instructor.id NOT IN
(SELECT instructor.id FROM instructor,teaches
WHERE instructor.id=teaches.id AND teaches.year='2017');


-3rd exercise
-a)
SELECT DISTINCT student.id,student.name
FROM takes,student
WHERE student.id=takes.id AND (takes.grade='A' OR takes.grade='A-') AND takes.course_id IN
(SELECT course_id FROM course WHERE course.dept_name='Comp. Sci.')
ORDER BY student.name;

-b)
SELECT DISTINCT advisor.i_id,instructor.name
FROM advisor,takes,instructor,student
WHERE instructor.id=advisor.i_id AND student.id=advisor.s_id AND takes.grade!='A' AND takes.grade!='A-' AND
      takes.grade!='B+' AND takes.grade!='B';

-c)
SELECT DISTINCT student.dept_name
FROM student,takes
WHERE student.id=takes.id AND student.dept_name NOT IN
(SELECT student.dept_name FROM student,takes
WHERE student.id=takes.id AND (takes.grade='F' OR takes.grade='C-' OR takes.grade='C' OR takes.grade='C+'));

-d)
SELECT instructor.id,instructor.name
FROM instructor,teaches
WHERE instructor.id=teaches.id AND instructor.id NOT IN
(SELECT teaches.id FROM teaches,takes WHERE takes.course_id=teaches.course_id AND takes.grade='A');

-e)
SELECT DISTINCT course.course_id,course.title
FROM course,time_slot,section
WHERE section.time_slot_id=time_slot.time_slot_id AND course.course_id=section.course_id AND course.course_id
NOT IN (SELECT section.course_id FROM time_slot,section
        WHERE time_slot.end_hr>13 AND section.time_slot_id=time_slot.time_slot_id);
