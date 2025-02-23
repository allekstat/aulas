function maximo(vetor) {
  for (let posicao = 0; posicao < vetor.length; i++)
    var maior = vetor[posicao] > maior ? vetor[posicao] : maior || vetor[0]
  return maior
}

function verificar(vetor) {
  for (let posicao = 0, ordenado = false; posicao < vetor.length - 1; posicao++)
    if (ordenado ||= vetor[posicao] > vetor[posicao + 1]) break
  return !ordenado
}

function radix(vetor) {
  for (let digito = 0, limite = maximo(vetor); digito < 32; digito++) {
    if (verificar(vetor)) break
    let zeros = [], ums = []
    for (let posicao = 0; posicao < vetor.length; posicao++)
      [zeros, ums][0 | !!((vetor[posicao] >> digito) & 1)].push(vetor[posicao])
    vetor = [...zeros, ...ums]
    if (1 << digito > limite) break
  }
  return vetor
}

console.log(radix([1, 9, 4, 2, 5, 4, 7, 8, 5, 4, 3, 4, 6, 76, 544, 3, 33, 33, 445, 566, 7, 77, 8, 8, 8, 87, 6, 66, 6]))
