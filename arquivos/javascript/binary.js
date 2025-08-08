function verificar(vetor) {
  for (let posicao = 0, ordenado = false; posicao < vetor.length - 1; posicao++)
    if (ordenado ||= vetor[posicao] > vetor[posicao + 1]) break
  return !ordenado
}

function binary(vetor) {
  while (true) {
    if (verificar(vetor)) break
    for (let posicao = 0; posicao < vetor.length - 1; posicao++)
      if (vetor[posicao] > vetor[i + 1])
        vetor[posicao] = vetor[posicao] + vetor[posicao + 1] - (vetor[posicao + 1] = vetor[posicao])
  }
  return vetor
}

console.log(binary([9, 8, 7, 6, 5, 4, 3, 2, 1, 0]))
