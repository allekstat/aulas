// fibonacci
let vetor = []
vetor[0] = 0n
vetor[1] = 1n
for (let posicao = 2; posicao <= 20; posicao++) {
  vetor[posicao] = vetor[posicao - 1] + vetor[posicao - 2]

  // console log
  console.log(vetor[posicao])
}


// tabuada
let matriz = []
for (let linha = 0; linha <= 10; linha++) {
  matriz[linha] = []
  for (let coluna = 0; coluna <= 10; coluna++)
    matriz[linha][coluna] = linha * coluna

  // esse console log parece complicado
  // mas ele só tá servindo pra deixar
  // bonitinho pra ver no terminal
  console.log(...matriz[linha].map(numero => (numero + "").padStart(3, " ")))
}


// fatorial
let valores = []
valores[0] = 1n
for (let posicao = 1; posicao <= 15; posicao++) {
  valores[posicao] = BigInt(posicao) * valores[posicao - 1]

  // console log
  console.log(valores[posicao])
}
