import cosas.*

object camion {
    const carga = []

    method obtenerCarga() = carga.asList()
    method pesoTotal() = carga.map({c => c.peso()}).sum() + 1000
    method cargarCosa(unaCosa) {
        carga.add(unaCosa)
    }
    method descargarCosa(unaCosa) {
        carga.remove(unaCosa)
    }
    method cargaImpar() =
        carga.all({c => c.peso().odd()})
    
    method hayCargaDePeso(unPeso) =
        carga.any({c => c.peso() == unPeso})

    method cargaConPeligrosidad(unaPeligrosidad) =
        carga.findOrDefault({c => c.peligrosidad() == unaPeligrosidad}, 'No hay nada con ese nivel de peligrosidad')
    
    method cargaConPeligrosidadMayorA(unaPeligrosidad) =
        carga.filter({c => c.peligrosidad() > unaPeligrosidad})
    
    method excedidoDePeso() = self.pesoTotal() > 2500

    method puedeCircular() = 
        not self.excedidoDePeso() and self.cargaConPeligrosidadMayorA(viaje.condicion()).isEmpty() 
    
    method cargaQueSuperaLaPeligrosidadDe(unaCosa) = 
        carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})
}       
object viaje {
    var nivelDePeligrosidadAdmitido = 50
    method nivelDePeligrosidadAdmitido(valor){
        nivelDePeligrosidadAdmitido = valor
    }  

    method condicion() = nivelDePeligrosidadAdmitido
}