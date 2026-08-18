programa
{
	funcao inicio()
	{
		inteiro numero, centena, dezena, unidade

		escreva("Digite um número entre 100 e 999: ")
		leia(numero)

		centena = numero / 100
		dezena = (numero % 100) / 10
		unidade = numero % 10

		escreva("Centena: ", centena, "\n")
		escreva("Dezena: ", dezena, "\n")
		escreva("Unidade: ", unidade)
	}
}