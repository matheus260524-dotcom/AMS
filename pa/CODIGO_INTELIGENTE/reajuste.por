programa
{
    funcao inicio()
    {
        real salario, percentual, valor_reajuste, novo_salario

        escreva("Digite o salário atual do funcionário (R$): ")
        leia(salario)

        enquanto (salario < 0)
        {
            escreva("Valor inválido! O salário não pode ser negativo.\n")
            escreva("Digite novamente o salário atual (R$): ")
            leia(salario)
        }

        se (salario < 500.00)
        {
            percentual = 15.0
        }
        senao se (salario <= 1000.00)
        {
            percentual = 10.0
        }
        senao se (salario <= 1500.00)
        {
            percentual = 5.0
        }
        senao
        {
            percentual = 2.0
        }

        valor_reajuste = salario * (percentual / 100)
        novo_salario = salario + valor_reajuste

        escreva("\n--- RESUMO DO REAJUSTE ---\n")
        escreva("Salário Base: R$ ", salario, "\n")
        escreva("Percentual de Reajuste: ", percentual, "%\n")
        escreva("Valor do Reajuste: R$ ", valor_reajuste, "\n")
        escreva("Novo Salário: R$ ", novo_salario, "\n")
    }
}