                                  



                                  
    programa
{
	funcao inicio()
	{
		// Declaração de variáveis (tipo real para aceitar casas decimais)
		real valorDia, diasTrabalhados, salarioTotal

		// Entrada de dados
		escreva("Digite o valor recebido por dia: R$ ")
		leia(valorDia)
		
		escreva("Digite a quantidade de dias trabalhados: ")
		leia(diasTrabalhados)

		// Processamento
		salarioTotal = valorDia * diasTrabalhados

		// Saída
		escreva("\nO salário total no mês é: R$ ", salarioTotal)
	}
}
