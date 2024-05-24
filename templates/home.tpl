<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Water Supply</title>
    <style>
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
    </style>
    <script>
        function toggleChatbot() {
            const chatbot = document.getElementById('chatbot');
            chatbot.style.display = chatbot.style.display === 'none' ? 'block' : 'none';
        }

        function addChatbotMessage(message, sender) {
            const messages = document.getElementById('chatbot-messages');
            const messageElement = document.createElement('div');
            messageElement.textContent = message;
            messageElement.className = sender === 'user' ? 'text-right' : 'text-left';
            messages.appendChild(messageElement);
            messages.scrollTop = messages.scrollHeight;
        }

        function handleChatbotInput(event) {
            if (event.key === 'Enter') {
                const input = document.getElementById('chatbot-input');
                const userMessage = input.value;
                addChatbotMessage(userMessage, 'user');
                input.value = '';
                getChatbotResponse(userMessage);
            }
        }

        function handleQuestionClick(question) {
            addChatbotMessage(question, 'user');
            getChatbotResponse(question);
        }

        function getChatbotResponse(userMessage) {
            const responses = {
                "What is the EPA?": "The Environmental Protection Agency (EPA) is a U.S. federal agency that enforces regulations to protect the environment and public health.",
                "What does the Clean Water Act do?": "The Clean Water Act (CWA) aims to restore and maintain the integrity of the nation's waters through regulatory measures.",
                "What happened in Flint, Michigan?": "The Flint water crisis was a public health crisis that started in 2014 when the drinking water source for the city of Flint, Michigan was contaminated with lead."
            };

            if (responses[userMessage]) {
                setTimeout(() => {
                    addChatbotMessage(responses[userMessage], 'bot');
                }, 500);
            } else {
                setTimeout(() => {
                    addChatbotMessage("I'm sorry, I don't understand the question.", 'bot');
                }, 500);
            }
        }
    </script>
</head>
<body class="bg-white text-blue-900">
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
                <p>Under Democratic administrations, the EPA tends to enforce stricter regulations, while Republican administrations often prioritize deregulation to reduce the business burden.
                    Republicans argue that reducing regulations fosters economic growth and reduces costs for businesses.</p>
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
                <h2 class="text-2xl font-semibold">Data and Graphs</h2>
                <p>This section will display various graphs and data related to water supply management.</p>
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

</body>
</html>
