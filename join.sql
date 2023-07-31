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
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami