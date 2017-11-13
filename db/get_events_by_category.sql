SELECT * from Events
WHERE category ILIKE %$1%
LIMIT 10;