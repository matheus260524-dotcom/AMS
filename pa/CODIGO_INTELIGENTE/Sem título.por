
    programa
{
	funcao inicio()
	{
		real num1, num2, resultado = 0.0
		caracter operacao
		logico operacaoValida = verdadeiro

		escreva("Digite o primeiro número: ")
		leia(num1)

		escreva("Escolha a operação (+, -, *, /): ")
		leia(operacao)

		escreva("Digite o segundo número: ")
		leia(num2)

		// Estrutura se/senao para decidir a operação
		se (operacao == '+') {
			resultado = num1 + num2
		}
		senao se (operacao == '-') {
			resultado = num1 - num2
		}
		senao se (operacao == '*') {
			resultado = num1 * num2
		}
		senao se (operacao == '/') {
			// Tratamento especial para divisão por zero
			se (num2 == 0) {
				escreva("Erro: Divisão por zero não permitida.\n")
				operacaoValida = falso
			}
			senao {
				resultado = num1 / num2
			}
		}
		senao {
			escreva("Operação inválida!\n")
			operacaoValida = falso
		}

		// Exibe o resultado se a operação foi válida
		se (operacaoValida) {
			escreva("Resultado: ", num1, " ", operacao, " ", num2, " = ", resultado, "\n")
		}
	}
}

  }
}
