<form action="calculo.php" method="POST" class="p-3 mt-5 rounded border border-light-subtle container">
    <div class="form-group">
        <label for="nome" class="form-label">NOME (COMPLETO)</label>
        <input type="text" name="nome" id="nome" class="form-control" />
    </div>
    <div class="mt-2 form-group">
        <label for="idade" class="form-label">IDADE (ANOS)</label>
        <input type="number" step="1" min="0" name="idade" id="idade" class="form-control" />
    </div>
    <div class="mt-2 form-group">
        <label for="peso" class="form-label">PESO (QUILOS)</label>
        <input type="number" step="0.01" min="0" name="peso" id="peso" class="form-control" />
    </div>
    <div class="mt-2 form-group">
        <label for="altura" class="form-label">ALTURA (METROS)</label>
        <input type="number" step="0.01" min="0" name="altura" id="altura" class="form-control" />
    </div>
    <input type="submit" value="Consultar IMC" class="mt-2 btn btn-primary" />
</form>