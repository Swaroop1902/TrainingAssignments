const questions = [
    { question: "What is the output of `console.log(2 + 2)`?", options: ["3", "4", "5", "6"], answer: "4" },
    { question: "Which keyword is used to declare a variable in JavaScript?", options: ["var", "let", "const", "All of the above"], answer: "All of the above" },
    { question: "What is the correct syntax to create a function in JavaScript?", options: ["function myFunction()", "def myFunction()", "func myFunction()", "create myFunction()"], answer: "function myFunction()" },
    { question: "Which of the following is a JavaScript framework?", options: ["React", "Laravel", "Django", "Flask"], answer: "React" },
    { question: "How do you write a comment in JavaScript?", options: ["// This is a comment", "<!-- This is a comment -->", "# This is a comment", "/* This is a comment */"], answer: "// This is a comment" },
    { question: "What is the output of `typeof null` in JavaScript?", options: ["null", "object", "undefined", "number"], answer: "object" },
    { question: "Which method is used to add an element to the end of an array in JavaScript?", options: ["push()", "pop()", "shift()", "unshift()"], answer: "push()" },
    { question: "What is the correct way to write an array in JavaScript?", options: ["var colors = ['red', 'green', 'blue']", "var colors = 'red', 'green', 'blue'", "var colors = (1:'red', 2:'green', 3:'blue')", "var colors = {'red', 'green', 'blue'}"], answer: "var colors = ['red', 'green', 'blue']" },
    { question: "Which event occurs when the user clicks on an HTML element?", options: ["onchange", "onclick", "onmouseover", "onmouseclick"], answer: "onclick" },
    { question: "How do you declare a JavaScript variable?", options: ["var carName;", "variable carName;", "v carName;", "var = carName;"], answer: "var carName;" }
];

let currentQuestionIndex = 0;
let score = 0;
let timer;
let timeLeft = 90;

function startQuiz() {
    const name = document.getElementById('name-input').value;
    if (name.trim() === "") {
        alert("Please enter your name");
        return;
    }
    document.getElementById('start-screen').style.display = 'none';
    document.getElementById('quiz-screen').style.display = 'block';
    showQuestion();
    startTimer();
}

function showQuestion() {
    const question = questions[currentQuestionIndex];
    document.getElementById('question').innerText = question.question;
    const options = document.getElementById('options');
    options.innerHTML = '';
    question.options.forEach(option => {
        const button = document.createElement('button');
        button.innerText = option;
        button.onclick = () => selectOption(option);
        options.appendChild(button);
    });
}

function selectOption(option) {
    const question = questions[currentQuestionIndex];
    if (option === question.answer) {
        score++;
    }
    nextQuestion();
}

function nextQuestion() {
    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length) {
        showQuestion();
        resetTimer();
    } else {
        endQuiz();
    }
}

function startTimer() {
    timer = setInterval(() => {
        timeLeft--;
        document.getElementById('time').innerText = timeLeft;
        if (timeLeft <= 0) {
            nextQuestion();
        }
    }, 1000);
}

function resetTimer() {
    clearInterval(timer);
    timeLeft = 90;
    document.getElementById('time').innerText = timeLeft;
    startTimer();
}

function endQuiz() {
    clearInterval(timer);
    document.getElementById('quiz-screen').style.display = 'none';
    document.getElementById('result-screen').style.display = 'block';
    document.getElementById('result').innerText = `You scored ${score} out of ${questions.length}`;

    // Calculate and update the progress bar
    const progressBar = document.getElementById('progress-bar');
    const scorePercentage = (score / questions.length) * 100;
    progressBar.style.width = `${scorePercentage}%`;
}
