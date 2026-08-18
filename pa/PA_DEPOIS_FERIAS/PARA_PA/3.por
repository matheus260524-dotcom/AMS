programa
{
	funcao inicio()
	{
		inteiro n, i, numero, maior, vezes = 0

		escreva("Quantos números serão lidos? ")
		leia(n)

		escreva("Digite o 1º número: ")
		leia(maior)

		para (i = 2; i <= n; i++)
		{
			escreva("Digite o ", i, "º número: ")
			leia(numero)

			se (numero > maior)
			{
				maior = numero
				vezes = 1
			}
			senao se (numero == maior)
			{
				vezes++
			}
		}

		vezes++

		escreva("Maior número = ", maior, "\n")
		escreva("Quantidade de vezes = ", vezes)
	}
}