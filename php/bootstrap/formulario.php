<?php
include "operacao.php";
?>

<div class="container">
 <div class="row">
  <div class="col-8 offset-2">
   <form class="form-horizontal" method="post">
    <div class="row mb-4">
     <div class="col-6 offset-3 text-center">
      <span class="form-control-static"><?php echo conta($n1, $n2, $operacao, $simbolo, $resultado, $erro) ?></span>
     </div>
    </div>
    <div class="row mb-4">
     <div class="col-6 offset-3">
      <input class="form-control" name="numero1" type="number" step="0.000000000000001" />
     </div>
    </div>
    <div class="row mb-4">
     <div class="col-6 offset-3">
      <select class="form-control" name="operacao">
       <option selected value="0">Selecione a Operação</option>
       <option value="adicao">Adição</option>
       <option value="subtracao">Subtração</option>
       <option value="multiplicacao">Multiplicação</option>
       <option value="divisao">Divisão</option>
      </select>
     </div>
    </div>
    <div class="row mb-4">
     <div class="col-6 offset-3">
      <input class="form-control" name="numero2" type="number" step="0.000000000000001" />
     </div>
    </div>
    <div class="row">
     <div class="col-6 offset-3">
      <input class="btn btn-primary" type="submit" value="Calcular" />
      <input class="btn btn-secondary" type="reset" value="Limpar" />
     </div>
    </div>
   </form>
  </div>
 </div>
</div>