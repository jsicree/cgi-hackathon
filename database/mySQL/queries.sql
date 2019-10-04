-- Select all members sorted by last name, first name
SELECT m.id, m.last_name, m.first_name, m.member_identifier, m.email FROM hackathon.member m
ORDER BY m.last_name, m.first_name ASC;

-- Select all skill categories sorted by name
SELECT sc.id, sc.name, sc.description from hackathon.skill_category sc 
ORDER BY sc.name ASC;

-- Select all skills sorted by category and name
SELECT s.id, s.name, s.version, s.description, sc.name as skill_category 
from hackathon.skill s, hackathon.skill_category sc
WHERE s.skill_category_id = sc.id
ORDER BY sc.name ASC, s.name ASC;

-- Select members with expert or intermediate Java 8 experience
SELECT m.member_identifier, m.first_name, m.last_name, 
sk.name, sk.version, sr.current_proficiency, sr.currently_using, sr.last_updated 
FROM hackathon.skill_record sr, hackathon.skill sk, hackathon.member m
where sr.skill_id = sk.id
AND sr.member_id = m.id
AND sk.name = 'Java'
AND sk.version = '8'
AND (sr.current_proficiency = 'EXPERT' OR sr.current_proficiency = 'INTERMEDIATE');





