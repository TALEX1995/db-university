-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT  `S`.`name` AS `student_name` , `S`.`surname` AS `student_surname` , `D`.`name` AS `degree_name`
FROM `students` AS S
JOIN `degrees`AS D
ON `S`.`degree_id` = `D`.`id`
WHERE `D`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `DEG`.`name` AS `degree`, `DEP`.`name` AS `department_name`
FROM `degrees` AS DEG
JOIN `departments` AS DEP
ON `DEG`.`department_id` = `DEP`.`id`
WHERE `DEP`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `T`.`name` AS `teacher_name` , `T`.`surname` AS `teacher_surname` , `C`.`name` AS `course_name`
FROM `courses` AS C
JOIN `course_teacher` AS CT
ON `C`.`id` = `CT`.`course_id`
JOIN `teachers` AS T
ON `T`.`id` = `CT`.`teacher_id`
WHERE `T`.`name` = 'Fulvio'
AND `T`.`surname` = 'Amato';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `S`.`name` AS `student_name` ,  `S`.`surname` AS `student_surname`, `DEG`.`name` AS `degree_name`, `DEP`.`name` AS `department_name`
FROM `students` AS S
JOIN `degrees` AS DEG
ON `S`.`degree_id` = `DEG`.`id`
JOIN `departments` AS DEP
ON `DEG`.`department_id` = `DEP`.`id`
ORDER BY `S`.`name`, `S`.`surname`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `D`.`name` AS `degree_name`, `C`.`name` AS `course_name` , `T`.`name` AS `teacher_name` , `T`.`surname` AS `teacher_surname`
FROM `degrees` AS D
JOIN `courses` AS C
ON `D`.`id` = `C`.`degree_id`
JOIN `course_teacher` AS CT
ON `C`.`id` = `CT`.`course_id`
JOIN `teachers` AS T
ON `T`.`id` = `CT`.`teacher_id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `T`.`name` AS `teacher_name` , `T`.`surname` AS `teacher_surname`, `DEP`.`name` AS `department_name`
FROM `teachers` AS T
JOIN `course_teacher` AS CT
ON `T`.`id` = `CT`.`teacher_id`
JOIN `courses` AS C
ON `C`.`id` = `CT`.`course_id`
JOIN `degrees` AS DEG
ON `DEG`.`id` = `C`.`degree_id`
JOIN `departments` AS DEP
ON `DEP`.`id` = `DEG`.`department_id`
WHERE `DEP`.`name` = 'Dipartimento di Matematica'
ORDER BY `T`.`name`;

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `S`.`name` AS `student_name` ,  `S`.`surname` AS `student_surname` , `C`.`name` AS `course_name`, COUNT(`E`.`id`) AS `number_attempts`
FROM `students` AS S
JOIN `exam_student` AS ES
ON `S`.`id` = `ES`.`student_id`
JOIN `exams` AS E
ON `E`.`id` = `ES`.`exam_id`
JOIN `courses` AS C
ON `C`.`id` = `E`.`course_id`
GROUP BY `S`.`id`, `C`.`id`;