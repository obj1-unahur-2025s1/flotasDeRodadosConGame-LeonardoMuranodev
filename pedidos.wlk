class Pedido {
    const property distanciaEnKm
    const property tiempoEnHs
    const property cantidadPasajeros
    const property coloresIncompatibles

    method velocidadRequerida() = distanciaEnKm / tiempoEnHs
    method velMinima(unAuto) = unAuto.velocidadMaxima() >= self.velocidadRequerida() + 10
    method capMinima(unAuto) = cantidadPasajeros <= unAuto.capacidad()
    method colorNoIncompatible(unAuto) = not coloresIncompatibles.contains(unAuto.color())
    method autoPuedeHacerPedido(unAuto) = self.velMinima(unAuto) && self.capMinima(unAuto) && self.colorNoIncompatible(unAuto)

}