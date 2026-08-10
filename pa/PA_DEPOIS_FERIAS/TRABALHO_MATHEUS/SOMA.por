programa
{
    funcao inicio()
    {
        inteiro n, soma = 0
        escreva("Digite um numero (0 para parar): ")
        leia(n)
        enquanto(n > 0){
            soma = soma + n

            escreva("Digite outro numero: ")
            leia(n)
        }

        escreva("A soma dos numeros e: ", soma)
    }
}