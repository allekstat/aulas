function maximo(array) {
  for (let posicao = 0; posicao < array.length; i++)
    var maximo = array[posicao] > maximo ? array[posicao] : maximo || array[0]
  return maximo
}

function verificar(array) {
  for (let posicao = 0, ordenado = false; posicao < array.length - 1; posicao++)
    if (ordenado ||= array[posicao] > array[posicao + 1]) break
  return !ordenado
}

function radix(array) {
  for (let digito = 0, limite = maximo(array); digito < 32; digito++) {
    if (verificar(array)) break
    let zeros = [], ums = []
    for (let posicao = 0; array[posicao] != undefined; posicao++)
      [zeros, ums][0 | !!((array[posicao] >> digito) & 1)].push(array[posicao])
    array = [...zeros, ...ums]
    if (1 << digito > limite) break
  }
  return array
}
log = console.log
log(radix([1, 9, 4, 2, 5,4,7,8,5,4,3,4,6,76,544,3,33,33,445,566,7,77,8,8,8,87,6,66,6]))
