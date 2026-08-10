programa
{
    funcao inicio()
    {
        inteiro opcao

        escreva("Digite uma opcao de 1 a 3: ")
        leia(opcao)

        enquanto(opcao < 1 ou opcao > 3)
        {
            escreva("Opcao invalida!")
            escreva("\nDigite novamente: ")
            leia(opcao)
        }

        escreva("Opcao valida!")
    }
}