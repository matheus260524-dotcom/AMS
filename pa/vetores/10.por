programa
{
	funcao inicio()
	{
		inteiro vetor[8]
		inteiro i
		inteiro x, y
		inteiro soma

		para (i = 0; i < 8; i++)
		{
			escreva("Digite o ", i + 1, "º valor: ")
			leia(vetor[i])
		}

		escreva("\nDigite a posição X: ")
		leia(x)

		escreva("Digite a posição Y: ")
		leia(y)


		soma = vetor[x] + vetor[y]

		escreva("\nValor na posição X: ", vetor[x])
		escreva("\nValor na posição Y: ", vetor[y])
		escreva("\nSoma: ", soma)
	}
}
