package supplier

import (
	_ "github.com/go-sql-driver/mysql"
	"local.com/ranul/dbcommon"
)

type Supplier struct {
	supplierId       int
	nmraRegistration string
}

func ShowSupplier(suplierId int) Supplier {

	connection := dbcommon.DbConn()
	result, err := connection.Query("SELECT * FROM supplier WHERE supplier_id=?",
		suplierId)

	if err != nil {
		panic(err.Error())
	}

	supplier := Supplier{}
	for result.Next() {
		var supplierId int
		var nmraRegistration, a, b, c string
		err = result.Scan(&supplierId, &nmraRegistration, &a, &b, &c)

		if err != nil {
			panic(err.Error())
		}

		supplier.supplierId = supplierId
		supplier.nmraRegistration = nmraRegistration
	}

	defer connection.Close()

	return supplier
}
