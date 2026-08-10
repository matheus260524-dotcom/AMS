programa
{
    funcao inicio()
    {
        inteiro opc

        escreva("Digite uma opcao de 1 a 3: ")
        leia(opc)
        enquanto(opc< 1 ou opc > 3){
            escreva("Opcao invalida!")
            escreva("\nDigite novamente: ")
            leia(opc)
        }

        escreva("Opcao valida!")
    }
}