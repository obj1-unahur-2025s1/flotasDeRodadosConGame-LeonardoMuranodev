import autos.*
import pedidos.*

class Dependencia {
    const flota = []
    const pedidos = []
    var property empleados = 0

    //Metodos de consulta
    
    //Auxiliares
    method todosPuedenIrA100() = flota.all({rodado => rodado.velocidadMaxima() >= 100})
    method autosDeColor(color) = flota.filter({rodado => rodado.color() == color})
    method rodadoMasRapido() = flota.max({rodado => rodado.velocidadMaxima()})
    method capacidadTotal() = flota.sum({rodado => rodado.capacidad()})

    //pedidos
    method pesoTotalFlota() = flota.sum({rodado => rodado.peso()})
    method estaBienEquipada() = flota.size() >= 3 && self.todosPuedenIrA100()
    method capacidadTotalEnColor(color) = self.autosDeColor(color).sum({rodado => rodado.capacidad()})
    method colorRodadoMasRapido() = flota.max({rodado => rodado.velocidadMaxima()}).color()
    method capacidadFaltante() =  0.max(empleados - self.capacidadTotal())
    method esGrande() = empleados >= 40 && flota.size() >= 5

    //Metodos de consulta de pedidos
    method totalPasajerosPaquetes() {
        return pedidos.sum({pedido => pedido.cantidadPasajeros()})
    }

    method pedidosQueNoPuedenSerRealizados(){
        return pedidos.filter({pedido => self.pedidoNoPuedeSerRealizado(pedido)})
    }

    method pedidoNoPuedeSerRealizado(unPedido){
        return not flota.any({auto => unPedido.autoPuedeHacerPedido(auto)})
    }

    method esColorIncompatibleDeTodosLosPedidos(unColor){
        return pedidos.all({pedido => pedido.coloresIncompatibles().contains(unColor)})
    }

    //Metodos de indicacion
    method agregarAFlota(rodado){
        flota.add(rodado)
    }

    method agregarMuchosAFlota(listaRodado){
        flota.addAll(listaRodado)
    }

    method quitarDeFlota(rodado){
        flota.remove(rodado)
    }

    //Metodos de indicacion de pedidos
    method relajarTodosLosPedidos(){
        pedidos.forEach({pedido => pedido.relajar()})
    }

    method agregarPedido(unPedido){
        pedidos.add(unPedido)
    }

    method agregarPedidos(listaPedidos){
        pedidos.addAll(listaPedidos)
    }

    method quitarPedido(unPedido){
        pedidos.remove(unPedido)
    }

}