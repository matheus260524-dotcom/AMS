programa
{
	funcao inicio()
	{
		inteiro numero, i, opcao

		faca
		{

			faca
			{
				escreva("Digite um número: ")
				leia(numero)

				se (numero < 0)
				{
					escreva("Número negativo não é permitido!\n")
				}

			} enquanto (numero < 0)

			escreva("\n--- TABUADA DO ", numero, " ---\n")

			para (i = 0; i <= 10; i++)
			{
				escreva(numero, " x ", i, " = ", numero * i, "\n")
			}

			escreva("\nDeseja consultar outra tabuada?\n")
			escreva("1 - Sim\n")
			escreva("2 - Não, encerrar\n")
			escreva("Escolha: ")
			leia(opcao)

		} enquanto (opcao == 1)

		escreva("\nPrograma encerrado!")
	}
}