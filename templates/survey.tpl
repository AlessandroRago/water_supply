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



<div class="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
    <div class="mx-auto max-w-lg text-center">
        <h1 class="text-2xl font-bold sm:text-3xl">Welcome to this survey!</h1>

        <p class="mt-4 text-gray-500">
            In this survey you'll have to answer a series of questions about the water supply in your country.
            Your help is fundamental for the realization of this project.
            Thank you for your participation
        </p>
    </div>

    <form action="index.php?action=survey" method="post" class="mx-auto mb-0 mt-8 max-w-md space-y-4">
        <?php foreach($domande as $domanda): ?>
        <label for="steps-range" class="block mb-2 text-sm font-medium text-gray-900 "><?= $domanda['testo'] ?></label>
        <?php if($domanda['is_int']): ?>
        <div class="relative mb-6">

            <input
                    id="steps-range"
                    type="range"
                    min="1"
                    max="7"
                    value="4"
                    step="1"
                    class="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer dark:bg-gray-700"
                    name="<?=$domanda['id']?>"
                    required
            >
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-0 -bottom-6">Min 1</span>
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-1/4 -translate-x-9 rtl:translate-x-1/2 -bottom-6">2</span>
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-1/3 -translate-x-1/2 rtl:translate-x-1/2 -bottom-6">3</span>
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-1/2 -translate-x-1/2 rtl:translate-x-1/2 -bottom-6">4</span>
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-2/3 -translate-x-1/2 rtl:translate-x-1/2 -bottom-6">5</span>
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute start-3/4 translate-x-7 rtl:translate-x-1/2 -bottom-6">6</span>
            <span class="text-sm text-gray-500 dark:text-gray-400 absolute end-0 -bottom-6">Max 7</span>
        </div>
<!--
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
-->

        <?php else: ?>

        <div class="relative">
            <input
                    type="text"
                    class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-sm"
                    placeholder="Enter your answer"
                    name="<?=$domanda['id']?>"
                    required
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

