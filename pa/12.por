programa {
	funcao inicio() {
		real diasTrabalhados, valorBruto, imposto, valorLiquido
		const real VALOR_DIA = 30.00
		const real TAXA_IMPOSTO = 0.08 

		escreva("Digite o número de dias trabalhados: ")
		leia(diasTrabalhados)

		valorBruto = diasTrabalhados * VALOR_DIA
		imposto = valorBruto * TAXA_IMPOSTO
		valorLiquido = valorBruto - imposto

		escreva("\nValor Bruto: R$ ", valorBruto)
		escreva("\nDesconto IR (8%): R$ ", imposto)
		escreva("\nValor Líquido a receber: R$ ", valorLiquido)
	}
}

