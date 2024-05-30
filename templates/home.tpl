<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@^2.0/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flowbite/dist/flowbite.bundle.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">
    <script type="text/javascript">
        // Assicurati che i dati siano correttamente codificati in JSON
    </script>
    <link rel="stylesheet" href="../style.css">
    <title>Water Supply</title>
    <style>
        canvas {
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);  /* Ombra sottile per un effetto di profondità */
        border: 1px solid #e3e3e3;                 /* Bordo sottile per definire i limiti del grafico */
        border-radius: 8px;                        /* Angoli arrotondati */
        background-color: #fff;                    /* Sfondo bianco per una migliore leggibilità */
        padding: 10px;                             /* Padding intorno al grafico */
        margin-top: 20px;
        }
        h2 {
            color: #1E40AF; /* Blu più scuro */
        }
        #chatbot {
            display: none;
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 300px;
            max-height: 400px;
            border: 1px solid #1E40AF;
            border-radius: 10px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow-y: auto;
            padding: 10px;
        }
        #chatbot-header {
            background-color: #1E40AF;
            color: white;
            padding: 10px;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        #chatbot-messages {
            padding: 10px;
            font-size: 14px;
            height: 300px;
            overflow-y: auto;
        }
        #chatbot-messages div {
            margin-bottom: 10px;
        }
        .chatbot-question {
            background-color: #1E40AF;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            margin: 5px 0;
            cursor: pointer;
            text-align: left;
        }
        .chatbot-question:hover {
            background-color: #3B82F6;
        }
        #chatbot-input {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #1E40AF;
            border-radius: 5px;
            margin-top: 10px;
        }
        #chatbot-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #1E40AF;
            color: white;
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 24px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Modifica delle dimensioni del font per le descrizioni */
        p {
            font-size: 1.2rem; /* Aumenta il font size a 1.2rem per le descrizioni */
        }
    </style>
    <?php
    require_once 'Model/UserRepository.php';
    $data = \Model\UserRepository::retrieveAnswer();
    $jsonData = json_encode($data);
    echo "<script>var graphData = $jsonData;</script>";
    ?>
</head>
<body class="bg-white text-blue-900">
<header class="navbar  bg-blue-100 w-full">
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
<div class="w-full">
    <header class="text-center py-5 bg-blue-100 w-full">
        <h1 class="text-3xl font-bold">Water Supply Management in America</h1>
        <p class="text-xl">An overview of the systems and challenges</p>
    </header>
    <div class="container mx-auto px-4">
        <main>
            <section class="my-6 text-center">
                <h2 class="text-2xl font-semibold">Introduction to EPA</h2>
                <p>The Environmental Protection Agency (EPA), established in 1970, enforces regulations aimed at protecting the environment and public health in the US. Key functions include regulation, research, and outreach.</p>
            </section>
            <section class="my-6 text-center">
                <h2 class="text-2xl font-semibold">Political Influence</h2>
                <p>Under Democratic administrations, the EPA tends to enforce stricter regulations, while Republican administrations often prioritize deregulation to reduce the business burden. Republicans argue that reducing regulations fosters economic growth and reduces costs for businesses.</p>
            </section>
            <section class="my-6 text-center">
                <h2 class="text-2xl font-semibold">Drinking Water Infrastructure</h2>
                <p>US drinking water infrastructure faces challenges like aging systems and inequitable access across communities, emphasizing the need for resilience and sustainability.</p>
            </section>
            <section class="my-6 text-center">
                <h2 class="text-2xl font-semibold">The Clean Water Act (CWA)</h2>
                <p>Enacted in 1972, the CWA aims to restore and maintain the integrity of the nation's waters, significantly improving water quality through regulatory measures.</p>
            </section>
            <section class="my-6 text-center">
                <h2 class="text-2xl font-semibold">Challenges and Crises</h2>
                <p>The aging infrastructure poses ongoing risks, exemplified by the Flint, Michigan crisis, underscoring the need for comprehensive reforms and investments.</p>
            </section>
            <section class="my-6 text-center">
                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">How many hours per day do you have access to water?</h2>
                        <p>Explore data on water access duration.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart1"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">How satisfied are you with the quality of your water supply? (1-10)</h2>
                        <p>Assess satisfaction levels with water quality.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart2"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">How often do you experience interruptions in your water supply? (times per week)</h2>
                        <p>Frequency of water supply interruptions.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart3"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">On a scale of 1 to 10, how would you rate the taste of your tap water?</h2>
                        <p>Evaluate the taste quality of tap water.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart4"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">Do you use any filtration system for your drinking water?</h2>
                        <p>Usage of filtration systems for drinking water.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart5"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">How much do you pay for water per month? (in currency)</h2>
                        <p>Monthly expenses on water supply.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart6"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">How often do you receive your water bill? (times per year)</h2>
                        <p>Frequency of receiving water bills annually.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart7"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">What is the main source of your water supply?</h2>
                        <p>Main sources of water supply.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart8"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">Have you experienced any water contamination issues in the past year?</h2>
                        <p>Incidence of water contamination issues.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart9"></canvas>
                    </div>
                </section>

                <section class="my-6 flex flex-wrap items-center justify-between">
                    <div class="w-full md:w-1/2 p-4">
                        <h2 class="text-2xl font-semibold">What improvements would you like to see in your water supply system?</h2>
                        <p>Desired improvements in water supply systems.</p>
                    </div>
                    <div class="w-full md:w-1/2 p-4">
                        <canvas id="chart10"></canvas>
                    </div>
                </section>

            </section>
        </main>
    </div>
    <footer class="text-center py-4 bg-blue-100 w-full">
        <p>© <?=date("Y")?> Pippus Management Systems. All rights reserved.</p>
    </footer>
</div>

<!-- Floating Chatbot Button and Chatbox -->
<button id="chatbot-button" onclick="toggleChatbot()">💬</button>
<div id="chatbot">
    <div id="chatbot-header">Chat with us!</div>
    <div id="chatbot-messages"></div>
    <div id="chatbot-questions" class="mt-4">
        <div class="chatbot-question" onclick="handleQuestionClick('What is the EPA?')">What is the EPA?</div>
        <div class="chatbot-question" onclick="handleQuestionClick('What does the Clean Water Act do?')">What does the Clean Water Act do?</div>
        <div class="chatbot-question" onclick="handleQuestionClick('What happened in Flint, Michigan?')">What happened in Flint, Michigan?</div>
    </div>
    <input id="chatbot-input" type="text" onkeypress="handleChatbotInput(event)" placeholder="Type your message here...">
</div>
<script>
    // Assumiamo che 'graphData' sia l'oggetto che hai caricato.
    const groupedData = [];

    // Raggruppare i dati per domanda_fk
    Object.values(graphData).forEach(item => {
        const fk = item.domanda_fk;
        if (!groupedData[fk]) {
            groupedData[fk] = [];
        }
        groupedData[fk].push({ x: item.ris_int, y: item.response_count });
    });

    // Utilizzare Chart.js per creare i grafici
    Object.entries(groupedData).forEach(([key, data]) => {
        const ctx = document.getElementById('chart' + key).getContext('2d');
        new Chart(ctx, {
            type: 'bar',  // Puoi cambiare il tipo di grafico qui, 'bar' per le barre, 'line' per lineare, ecc.
            data: {
                datasets: [{
                    label: 'Numero di risposte per la domanda ' + key,
                    data: data,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',  // Colore di sfondo delle barre
                    borderColor: 'rgba(75, 192, 192, 1)',        // Colore del bordo delle barre
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: {
                        type: 'linear',
                        position: 'bottom',
                        ticks: {
                            stepSize: 1,  // Assicurati che l'incremento sia di 1 per mostrare solo interi
                            beginAtZero: true
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            precision: 0  // Impedisce la visualizzazione di numeri decimali
                        }
                    }
                },
                plugins: {
                    legend: {
                        position: 'top',  // Posiziona la legenda sopra il grafico
                        labels: {
                            font: {
                                size: 14  // Dimensione del font per la legenda
                            }
                        }
                    },
                    tooltip: {
                        enabled: true,
                        mode: 'index',
                        intersect: false,
                        bodyFont: {
                            size: 14  // Dimensione del font per i tooltip
                        }
                    }
                }
            }
        });
    });
</script>
</div>
<script src="../script.js"></script>
</body>
</html>
