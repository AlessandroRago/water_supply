
document.addEventListener("DOMContentLoaded", function() {
    const element = document.getElementById("animated-element");
    element.style.animationPlayState = "running";

    const passwordInput = document.getElementById("password");
    const togglePassword = document.getElementById("toggle-password");

    togglePassword.addEventListener("click", function() {
        const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
        passwordInput.setAttribute("type", type);
        this.classList.toggle("text-gray-400");
        this.classList.toggle("text-gray-600");
    });
});
