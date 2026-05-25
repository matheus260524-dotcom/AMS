programa {
  funcao inicio() {
    inteiro nivel_bat

    escreva("digite o nivel  da bateria: ")
    leia(nivel_bat)

    se((nivel_bat < 0) ou (nivel_bat > 100))
    escreva("digite um valor valido maior que 0% e menor que 100%")
    senao
    se(nivel_bat >= 80)
    escreva("Carga Completo ou Alta")
    senao
    se((nivel_bat >21) e  (nivel_bat< 80))
    escreva("carga Normal de uso")
    senao
    se((nivel_bat) e (nivel_bat <= 20))
    escreva("bateria fraca - carregar")
    senao
    escreva("Atividade do modo de Economia Extrema")

  }
}
