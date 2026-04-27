programa {
  funcao inicio() {
    real salario, imposto, salario_liquido
    escreva("digite o valor do salario")
    leia (salario)
    se (salario>= 1500){
      imposto= salario* 0.04
    }senao{
      imposto= 0
    }
    //calculo final 
    salario_liquido=salario -imposto
    escreva("salario liquido:", salario_liquido)
  }
}
