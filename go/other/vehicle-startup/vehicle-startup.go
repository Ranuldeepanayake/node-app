package vehicle_startup

func vehicleStart(ignitionSignal bool, starterSignal bool) bool {
	if ignitionSignal && starterSignal {
		return true
	} else {
		return false
	}
}
