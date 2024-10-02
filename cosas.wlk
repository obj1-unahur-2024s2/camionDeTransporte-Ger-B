object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}
object bumblebee {
    var property transformado = false
    method peso() = 800
    method peligrosidad() = if (transformado) 30 else 15
}
object paqueteDeLadrillos {
    var cantLadrillos = 1
    method cantLadrillos(cantidad) {
        cantLadrillos = cantidad
    }
    method peso() = cantLadrillos * 2
    method peligrosidad() = 2 
}
object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 1
}
object bateriaAntiAerea {
    var property estaCargada = true
    method peso() = if(estaCargada) 300 else 200
    method peligrosidad() = if(estaCargada) 100 else 0  
}
object contenedorPortuario {
    const contenido = []
    method cargarCosas(unaCosa) {
        contenido.add(unaCosa)
    }
    method descargarCosas(unaCosa) {
        contenido.remove(unaCosa)
    }
    method peso() = contenido.map({c => c.peso()}).sum() + 100
    method peligrosidad() = 
        if (not contenido.isEmpty()) 
            self.elMasPeligroso()
        else 
            0
    method elMasPeligroso() = contenido.map({c => c.peligrosidad()}).max()
}
object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
}
object embalajeDeSeguridad {
    var property objetoQueEnvuelve = null
    method peligrosidad() = (objetoQueEnvuelve.peligrosidad())*0.5
}
