<!doctype html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>CALCULADORA</title>
    <style>
        html {
            height: 100%;
            font-family: sans-serif;
        }

        body {
            margin: 0;
            box-sizing: border-box;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        form {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 0;
        }

        input,
        select {
            margin: 8px;
        }
    </style>
</head>

<body>
    <?php // O CÁLCULO DA OPERAÇÃO ESCOLHIDA É FEITA AQUI
    if (isset($_GET["n1"]) and isset($_GET["n2"]) and isset($_GET["op"])) {
        // PEGAR VALORES FORNECIDOS PELO FORMULÁRIO
        $x = (float) $_GET["n1"];
        $y = (float) $_GET["n2"];
        $o = (int)   $_GET["op"];
    } else {
        $x = 0;
        $y = 0;
        $o = 0;
    }

    $r = 0;
    $s = "";
    $e = 0;

    switch ($o) {
        case 1:
            $s = "+";
            $r = $x + $y;
            break;

        case 2:
            $s = "-";
            $r = $x - $y;
            break;

        case 3:
            $r = $x * $y;
            $s = "×";
            break;

        case 4:
            $s = "÷";
            // NÃO PODE DIVIDIR POR ZERO
            if ($y != 0) $r = $x / $y;
            else $e = 1;
            break;

        case 5:
            $s = "^";
            // NÃO PODE ELEVAR ZERO A ZERO
            if (($x == $y and $x == 0) or ($x == 0 and $y < 0)) $e = 1;
            // NÃO PODE ELEVAR UM NÚMERO NEGATIVO A UMA FRAÇÃO
            else if ($x < 0 and $y - (int)$y != 0) $e = 2;
            else $r = $x ** $y;
            break;

        case 6:
            $s = "√";
            // A RAIZ NÃO PODE SER ZERO
            if ($x == 0) $e = 1;
            // NÃO PODE TIRAR RAIZ PAR DE UM NÚMERO MENOR QUE ZERO
            else if ($x % 2 == 0 and $y < 0) $e = 2;
            // INVERTER O SINAL DE Y SE FOR MENOR QUE ZERO
            else $r = $y < 0 ? -abs($y) ** (1 / $x) : $y ** (1 / $x);
            break;

        default:
            $e = -1;
            break;
    }

    switch ($e) {
        case 0:
            echo "<div>$x $s $y = $r</div><br/>";
            break;
        case 1:
            echo "<div>$x $s $y é indefinido</div><br/>";
            break;
        case 2:
            echo "<div>$x $s $y é irreal</div><br/>";
            break;
        default:
            echo "<div>...</div><br/>";
            break;
    }
    ?>
    <form>
        <input name="n1" type="number" step="0.000000000000001" <?php if (isset($_GET["n1"])) echo "value='" . $_GET["n1"] . "'"; ?> required /><br />
        <select name="op" required>
            <option <?php if (!isset($_GET["op"])) echo "selected"; ?> value="0">Selecione a Operação</option>
            <option <?php if (isset($_GET["op"]) and $_GET["op"] == 1) echo "selected"; ?> value="1">Adição</option>
            <option <?php if (isset($_GET["op"]) and $_GET["op"] == 2) echo "selected"; ?> value="2">Subtração</option>
            <option <?php if (isset($_GET["op"]) and $_GET["op"] == 3) echo "selected"; ?> value="3">Multiplicação</option>
            <option <?php if (isset($_GET["op"]) and $_GET["op"] == 4) echo "selected"; ?> value="4">Divisão</option>
            <option <?php if (isset($_GET["op"]) and $_GET["op"] == 5) echo "selected"; ?> value="5">Potenciação</option>
            <option <?php if (isset($_GET["op"]) and $_GET["op"] == 6) echo "selected"; ?> value="6">Radiciação</option>
        </select><br />
        <input name="n2" type="number" step="0.000000000000001" <?php if (isset($_GET["n2"])) echo "value='" . $_GET["n2"] . "'"; ?> required /><br />
        <input type="submit" />
    </form>
    <script>
        const form = document.getElementsByTagName("form")[0];
        form.addEventListener("submit", e => {
            if (e.target.elements["op"].value == 0) e.preventDefault();
        });
    </script>
</body>

</html>