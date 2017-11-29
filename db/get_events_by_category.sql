SELECT * from Events
WHERE category = $1
LIMIT 10;