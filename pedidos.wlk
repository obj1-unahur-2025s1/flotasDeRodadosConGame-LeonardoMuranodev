class Pedido {
    const property distanciaEnKm
    var property tiempoEnHs
    const property cantidadPasajeros
    const property coloresIncompatibles

    //Metodos de consulta

    //Auxiliares
    method velMinima(unAuto) = unAuto.velocidadMaxima() >= self.velocidadRequerida() + 10
    method capMinima(unAuto) = cantidadPasajeros <= unAuto.capacidad()
    method colorNoIncompatible(unAuto) = not coloresIncompatibles.contains(unAuto.color())

    //Pedidos
    method velocidadRequerida() = distanciaEnKm / tiempoEnHs
    method autoPuedeHacerPedido(unAuto) = self.velMinima(unAuto) && self.capMinima(unAuto) && self.colorNoIncompatible(unAuto)

    //Metodos de indicacion
    method acelerar(){
        tiempoEnHs -= 1
    }

    method relajar(){
        tiempoEnHs += 1
    }
}