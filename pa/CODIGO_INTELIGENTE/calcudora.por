
    programa
{
	funcao inicio()
	{
		// Variáveis
		real n1, n2, resultado = 0.0
		caracter operador
		logico operacao_valida = verdadeiro

		escreva("--- CALCULADORA SIMPLES ---\n")
		
		// Entrada de dados
		escreva("Digite o primeiro número: ")
		leia(n1)
		
		escreva("Digite a operação (+, -, *, /): ")
		leia(operador)
		
		escreva("Digite o segundo número: ")
		leia(n2)

		// Estrutura de decisão para operação
		escolha(operador)
		{
			caso '+':
				resultado = n1 + n2
				pare
			caso '-':
				resultado = n1 - n2
				pare
			caso '*':
				resultado = n1 * n2
				pare
			caso '/':
				// Validação de divisão por zero
				se (n2 == 0) {
					escreva("Erro: Divisão por zero não permitida.\n")
					operacao_valida = falso
				} senao {
					resultado = n1 / n2
				}
				pare
			caso contrario:
				escreva("Operador inválido!\n")
				operacao_valida = falso
				pare
		}

		// Exibição do resultado
		se (operacao_valida) {
			escreva("Resultado: ", n1, " ", operador, " ", n2, " = ", resultado, "\n")
		}
	}
}
