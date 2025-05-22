import wollok.game.*

/*Palabra reservada class para crear una clase, tengo que ponerle los metodos que tendra, y los atributos
que quiero definir al momento de crear el objeto, debo poner un metodo vacio, o con el property*/

//Clases de autos

//Al momento de instanciar, debo especificar el color
class Corsa {
    /*// Esto es lo mismo: --- new Position(x = 0, y = 0). cada vez que movamos a algo, va a crear una 
    nueva instancia de position, guardandola en la variable*/
    const ubicaciones = [] //guardamos la ubicaciones donde paso el corso
    var position = game.at(4,7)

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

    //Metodos de indicacion
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
/*
class AutoEspecial {
    //Aca, sus propiedades se instancian, pero una vez que eso pasa, no se puede cambiar
    //Simulamos que el auto solo puede cambiar su color, eso si podria, ya que es var, no const
    var property color
    const property capacidad
    const property peso
    const property velocidadMaxima

    //Limitamos la velocidad maxima de todos los autos, si excede 200, con un objeto externo
    //la velocidad no se podra cambiar, y si pasa 200, devolvera 200
    method velocidadMaxima() = velocidadMaxima.min(topeVelMax.tope())
}
*/

//Tope de velocidad que afecta a los objetos de la clase AutoEspecial
object topeVelMax {
    var property tope = 200
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


/*
Estructura para crear un objeto, debemos darle los atributos no definidos
const listaDeCorsa = [] //Lista vacia, pero tendra tres objetos corsa.
listaDeCorsa.add(new Corsa(color="rojo"))  Crea una instacia de la clase Corsa con el color rojo
listaDeCorsa.add(new Corsa(color="rojo"))  Crea una instacia de la clase Corsa con el color rojo
listaDeCorsa.add(new Corsa(color="verde"))  Crea una instacia de la clase Corsa con el color verde
*/
