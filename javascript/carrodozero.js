const carro = (function () {
  const valor = 100000;
  let ipva = 0.04;
  var totalpago = 0;
  function calcularipva() {
    return valor * ipva;
  }
  function aptoarodar() {
    if (valor * ipva <= totalpago) {
      return true;
    } else {
      return false;
    }
  }
  return {
    mostraripva() {
      return "ipva = " + calcularipva();
    },
    pagaripva(valor) {
      return "voce ja pagou = " + (totalpago += valor);
    },
    ipvatapago() {
      if (aptoarodar()) {
        return "Apto a rodar";
      } else {
        return "Nao apto a rodar";
      }
    },
  };
})();

console.log(carro.mostraripva());
console.log(carro.pagaripva(3000));
console.log(carro.pagaripva(1000));
console.log(carro.ipvatapago());

function name(params) {
  
}
