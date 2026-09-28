programa {
  funcao inicio() {
    inteiro A [6]
    inteiro i 
    escreva("digite 6 valores: \n")
    
    para (i = 0;  i < 6 ; i++)
    {
      escreva("digite o valor ", i + 1, ":")
      leia(A [i])

    }
    para( i = 0; i < 6; i++){
      se (A[i] % 2 == 0 )
      {
        A[i]= A [i]
      }
      senao
      {
        A [i] = A [i] 
      }
    }
    escreva("\nVector apos o processamento: \n")
    para (i = 0; i < 6; i++)
    {
      escreva("[", A [i], "]")
    }

  }
}
