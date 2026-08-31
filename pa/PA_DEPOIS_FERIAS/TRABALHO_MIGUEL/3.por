programa
{
    funcao inicio()
    {
        inteiro n1, n2, opcao, continuar
        real resultado

        continuar = 1

        enquanto (continuar == 1)
        {
            escreva("\nDigite o primeiro numero: ")
            leia(n1)

            escreva("Digite o segundo numero: ")
            leia(n2)

            escreva("\n===== CALCULADORA =====")
            escreva("\n1 - Somar")
            escreva("\n2 - Subtrair")
            escreva("\n3 - Multiplicar")
            escreva("\n4 - Dividir")
            escreva("\n5 - Resto da divisao")
            escreva("\nEscolha uma opcao: ")
            leia(opcao)

            escolha (opcao)
            {
                caso 1:
                    resultado = n1 + n2
                    escreva("\nResultado: ", resultado)
                    pare

                caso 2:
                    resultado = n1 - n2
                    escreva("\nResultado: ", resultado)
                    pare

                caso 3:
                    resultado = n1 * n2
                    escreva("\nResultado: ", resultado)
                    pare

                caso 4:
                    se (n2 == 0)
                    {
                        escreva("\nNao e possivel dividir por zero!")
                    }
                    senao
                    {
                        resultado = n1 / n2
                        escreva("\nResultado: ", resultado)
                    }
                    pare

                caso 5:
                    se (n2 == 0)
                    {
                        escreva("\nNao e possivel dividir por zero!")
                    }
                    senao
                    {
                        resultado = n1 % n2
                        escreva("\nResto da divisao: ", resultado)
                    }
                    pare

                caso contrario:
                    escreva("\nOpcao invalida!")
            }

            escreva("\n\nDeseja realizar outra operacao?")
            escreva("\n1 - Sim")
            escreva("\n2 - Nao")
            escreva("\nEscolha: ")
            leia(continuar)
        }

        escreva("\nPrograma encerrado!")
    }
}