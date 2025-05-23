class UnionRegiones {
    const property regionesInternas = #{}

    method contiene(posicion) {
        return regionesInternas.contains(posicion)
    }
}

class InterRegiones {
    const property regionesInternas = #{}

    method contiene(posicion) {
        return regionesInternas.contains(posicion)
    }
}

class Region {
    const property minX
    const property maxX
    const property minY
    const property maxY

    method contiene(posicion) {
        return  posicion.x() >= self.minX() &&
                posicion.x() <= self.maxX()   &&
                posicion.y() >= self.minY() &&
                posicion.y() <= self.maxY()
    }

    method regionesInternas(){
        const regiones = #{}

        (self.minX()..self.maxX()).forEach {
             x => (self.minY()..self.maxY()).forEach {
                 y => regiones.add(game.at(x, y))
                 }
        }

        return  regiones
    }

    method union(otraRegion) {
        return self.regionesInternas().union(otraRegion.regionesInternas())
    }

    method interseccion(otraRegion) {
        return self.regionesInternas().intersection(otraRegion.regionesInternas())
    }
}

//Direcciones
object norte {
    method proximaPosicion(posicionVieja) {
        return posicionVieja.up(1)
    }
}

object sur {
    method proximaPosicion(posicionVieja) {
        return posicionVieja.down(1)
    }
}

object este {
    method proximaPosicion(posicionVieja) {
        return posicionVieja.left(1)
    }
}

object oeste {
    method proximaPosicion(posicionVieja) {
        return posicionVieja.right(1)
    }
}