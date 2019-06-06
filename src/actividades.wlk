import socios.*

class Viaje {
	var property idiomas = [ ]
	
	method esInteresante() { return idiomas.size() >= 2 }
	
	method esRecomendada(socio) { 
		return self.esInteresante() and socio.leAtrae(self) and not socio.realizoActividad(self)
	}
}

class ViajeDePlaya inherits Viaje {
	var property largo = 0
	
	method diasQueLleva() { return largo / 500 }
	
	method implicaEsfuerzo() { return largo > 1200 }
	
	method sirveParaBroncearse() { return true }
}

class ExcursionCiudad inherits Viaje {
	var property cantidadDeAtracciones = 0
	
	method diasQueLleva() { return cantidadDeAtracciones.div(2) }
	
	method implicaEsfuerzo() { return cantidadDeAtracciones.between(5, 8) }
	
	method sirveParaBroncearse() { return false }
	
	override method esInteresante() { return super() or cantidadDeAtracciones == 5 }
}

class ExcursionCiudadTropical inherits ExcursionCiudad {
	override method diasQueLleva() { return super() + 1 }
	
	override method sirveParaBroncearse() { return true }
}

class SalidaTrekking inherits Viaje {
	var property kilometrosDeSenderos = 0
	var property diasDeSol = 0
	
	method diasQueLleva() { return kilometrosDeSenderos / 50 }
	
	method implicaEsfuerzo() { return kilometrosDeSenderos > 80 }
	
	method sirveParaBoncearse() { 
		return diasDeSol > 200 or (diasDeSol. between(100, 200) and kilometrosDeSenderos > 120)
	}
	
	override method esInteresante() { return super() and diasDeSol > 140 }
}

class ClaseGimnasia {
	
	method idiomas() { return ["español"] }
	
	method diasQueLleva() { return 1 }
	
	method implicaEsfuerzo() { return true }
	
	method sirveParaBroncearse() { return false }
	
	method esRecomendada(socio) { return socio.edad().between(20, 30) }
}

class TallerLiterario {
	var property librosQueTrabaja = [ ]
	
	method idiomasUsados() { return librosQueTrabaja.map({libro => libro.idioma()}) }
	
	method diasQueLleva() { return librosQueTrabaja.size() + 1 }
	
	method implicaEsfuerzo() { 
		return librosQueTrabaja.any({libro => libro.paginas() >= 500}) 
			or librosQueTrabaja.all({libro => self.hayUnSoloAutor(libro.nombreautor())})//.size() == 1
			and librosQueTrabaja.size() > 1
	}
	
	method hayUnSoloAutor(nombre) { 
		return librosQueTrabaja.all({libro => libro.autor() == nombre})
	}
	
	method sirveParaBroncearse() { return false }
	
	method esRecomendado(socio) { return socio.idiomasQueHabla().size() > 1 }
}

class Libro{
	const property idioma 
	const property paginas
	const property nombreAutor
}

