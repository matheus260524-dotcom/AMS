programa
{
	funcao inicio()
	{
		inteiro habitantes, i, codigo
		real consumo, maior, menor, soma, media
		real residencial = 0
		real comercial = 0
		real industrial = 0

		escreva("Digite o numero de habitantes: ")
		leia(habitantes)

		soma = 0

		para(i = 1; i <= habitantes; i++)
		{
			escreva("\nDigite o consumo do habitante ", i, ": ")
			leia(consumo)

			escreva("Digite o codigo (1-Residencial, 2-Comercial, 3-Industrial): ")
			leia(codigo)

			soma = soma + consumo

			se(i == 1)
			{
				maior = consumo
				menor = consumo
			}

			se(consumo > maior)
			{
				maior = consumo
			}

			se(consumo < menor)
			{
				menor = consumo
			}

			se(codigo == 1)
			{
				residencial = residencial + consumo
			}

			se(codigo == 2)
			{
				comercial = comercial + consumo
			}

			se(codigo == 3)
			{
				industrial = industrial + consumo
			}
		}

		media = soma / habitantes

		escreva("\nMaior consumo: ", maior)
		escreva("\nMenor consumo: ", menor)
		escreva("\nMedia de consumo: ", media)
		escreva("\nTotal residencial: ", residencial)
		escreva("\nTotal comercial: ", comercial)
		escreva("\nTotal industrial: ", industrial)
	}
}