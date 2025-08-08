<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <meta http-equiv="refresh" content="1" />
  <link rel="stylesheet" href="./estilos.css" />
  <title>Rede Social</title>
</head>

<body>
  <nav>
    <a href="./inicio.php">Página Inicial</a>
    <a href="./sobre.php">Página Sobre</a>
  </nav>
  <main>
    <?php
    if (isset($_COOKIE["nome"])) echo "Boa noite " . $_COOKIE["nome"] . ".";
    else if (isset($_GET["nome"])) setcookie("nome", $_GET["nome"]);
    //asdasd ?nome=Alexsander
    /**/
    // $nome = 1;
    //echo "alex" . "$nome" . "sander";
    ?>
  </main>
</body>

</html>
