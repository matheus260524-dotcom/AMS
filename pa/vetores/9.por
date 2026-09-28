programa
{
	funcao inicio()
	{
		real vetor[10]
		real quadrado[10]
		inteiro i

		para (i = 0; i < 10; i++)
		{
			escreva("Digite o ", i + 1, "º número: ")
			leia(vetor[i])
		}

		para (i = 0; i < 10; i++)
		{
			quadrado[i] = vetor[i] * vetor[i]
		}


		escreva("\nNúmeros originais: ")

		para (i = 0; i < 10; i++)
		{
			escreva(vetor[i], " ")
		}

		escreva("\nQuadrados: ")

		para (i = 0; i < 10; i++)
		{
			escreva(quadrado[i], " ")
		}
	}
}
