programa
{
	funcao inicio()
	{
		// Declaração das variáveis como real para aceitar decimais
		real nota1, nota2, nota3, nota4, media

		// Entrada de dados
		escreva("Digite a primeira nota: ")
		leia(nota1)
		escreva("Digite a segunda nota: ")
		leia(nota2)
		escreva("Digite a terceira nota: ")
		leia(nota3)
		escreva("Digite a quarta nota: ")
		leia(nota4)

		// Cálculo da média
		media = (nota1 + nota2 + nota3 + nota4) / 4

		// Exibição do resultado
		escreva("A média final é: ", media)
	}
}