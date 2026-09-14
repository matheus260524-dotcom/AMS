programa {
  funcao inicio() {
    cadeia func[3]
    real sal[3]
    real reajuste


    para(inteiro i = 0; i <3; i++){
      escreva("nome do (a) funcionario (a):")
      leia(func[i])


      escreva( " digite o salario de ", func[i], ": R$")
      leia (sal [i])
      escreva("\n")
    }
    escreva(" digite o indice para calculo do reajuste salarial (%):")
    leia( reajuste)
    escreva("\n ===== SALARIO REAJUSTATE====\n")
    para (inteiro i = 0 ; i < 3; i++){
      sal[i] = sal[1] + (sal[ i] * reajuste) /100
      escreva("\nFUncionarios (a):", func[1])
      escreva("\n Salario reajustado: R$", sal[i])
      escreva("\n")
    }
  }
}
