package db

import (
	"context"
	"fmt"
	"os"
	"testing"
	"github.com/jackc/pgx/v5/pgxpool"
)

const (
	dbDriver = "postgress"
	dbSource = "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"
)

var testQueries *Queries

var testConn *pgxpool.Pool

func TestMain(m * testing.M){
	var err error
	testConn, err = pgxpool.New(context.Background(), dbSource)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Unable to connect to database: %v\n", err)
		os.Exit(1)
	}

	testQueries = New(testConn)
	os.Exit(m.Run())
}
