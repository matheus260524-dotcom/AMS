programa
{
    funcao inicio()
    {
        inteiro n, i, fatorial = 1

        escreva("Digite um numero: ")
        leia(n)

        para(i = 1; i <= n; i++)
        {
            fatorial = fatorial * i
        }

        escreva("O fatorial e: ", fatorial)
    }
}