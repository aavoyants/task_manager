Task Manager
============

1) get all statuses, not repeating, alphabetically ordered:
<pre>SELECT DISTINCT
  is_done
FROM
  tasks
ORDER BY
  is_done</pre>

2) get the count of all tasks in each project, order by tasks count descending:
<pre>SELECT
  project_id,
  COUNT(id)
FROM
  tasks
GROUP BY
  project_id
ORDER BY
  COUNT(id) DESC</pre>

3) get the count of all tasks in each project, order by projects names:
<pre>SELECT
  projects.name,
  COUNT(tasks.id)
FROM
  tasks
INNER JOIN
  projects on projects.id = tasks.project_id
GROUP BY
  projects.name, tasks.project_id
ORDER BY
  projects.name</pre>

4) get the tasks for all projects having the name beginning with "N" letter:
<pre>SELECT
  name
FROM
  tasks
WHERE
  name LIKE "N%"</pre>

5) get the list of all projects containing the "a" letter in the middle of the name, and show the
tasks count near each project. Mention that there can exist projects without tasks and
tasks with project_id=NULL:
<pre>‬SELECT
  projects.name,
  COUNT(tasks.id)
FROM
  projects
LEFT JOIN
  tasks on tasks.project_id = projects.id
WHERE
  projects.name LIKE "_%a%_"
GROUP BY
  projects.name</pre>

* if we don't want to get projects without tasks we should replace "LEFT JOIN" with "INNER JOIN"
tasks without projects we don't have to get anyway

6) get the list of tasks with duplicate names. Order alphabetically:
<pre>SELECT
  name
FROM
  tasks
GROUP BY
  name
HAVING
  COUNT(id) > 1
ORDER BY
  name</pre>

7) get the list of tasks having several exact matches of both name and status, from the
project "Garage". Order by matches count:
<pre>SELECT
  tasks.name,
  tasks.is_done,  -- added for debug purpose
  COUNT(tasks.id)  -- added for debug purpose
FROM
  tasks
LEFT JOIN
  projects on projects.id = tasks.project_id
WHERE
  projects.name LIKE "%Garage%"
GROUP BY
  tasks.name, tasks.is_done
HAVING
  COUNT(tasks.id) > 1
ORDER BY
  COUNT(tasks.id)</pre>

* in current application we can only add tasks with unique name (within the project).

8) get the list of project names having more than 10 tasks in status "completed". Order by project_id:
<pre>SELECT
  projects.name,
  tasks.project_id  -- added for debug purpose
FROM
  projects
INNER JOIN
  tasks on tasks.project_id = projects.id
WHERE
  tasks.is_done = 1
GROUP BY
  projects.name
HAVING
  COUNT(tasks.id) > 10
ORDER BY
  tasks.project_id</pre>
