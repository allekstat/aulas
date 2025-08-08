<form>
  <fieldset >
    <legend>Calculadora</legend>
    <div class="mb-3">
      <label class="form-label">Numero 1</label>
      <input type="number" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Numero 2</label>
      <input type="number" class="form-control">
    </div>
    <div class="mb-3">
      <label class="form-label">Operacao</label>
      <select class="form-select">
      <option selected value="0">Selecione a Operação</option>
       <option value="adicao">Adição</option>
       <option value="subtracao">Subtração</option>
       <option value="multiplicacao">Multiplicação</option>
       <option value="divisao">Divisão</option>
      </select>
    </div>
    <button type="submit" class="btn btn-primary">Calcular</button>
  </fieldset>
</form>