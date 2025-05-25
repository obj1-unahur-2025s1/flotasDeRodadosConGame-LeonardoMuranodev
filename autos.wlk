import mainExample.fin
import wollok.game.*
import direcciones-regiones.*

/*Palabra reservada class para crear una clase, tengo que ponerle los metodos que tendra, y los atributos
que quiero definir al momento de crear el objeto, debo poner un metodo vacio, o con el property*/

//Clases de autos

class Corsa {
    const ubicaciones = [] //guardamos la ubicaciones donde paso el corsa
    var position 
    var ultimoMovimiento = null
    var resistencia = 2

    //Atributos de cada corsa basicos 
    var property color
    method capacidad() = 4
    method velocidadMaxima() = 150
    method peso() = 1300
    method image() = color.image()
    method position() = position

    //Metodos de consulta
    method pasoPor(posicion) = ubicaciones.contains(posicion)
    method pasoPorFila(numero) = ubicaciones.map({pos => pos.x()}).contains(numero)
    method recorrioFilas(listaNumeros) = listaNumeros.all({n => self.pasoPorFila(n)})
    method estaEn(region) = region.contiene(self.position())
    method resistencia() = resistencia

    //Metodos de indicacion
    method bajarResistencia(){
        resistencia = 0.max(resistencia - 1)
    }

    method repetirUltimoMovimiento(){
        if (ultimoMovimiento != null) {self.moverse(ultimoMovimiento)}
    }

    method moverse(direccion) {
        self.position(direccion.proximaPosicion(self.position()))
        ultimoMovimiento = direccion
    }

    method position(nuevaPosicion) {
        position = nuevaPosicion
        ubicaciones.add(nuevaPosicion)
    }
}

//Al momento de instanciar, debo especificar si tiene tanque adicional
class RenaultKwid {
    var property tieneTanqueAdicional
    method color() = "azul"
    method capacidad() = if(tieneTanqueAdicional) 3 else 4
    method velocidadMaxima() = if(tieneTanqueAdicional) 110 else 120
    method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
}

class AutoEspecial {
    var property color
    var property capacidad
    var property peso
    var property velocidadMaxima
}

object trafic {
    var property interior = comodo
    var property motor = pulenta

    //Metodos de consulta
    method color() = "blanco"
    method capacidad() = interior.capacidad()
    method velocidadMaxima() = motor.velocidadMaxima()
    method peso() = 4000 + interior.peso() + motor.peso()
}

//Interiores de la trafic
object comodo {
    method capacidad() = 5
    method peso() = 700
}

object popular {
    method capacidad() = 12
    method peso() = 1000
}

//Motores de la trafic
object pulenta {
    method velocidadMaxima() = 130
    method peso() = 800
}

object bataton {
    method velocidadMaxima() = 80
    method peso() = 500
}

//Colores

object rojo {
    method image() {return "autitorojo.png"} 
}
object azul {
    method image() {return "autitoAzul.png"} 
}

object verde {
    method image() {return "autitoVerde.png"} 
}

//Paredes

class Pared {
    var resistencia = 3
    var tipoResistencia = resistente
    var property position = game.at(0.randomUpTo(16),0.randomUpTo(16))
    method image() = tipoResistencia.image()
    method decirResistencia() = "He chocado, ahora mi resistencia es de " + resistencia

    //Metodos de indicacion
    method bajarResistencia() {
        resistencia = 0.max(resistencia - 1)
        tipoResistencia = tipoResistencia.cambiarResistencia()
        if (resistencia > 0) {
            game.say(self, self.decirResistencia())
        }
        else{
            game.say(self, "Me destruyeron")
            game.removeVisual(self)
        } 
    }
}

//Tipos de paredes
object resistente {
    method image () = "paredLadrillos3.jpg"

    method cambiarResistencia() = dura
}

object dura {
    method image () = "paredLadrillos2.jpg"

    method cambiarResistencia() = fragil
}

object fragil {
    method image () = "paredLadrillos1.jpg"

    method cambiarResistencia() = self
}
