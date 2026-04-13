programa
{
	
	inclua biblioteca Matematica --> mat
	
	funcao inicio()
	{
		real alturaDegrau, alturaObjetivo, totalDegraus
		
		escreva("Digite a altura de cada degrau (cm): ")
		leia(alturaDegrau)
		
		escreva("Digite a altura que deseja alcançar (cm): ")
		leia(alturaObjetivo)
		
	
		totalDegraus = alturaObjetivo / alturaDegrau
		
		totalDegraus = mat.arredondar(totalDegraus, 0)
		
		escreva("Você precisará subir ", totalDegraus, " degraus.\n")
	}
}

