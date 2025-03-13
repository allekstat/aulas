const { log, error: err, warn: war } = console;
const adicao = function adicao(a, b) {
  return a + b;
};
const subtracao = function subtracao(a, b) {
  return a - b;
};
const multiplicacao = function multiplicacao(a, b) {
  return a * b;
};
const divisao = function divisao(a, b) {
  return a / b;
};
//let d = divisao(5, 2);
//log("%f\t%f\t%f\t%f", a, b, c, d);
//this.x = 1;
//let y = 2;
let calculadora = {
  x: 0,
  y: 0,
  definicao(x, y) {
    this.x = x;
    this.y = y;
    return `X = ${this.x}, Y = ${this.y}`;
  },
  adicao() {
    return this.x + this.y;
  },
  subtracao() {
    return this.x - this.y;
  },
  multiplicacao() {
    return this.x * this.y;
  },
  divisao() {
    return this.x / this.y;
  },
  potenciacao: () => this.x,
};
log(calculadora.definicao(11, 0));
log(calculadora.adicao());
log(calculadora.subtracao());
log(calculadora.multiplicacao());
log(calculadora.divisao());
log(calculadora.potenciacao());
