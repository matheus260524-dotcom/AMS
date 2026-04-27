programa {
  funcao inicio() {
    real num

     escreva("Digite o num:") 
     leia(num)
    se ( num % 2 == 0 ) {
    escreva ( num, " é par! ")

     } senao {
      escreva ( num, " é impar! ")
      leia(num)
     }
      // EXEMPLO: 10 % 2 = 0 (par)
      // EXEMPLO: 11 % 2 = 1 (impar)
    }
  }
