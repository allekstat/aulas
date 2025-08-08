const { log, error: err, warn: war } = console;

const meu_carro = (function criar_carro(){
  const este_carro = {
    esta_ligado: false
  };
  const novo_carro = {
    ligar_carro: function ligar_carro(){
      if (este_carro.esta_ligado) err("O Carro Já Está Ligado");
      else este_carro.esta_ligado = true
    },
    desligar_carro: function desligar_carro(){
      if (!este_carro.esta_ligado) err("O Carro Já Está Desligado");
      else este_carro.esta_ligado = false
    }
  }
  return novo_carro;
})();

meu_carro.ligar_carro();
meu_carro.ligar_carro();
meu_carro.ligar_carro();
meu_carro.desligar_carro();
meu_carro.desligar_carro();
meu_carro.desligar_carro();