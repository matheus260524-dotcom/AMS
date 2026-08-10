programa
{
    funcao inicio()
    {
        inteiro n, quantidade = 0
        escreva("Digite um numero (0 para parar): ")
        leia(n)
        enquanto(n > 0)
        {
            quantidade = quantidade + 1

            escreva("Digite outro numero: ")
            leia(n)
        }
        escreva("Quantidade de numeros: ", quantidade)
    }
}