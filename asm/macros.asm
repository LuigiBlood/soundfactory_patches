//Macros

//Seek LoROM Address
macro seekAddr(n) {
	origin (({n} & $7F0000) >> 1) | ({n} & $7FFF)
	base {n}
}

//Based on origin
macro bound_check(n) {
	if origin() > {n} {
		error "ERROR, OVERWRITING ANOTHER FILE"
	}
}

//Based on SNES address
macro size_check(b, n) {
	if pc() > ({b} + {n}) {
		error "ERROR, OVERSIZED"
	}
}
