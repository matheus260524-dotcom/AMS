programa {
  funcao inicio() {
    real valor, soma = 0
    inteiro i
    

    para (i = 1; i <= 10; i++ ){
      escreva("digite o ", i , "º valor : ")
      leia (valor)
      soma = soma + valor
    }
     escreva ( "\nA soma dos valores é :", soma )
  }
}
