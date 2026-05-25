
    programa
{
    funcao inicio()
    {
        inteiro nota

        escreva("Avalie a sua experiencia (de 1 a 5): ")
        leia(nota)

        se (nota == 1) 
        {
            escreva("Classificação: Ruim")
        }
        senao se (nota == 2) 
        {
            escreva("Classificação: Regular" )
        }
        senao se (nota == 3) 
        {
            escreva("Classificação: Bom" )
        }
        senao se (nota == 4) 
        {
            escreva("Classificação: Ótimo  ")
        }
        senao se (nota == 5) 
        {
            escreva("Classificação: Excelente ")
        }
        senao 
        {
            escreva("Nota inválida! Por favor, digite uma nota entre 1 e 5.")
        }
    }
}



