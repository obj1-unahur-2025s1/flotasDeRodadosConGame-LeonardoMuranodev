import autos.*

class Dependencia {
    const flota = []
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
    method capacidadTotalEnColor(color) = self.autosDeColor(color).sum()
    method colorRodadoMasRapido() = flota.max({rodado => rodado.velocidadMaxima()}).color()
    method capacidadFaltante() = self.capacidadTotal() - empleados
    method esGrande() = empleados >= 40 && flota.size() >= 5

    //Metodos de indicacion
    method agregarAFlota(rodado){
        flota.add(rodado)
    }

    method quitarDeFlota(rodado){
        flota.remove(rodado)
    }
}