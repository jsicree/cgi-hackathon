-- import members.csv into member
-- import skill_categories.csv into skill_category
-- import skills.csv into skill_tmp
-- insert into skill using skill_tmp

-- insert into skill from skill_tmp and skill_category
INSERT INTO hackathon.skill (name, version, description, skill_category_id)
SELECT x.name, x.version, x.description, y.id
FROM skill_tmp x, skill_category y
WHERE x.skill_category = y.name;

-- Delete  and drop the tmp table
-- DELETE from skill_tmp;
-- DROP TABLE `hackathon`.`skill_record`;

-- insert 2 skill records
INSERT INTO hackathon.skill_record (skill_id, member_id, max_proficiency, current_proficiency,last_used, currently_using,last_updated)
VALUES (
(SELECT sk.id from hackathon.skill sk where sk.name = 'Java' AND sk.version = '8'),
(SELECT m.id from hackathon.member m where m.member_identifier = 'CM377759'),
'EXPERT', 'INTERMEDIATE', sysdate(), 'Y', sysdate());

INSERT INTO hackathon.skill_record (skill_id, member_id, max_proficiency, current_proficiency, last_used, currently_using, last_updated)
VALUES (
(SELECT sk.id from hackathon.skill sk where sk.name = 'Java' AND sk.version = '8'),
(SELECT m.id from hackathon.member m where m.member_identifier = 'CM106533'),
'EXPERT', 'EXPERT', sysdate(), 'Y', sysdate());

-- To delete all data
-- DELETE FROM skill_record;
-- DELETE FROM skill;
-- DELETE FROM skill_category;
-- DELETE FROM member;

