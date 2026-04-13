programa
{
	funcao inicio()
	{
		real valor1, valor2, valor3
		real somaQuadrados

		escreva("Digite o primeiro valor: ")
		leia(valor1)
		
		escreva("Digite o segundo valor: ")
		leia(valor2)
		
		escreva("Digite o terceiro valor: ")
		leia(valor3)

		somaQuadrados = (valor1 * valor1) + (valor2 * valor2) + (valor3 * valor3)

		escreva("\nA soma dos quadrados dos três valores é: ", somaQuadrados)
	}
}

