programa {
  funcao inicio() {
    cadeia nome, situacao
    real nota1, nota2, nota3, media, frequencia

    escreva("Digite o nome do aluno")
     leia (nome)

     escreva("digite a primeira nota:")
     leia(nota1 )

     escreva("digite a segunda nota:")
     leia(nota2)

     escreva("digite a terceira nota:")
     leia(nota3)
     
     escreva("digite frequencia(%):")
     leia(frequencia)

     media = (nota1 + nota2 + nota3)/3


     se (frequencia<75){
      situacao ="reprovado por frequencia"
     }
     senao se(media>=7){
      situacao="aprovado"
     }
     senao se(media>= 5)
     {
      situacao="recuperação"
     }
     senao
     {
      situacao="reprovado"
     }


     escreva("\nNOME: ", nome)
     escreva("\nmedia: ", media)
     escreva("\nfrequencia: ", frequencia,"%")
     escreva("\n Situação:",  situacao)




























  }
}
