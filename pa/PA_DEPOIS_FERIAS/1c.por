programa
{
    funcao inicio()
    {
        inteiro n, soma = 0, quantidade = 0
        real media

        escreva("Digite um numero (0 para parar): ")
        leia(n)

        enquanto(n > 0)
        {
            soma = soma + n
            quantidade = quantidade + 1

            escreva("Digite outro numero: ")
            leia(n)
        }

        media = soma / quantidade

        escreva("A media e: ", media)
    }
}