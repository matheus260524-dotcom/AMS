
programa
{
	inclua biblioteca Util --> u
	funcao inicio()
	{
	inteiro contagem = 10


		enquanto (contagem >= 0){
		
			escreva(contagem, "\n")
			u.aguarde(1000) 
			contagem = contagem - 1
		}

		escreva("FIM!")
	}
}
