INSERT INTO users (auth_id, email, picture, firstname, lastname)
VALUES ($1, $2, $3, $4, $5)
RETURNING *;