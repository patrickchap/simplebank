package db

import (
	"context"
)

type Querier interface {
	GetEntries(ctx context.Context, id int64) (Entry, error)
	GetTransfter(ctx context.Context, id int64) (Transfer, error)
}

var _ Querier = (*Queries)(nil)
