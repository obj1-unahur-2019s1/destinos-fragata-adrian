import actividades.*

class Socio {
	var property actividadesRealizadas = [ ]
	const property maximoDeActividades = 0
	const property edad = 0
	const property idiomasQueHabla = [ ]
	
	method esAdoradorDelSol() { return actividadesRealizadas.all({actividad => actividad.sirveParaBroncearse()}) }
	
	method actividadesEsforzadas() { return actividadesRealizadas.filter({actividad => actividad.implicaEsfuerzo()}) }
	
	method registrarActividad(actividad) { 
		if(actividadesRealizadas.size() < maximoDeActividades){ actividadesRealizadas.add(actividad) }
		else { self.error("Maximo de actividades superado") }
	}
	
	method realizoActividad(actividad) { return actividadesRealizadas.contains(actividad) }
	
}

class SocioTranquilo inherits Socio {
	
	method leAtrae(actividad) { return actividad.diasQueLleva() >= 4 }
}

class SocioCoherente inherits Socio {
	
	method leAtrae(actividad) { 
		if(self.esAdoradorDelSol()) { return actividad.sirveParaBroncearse() }
		else { return actividad.implicaEsfuerzo() }
	}
}

class SocioRelajado inherits Socio {
	
	method leAtrae(actividad) { return actividad.idiomas().any({idioma => self.habla(idioma)}) }
	method habla(idioma) { return idiomasQueHabla.contains(idioma) }
}

