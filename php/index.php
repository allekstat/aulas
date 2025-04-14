<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous"/>
</head>
<body>
    <form action="calculo.php" method="POST" class="mt-5 container">
        <div class="form-group">
            <label for="nome" class="form-label">NOME (COMPLETO)</label>
            <input type="text" name="nome" id="nome" class="form-control"/>
        </div>
        <div class="mt-2 form-group">
            <label for="idade" class="form-label">IDADE (ANOS)</label>
            <input type="number" step="1" min="0" name="idade" id="idade" class="form-control"/>
        </div>
        <div class="mt-2 form-group">
            <label for="peso" class="form-label">PESO (QUILOS)</label>
            <input type="number" step="0.01" min="0" name="peso" id="peso" class="form-control"/>
        </div>
        <div class="mt-2 form-group">
            <label for="altura" class="form-label">ALTURA (METROS)</label>
            <input type="number" step="0.01" min="0" name="altura" id="altura" class="form-control"/>
        </div>
        <input type="submit" value="Consultar IMC" class="mt-2 btn btn-primary">
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>