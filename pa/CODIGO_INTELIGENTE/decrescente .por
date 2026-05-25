programa {
    funcao inicio() {
        real num1, num2, num3
        real maior, meio, menor

        escreva("Digite o primeiro número: ")
        leia(num1)
        
        escreva("Digite o segundo número: ")
        leia(num2)
        
        escreva("Digite o terceiro número: ")
        leia(num3)

        se (num1 >= num2 e num1 >= num3) {
            maior = num1
            se (num2 >= num3) {
                meio = num2
                menor = num3
            } senao {
                meio = num3
                menor = num2
            }
        } senao se (num2 >= num1 e num2 >= num3) {
            maior = num2
            se (num1 >= num3) {
                meio = num1
                menor = num3
            } senao {
                meio = num3
                menor = num1
            }
        } senao {
            maior = num3
            se (num1 >= num2) {
                meio = num1
                menor = num2
            } senao {
                meio = num2
                menor = num1
            }
        }

        escreva("\nOs números em ordem decrescente são: ")
        escreva(maior, " ", meio, " ", menor, "\n")
    }
}
