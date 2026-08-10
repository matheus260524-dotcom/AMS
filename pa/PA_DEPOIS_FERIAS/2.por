programa
{
    funcao inicio()
    {
        inteiro idade, qtd = 0, soma = 0
        inteiro maiores = 0
        real media
        cadeia resposta

        resposta = "s"

        enquanto(resposta == "s")
        {
            escreva("Digite a idade: ")
            leia(idade)

            soma = soma + idade
            qtd = qtd + 1

            se(idade >= 21)
            {
                maiores = maiores + 1
            }

            escreva("Deseja continuar? (s/n): ")
            leia(resposta)
        }

        media = soma / qtd

        escreva("\nQuantidade de idades: ", qtd)
        escreva("\nMedia das idades: ", media)
        escreva("\nPessoas com 21 anos ou mais: ", maiores)
    }
}