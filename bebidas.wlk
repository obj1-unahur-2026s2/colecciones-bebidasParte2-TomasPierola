object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoDeFrutas {
  const frutas = []

  method agregarFruta(valorNutricional) {
    frutas.add(valorNutricional)
  }

  method rendimientoQueOtorga(dosisConsumida) = frutas.sum() * (dosisConsumida / 1000)
}

object aguaSaborizada {
  var bebidaAUsar = ninguna

  method agregarBebida(bebida) {
    bebidaAUsar = bebida
  }
  method rendimientoQueOtorga(dosisConsumida) = bebidaAUsar.rendimientoQueOtorga(dosisConsumida * 1/4) + 1
}
object ninguna {}

object coctel {
  const bebidas = []

  method agregarBebida(bebida) {
    bebidas.add(bebida)
  }
  method rendimientoQueOtorga(dosisConsumida) = bebidas.fold(1, {acum, bebida => bebida.rendimientoQueOtorga(dosisConsumida / bebidas.size()) * acum})
}