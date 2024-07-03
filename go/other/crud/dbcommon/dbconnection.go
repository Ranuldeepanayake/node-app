package dbcommon

import (
	"database/sql"

	_ "github.com/go-sql-driver/mysql"
)

func DbConn() (db *sql.DB) {
	dbDriver := "mysql"
	dbHost := "rds-1.cri4y6giwp01.ap-southeast-1.rds.amazonaws.com"
	dbPort := "3306"
	dbUser := "sep"
	dbPass := "RHFkwLSa62uXb7vQ"
	dbName := "sep"

	db, err := sql.Open(dbDriver, dbUser+":"+dbPass+"@tcp("+dbHost+":"+dbPort+")/"+dbName)

	if err != nil {
		panic(err.Error())
	}
	return db
}
