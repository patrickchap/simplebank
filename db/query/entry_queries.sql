
/* CREATE TABLE entries (
  id BIGSERIAL PRIMARY KEY,
  account_id bigint NOT NULL,
  amount bigint NOT NULL,
  created_at timestamptz NOT NULL DEFAULT 'now()'
) */


-- name: CreateEntries :one
INSERT INTO entries (
  account_id,
  amount 
) VALUES (
  $1, $2
)
RETURNING *;

-- name: GetEntries :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;

-- name: ListEntriess :many
SELECT * FROM entries
ORDER BY id 
LIMIT $1
OFFSET $2;

-- name: DeleteEntries :exec
DELETE FROM entries
WHERE id = $1;
