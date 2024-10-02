object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method consecuenciaDeCarga() {}
}
object bumblebee {
    var property transformadoEnAuto = true
    method peso() = 800
    method peligrosidad() = if (transformadoEnAuto) 30 else 15
    method bulto() = 2
    method consecuenciaDeCarga() {
        transformadoEnAuto = false
    }

}
object paqueteDeLadrillos {
    var cantLadrillos = 0
    method cantLadrillos(cantidad) {
        cantLadrillos = 0.max(cantLadrillos + cantidad)
    }
    method peso() = cantLadrillos * 2
    method peligrosidad() = 2 
    method bulto() {
        var salida = 1
        if (cantLadrillos.between(101, 300))
            salida = 2
        if (cantLadrillos > 301)
            salida = 3
        return salida
    }
    method consecuenciaDeCarga() {
        self.cantLadrillos(12)
    }    
}
object arenaAGranel {
    var property peso = 0
    method peligrosidad() = 1
    method bulto() = 1
    method consecuenciaDeCarga() {
        peso = 0.max(peso - 10)
    }
}
object bateriaAntiAerea {
    var property estaCargada = true
    method peso() = if(estaCargada) 300 else 200
    method peligrosidad() = if(estaCargada) 100 else 0  
    method bulto() = if (estaCargada) 2 else 1
    method consecuenciaDeCarga() {
        estaCargada = true
    }
}
object contenedorPortuario {
    const contenido = []
    method cargarCosa(unaCosa) {
        contenido.add(unaCosa)
    }
    method descargarCosa(unaCosa) {
        contenido.remove(unaCosa)
    }
    method peso() = contenido.map({c => c.peso()}).sum() + 100
    method peligrosidad() = 
        if (not contenido.isEmpty()) 
            self.elMasPeligroso()
        else 
            0
    method elMasPeligroso() = contenido.map({c => c.peligrosidad()}).max()
    method bulto() = 1 + contenido.map({c => c.bulto()}).sum() 
    method consecuenciaDeCarga() {
        contenido.forEach({c => c.consecuenciaDeCarga()})
    }
}
object residuosRadioactivos {
    var property peso = 0
    method peligrosidad() = 200
    method bulto() = 1
    method consecuenciaDeCarga() {
        peso = peso + 15
    }
}
object embalajeDeSeguridad {
    //Se espera que: objetoQueEnvuelve != embalajeDeSeguridad
    var property objetoQueEnvuelve = null
    method peso() = objetoQueEnvuelve.peso()
    method peligrosidad() = (objetoQueEnvuelve.peligrosidad())*0.5
    method bulto() = 2
    method consecuenciaDeCarga() {}
}
