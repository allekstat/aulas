function radix_sort(array) {
  for (let i = 0; array[i] != undefined; i++)
    var m = array[i] > m ? array[i] : m || array[0]
  for (let d = 0; d < 32; d++) {
    var z = [], u = [], o = 0
    for (let i = 0; i < array.length - 1; i++)
      if (o ||= array[i] > array[i + 1]) break
    if (!o) break
    for (let i = 0; array[i] != undefined; i++)
      [z, u][0 | !!((array[i] >> d) & 1)].push(array[i])
    array = [...z, ...u]
    if (1 << d > m) break
  }
  return array
}
log = console.log
log(radix_sort([1, 9, 4, 2, 5,4,7,8,5,4,3,4,6,76,544,3,33,33,445,566,7,77,8,8,8,87,6,66,6]))
