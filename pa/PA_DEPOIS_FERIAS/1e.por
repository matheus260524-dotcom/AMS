programa
{
    funcao inicio()
    {
        inteiro n, menor, quantidade = 0

        escreva("Digite um numero (0 para parar): ")
        leia(n)

        enquanto(n > 0)
        {
            se(quantidade == 0)
            {
                menor = n
            }

            se(n < menor)
            {
                menor = n
            }

            quantidade = quantidade + 1

            escreva("Digite outro numero: ")
            leia(n)
        }

        escreva("O menor numero e: ", menor)
    }
}