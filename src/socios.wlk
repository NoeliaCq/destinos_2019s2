import viajes.*
class Socio {
	const  actividadesRealizadas = #{}
	var property cantMaximaDeActividades
	var property edad
	var property idiomasHablados = #{}
	
	method esAdoradorDelSol() {
		return actividadesRealizadas.all({act => act.sirveParaBroncearse()})
	}
	method actividadesEsforzadas() {
		return actividadesRealizadas.filter({act => act.implicaEsfuerzo()})
	}
	method actividadesRealizadas() { return actividadesRealizadas }
	method actividadesRealizadas(actividad) {
		if(actividadesRealizadas.size() < cantMaximaDeActividades) {
			actividadesRealizadas.add(actividad)
		}
		else {
			self.error("Error: Cantidad máxima de actividades a realizar alcanzada")
		}
	}
	method actividadAtractiva(actividad) {
		return true
	}
}
class SocioTranquilo inherits Socio {
	override method actividadAtractiva(actividad) {
		return actividad.cantDias() > 4
	}
	
}
class SocioCoherente inherits Socio {
	override method actividadAtractiva(actividad) {
		return (self.esAdoradorDelSol() and actividad.sirveParaBroncearse()) or actividad.implicaEsfuerzo()
	}
	
}
class SocioRelajado inherits Socio {
	override method actividadAtractiva(actividad) {
		return actividad.idiomas().any({idioma => self.idiomasHablados().contains(idioma)})
	}
}