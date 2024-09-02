/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for data analyst positions.
- Focuses on roles with specified salaries, regardless of location.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary_for_skill
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL 
GROUP BY 
    skills
/*
-- skills that are realted with less then 5 postions can be discarded
HAVING
    COUNT(job_postings_fact.job_id) > 5
*/
ORDER BY 
    avg_salary_for_skill DESC
LIMIT 25