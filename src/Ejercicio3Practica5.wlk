//------Vehiculos------

class Corsa {
	const property color = "Rojo"
	
	method capacidad() {
		return 4
	}
	
	method velocidadMax() {
		return 150
	}
	
	method peso() {
		return 1300
	}
}

class Standart {
	const property tieneTanqueExtra = true
	
	method capacidad() {
		return 4 - if(tieneTanqueExtra){1} else{0}
	}
	
	method velocidadMax() {
		return 110 + if(tieneTanqueExtra){10} else{0}
	}
	
	method peso() {
		return 1200 + if(tieneTanqueExtra){150} else{0}
	}
	
	method color() {
		return "Azul"
	}
}

object trafic {
	var interior = comodo
	var motor = pulenta
	
	method cambiarInterior(nuevoInterior) {
		interior = nuevoInterior
	}
	method cambiarMotor(nuevoMotor) {
		motor = nuevoMotor
	}
	
	method capacidad() {
		return interior.capacidad()
	}
	
	method velocidadMax() {
		return motor.velocidadMax()
	}
	
	method peso() {
		return 4000 + interior.peso() + motor.peso()
	}
	
	method color() {
		return "Blanco"
	}
}

///------Interiores trafic------

object comodo {
	method capacidad() = 5
	method peso() = 700
}

object popular {
	method capacidad() = 12
	method peso() = 1000
}

///------Motores trafic------

object pulenta {
	method velocidadMax() = 130
	method peso() = 800
}

object bataton {
	method velocidadMax() = 80
	method peso() = 500
}
///

class Distinto {
	const property capacidad = 4
	const property velocidadMax = 120
	const property peso = 1500
	const property color = "Blanco"
}

//----------------------------------------------------------------------------------------

class Remiseria {
	var flota = []
	
	method agregarAFlota(vehiculo) {
		flota.add(vehiculo)
	}
	
	method quitarDeFlora(vehiculo) {
		flota.remove(vehiculo)
	}
	
	method pesoTotalFlota() {
		return flota.sum({vehiculo => vehiculo.peso()})
	}
	
	method esRecomendable() {
		return flota.size() >= 3 and flota.all({vehiculo => vehiculo.velocidadMax() >= 100})
	}
	
	method capacidadTotalYendoA(velocidad) {
		return self.vehiculosQueVanA(velocidad).sum({vehiculo => vehiculo.capacidad()})
	}
	method vehiculosQueVanA(velocidad) {
		return flota.filter({vehiculo => vehiculo.velocidadMax() >= velocidad})
	}
	
	method colorDelAutoMasRapido() {
		return flota.max({vehiculo => vehiculo.velocidadMax()}).color()
	}
}