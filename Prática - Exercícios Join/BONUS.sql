SELECT schools.id, schools.name AS school, courses.name AS course, companies.name AS company, roles.name AS role FROM applicants 
JOIN jobs ON applicants."jobId"= jobs.id 
JOIN roles ON jobs."roleId"= roles.id 
JOIN companies ON jobs."companyId"= companies.id 
JOIN users ON applicants."userId" = users.id 
JOIN educations ON users.id= educations."userId" 
JOIN courses ON educations."courseId"= courses.id 
JOIN schools ON educations."schoolId" = schools.id 
WHERE roles.name='Software Engineer' AND jobs."companyId"=10 AND jobs.active = 't';
