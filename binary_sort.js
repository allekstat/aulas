function binary_sort(array) {
  while (1) {
    var o = 0
    for (let i = 0; i < array.length - 1; i++)
      if (o ||= array[i] > array[i + 1]) break
    if (!o) break
    for (let i = 0; i < array.length - 1; i++)
      if (array[i] > array[i + 1])
        array[i] = array[i] + array[i + 1] - (c++, array[i + 1] = array[i])
  }
  return array
}
log = console.log
var c = 0
log(binary_sort([9,8,7,6,5,4,3,2,1,0]))
log(c)
