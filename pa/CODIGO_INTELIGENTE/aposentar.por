programa
{
    funcao inicio()
    {
        inteiro idade, tempo_Servico

        escreva("Digite a idade do trabalhador: ")
        leia(idade)
        
        escreva("Digite o tempo de serviço (em anos): ")
        leia(tempo_Servico)

        se (idade >= 65 ou tempo_Servico >= 30 ou (idade >= 60 e tempo_Servico >= 25))
        {
            escreva("\nTrabalhador PODE se aposentar.")
        }
        senao
        {
            escreva("\nTrabalhador NÃO PODE se aposentar.")
        }
    }
}
