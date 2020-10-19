import socios.*
class Viaje {
	var property idiomas = #{}
	var property implicaEsfuerzo = true
	var property sirveParaBroncearse = true
	var property cantDias = 0
	method esInteresante() {
		return idiomas.size() > 1
	}
	method esRecomendadaParaSocio(socio) {
		return self.esInteresante() and 
		socio.actividadAtractiva(self) and 
		not socio.actividadesRealizadas().contains(self)
	}
}
class ViajeDePlaya inherits Viaje {
	var property largoDePlaya
	override method cantDias() {
		return largoDePlaya / 500
	}
	override method implicaEsfuerzo() {
		return largoDePlaya > 1200
	}
	override method sirveParaBroncearse() {
		return true
	}
}
class ExcursionALaCiudad inherits Viaje {
	var property cantAtracciones
	override method cantDias() {
		return cantAtracciones / 2
	}
	override method implicaEsfuerzo() {
		return cantAtracciones.between(5, 8)
	}
	override method sirveParaBroncearse() {
		return false
	}
	override method esInteresante() {
		return super() or cantAtracciones == 5
	}
}
class ExcursionACiudadTropical inherits ExcursionALaCiudad {
	override method cantDias() {
		return super() + 1
	}
	override method sirveParaBroncearse() {
		return true
	}
}
class SalidaDeTrekking inherits Viaje {
	var property kmSenderos
	var property diasDeSolPorAnio
	override method cantDias() {
		return kmSenderos / 50
	}
	override method implicaEsfuerzo() {
		return kmSenderos > 80
	}
	override method sirveParaBroncearse() {
		return (diasDeSolPorAnio > 200) or (diasDeSolPorAnio.between(100, 200) and kmSenderos > 120 )
	}
	override method esInteresante() {
		return super() and diasDeSolPorAnio > 140
	}
	
}
class ClaseDeGimnasia inherits Viaje {
	override method idiomas() {
		return #{"español"}
	}
	override method cantDias() {
		return 1
	}
	override method implicaEsfuerzo() {
		return true
	}
	override method sirveParaBroncearse() {
		return false
	}
	override method esRecomendadaParaSocio(socio) {
		return socio.edad().between(20, 30)
	}
}
class TallerLiterario inherits Viaje {
	var property librosTrabajados = #{}
	
	override method idiomas() {
		return librosTrabajados.map({libro=> libro.idioma()}).asSet()
	}
	override method cantDias() {
		return librosTrabajados.size() + 1
	}
	///////////revisar////////////////
	override method implicaEsfuerzo() {
		return librosTrabajados.any({libro=> libro.cantPaginas() > 500}) or 
		self.autoresTrabajados().size() > 1
	}
	method autoresTrabajados() { 
		return librosTrabajados.map({libro=> libro.nombreDelAutor()})
	}
	/////////////////////////////////
	override method sirveParaBroncearse() {
		return false
	}
	override method esRecomendadaParaSocio(socio) {
		return socio.idiomas().size() > 1
	}
}
	
class Libro {
	var property idioma
	var property cantPaginas
	var property nombreDelAutor
}
