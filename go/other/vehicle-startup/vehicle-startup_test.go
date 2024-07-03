package vehicle_startup

import (
	"testing"
)

type inputs struct {
	arg1   bool
	arg2   bool
	output bool
}

var TestInputs = []inputs{
	inputs{false, false, false},
	inputs{false, true, false},
	inputs{true, false, false},
	inputs{true, true, true},
}

func TestVehicleStartAllInputs(t *testing.T) {
	//name := "Tests the start function with all inputs present"
	want := true
	got := vehicleStart(true, true)
	if got != true {
		t.Fatalf(`vehicleStart(true, true) = %v, want %v`, got, want)
	}
}

/*
Table driven tests. Used with a matrix of inputs and outputs.
*/
func TestVehicleStartAllInputsAuto(t *testing.T) {
	for _, test := range TestInputs {
		if output := vehicleStart(test.arg1, test.arg2); output != test.output {
			t.Errorf(`vehicleStart(%v, %v) = %v ; Output %v not equal to expected %v`, test.arg1, test.arg2, output, output, test.output)
		}
	}
}
