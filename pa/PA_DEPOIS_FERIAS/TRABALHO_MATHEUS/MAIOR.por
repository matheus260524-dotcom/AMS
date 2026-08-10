programa
{
    funcao inicio()
    {
        inteiro n, maior = 0

        escreva("Digite um numero (0 para parar): ")
        leia(n)

        enquanto(n > 0)
        {
            se(n > maior)
            {
                maior = n
            }

            escreva("Digite outro numero: ")
            leia(n)
        }

        escreva("O maior numero e: ", maior)
    }
}
