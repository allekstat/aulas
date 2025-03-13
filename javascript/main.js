const { log, error: err, warn: war } = console;
const jogo = (function () {
  let placar = 0;
  function exibirPlacar(pontuacao) {
    placar += pontuacao;
  }
  return {
    exibirPlacar(x) {
      return placar;
    },
  };
})();
log(jogo.exibirPlacar(123));