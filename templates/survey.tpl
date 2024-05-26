<?php
/**
 * Questo commento serve solo a eliminare l'indicazione di errore
 * da parte di PHPStorm per la variabile $studenti
 * @var $todos
 * @var $testo
 * @var $id
 * @var $importanza
 * @var $displayed_name
 */
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Document</title>
</head>
<body>
<header class="navbar">
    <section class="navbar-section">

    </section>

    <section class="navbar-section">
        <span class="label label-rounded label-primary m-2">
            Hello <?=$displayed_name?>
        </span>
        <button class="btn btn-action tooltip tooltip-bottom" data-tooltip="Logout">
            <a href="index.php?action=logout">
                <i class="icon icon-share"></i>
            </a>
        </button>
    </section>
</header>

<form action="index.php" method="post">

<?php foreach($domande as $domanda): ?>
    <?= $domanda['testo'] ?>
<?php if($domanda['is_int']): ?>
    <input type="number" name="<?=$domanda['id']?>">
    <?php else: ?>
    <input type="text" name="<?=$domanda['id']?>">
    <?php endif; ?>
    <br>
<?php endforeach; ?>
<input type="submit">
</form>
<!--
  Heads up! 👋

  Plugins:
    - @tailwindcss/forms
-->

<div class="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
    <div class="mx-auto max-w-lg text-center">
        <h1 class="text-2xl font-bold sm:text-3xl">Get started today!</h1>

        <p class="mt-4 text-gray-500">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Et libero nulla eaque error neque
            ipsa culpa autem, at itaque nostrum!
        </p>
    </div>

    <form action="index.php?action=survey" method="post" class="mx-auto mb-0 mt-8 max-w-md space-y-4">
        <?php foreach($domande as $domanda): ?>
        <p class="mt-4 text-gray-500">
            <?= $domanda['testo'] ?>
        </p>
        <?php if($domanda['is_int']): ?>

        <div class="relative">
            <input
                    type="number"
                    class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
                    placeholder="Enter number"
                    name="<?=$domanda['id']?>"
            />

            <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
        </span>
        </div>


        <?php else: ?>
        <div class="relative">
            <input
                    type="text"
                    class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
                    placeholder="Enter your answer"
                    name="<?=$domanda['id']?>"
            />

            <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
        </span>
        </div>
        <?php endif; ?>
        <br>
        <?php endforeach; ?>

        <div class="flex items-center justify-between">
            <button
                    type="submit"
                    class="inline-block rounded-lg bg-blue-500 px-5 py-3 text-sm font-medium text-white"
            >
                Submit
            </button>

    </form>
</div>
</body>
</html>

