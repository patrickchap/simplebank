-- name: Createtransfers :one
INSERT INTO transfers (
  from_account_id,
  to_account_id,
  amount 
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetTransfter :one
SELECT * FROM transfers
WHERE id = $1 LIMIT 1;

-- name: ListTransfters :many
SELECT * FROM transfers
ORDER BY id 
LIMIT $1
OFFSET $2;

-- name: DeleteTransfter :exec
DELETE FROM transfers
WHERE id = $1;
