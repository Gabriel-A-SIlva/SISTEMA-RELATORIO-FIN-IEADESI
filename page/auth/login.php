<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Acesso Corporativo | NextGen</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="/assets/admin/Css/auth/index.css">
</head>

<body>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    <div class="blob blob-3"></div>

    <div class="toast" id="toast">
        <i class="fas fa-info-circle"></i>
        <span id="toastMsg">Mensagem aqui</span>
    </div>

    <div class="login-card">
        <div class="header">
            <h1>Bem-vindo</h1>
            <p>
                Insira suas credenciais corporativas para acessar o
                sistema.
            </p>
        </div>

        <form id="loginForm">
            <div class="input-group">
                <i class="fas fa-map-marker-alt input-icon"></i>
                <select id="polo" name="polo" class="input-field" required>

                    <option value="" disabled selected></option>
                    <option value="Cajazeiras">Cajazeiras</option>
                    <option value="Palmeira">Palmeira</option>
                    <option value="Remoto">Remoto</option>
                </select>
                <label class="floating-label">Selecione seu Polo</label>
            </div>

            <div class="input-group">
                <i class="far fa-envelope input-icon"></i>
                <input type="email" id="email" name="email" class="input-field" required />
                <label class="floating-label">Email Corporativo</label>
            </div>

            <div class="input-group">
                <i class="fas fa-lock input-icon"></i>
                <input type="password" id="senha" name="senha" class="input-field" required />
                <label class="floating-label">Sua Senha</label>
                <i class="far fa-eye toggle-password" id="togglePassword"></i>
            </div>

            <button type="submit" class="btn-login" id="submitBtn">
                <div class="btn-content">
                    <span id="btnText">Acessar Sistema</span>
                    <div class="loader"></div>
                </div>
            </button>
        </form>
    </div>

    <script>
        document.getElementById("loginForm").addEventListener("submit", function (e) {
            e.preventDefault();

            const btn = document.getElementById("submitBtn");
            const btnText = document.getElementById("btnText");
            const loader = document.querySelector(".loader");
            const form = e.target;

            btnText.style.display = "none";
            loader.style.display = "block";
            btn.disabled = true;
            btn.style.cursor = "wait";

            const formData = new FormData(form);

            fetch('/admin/core/auth/login', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    if (response.redirected) {
                        window.location.href = response.url;
                        return;
                    }
                    return response.text();
                })
                .then(data => {
                    if (data) {
                        showToast(data, "error");
                        loader.style.display = "none";
                        btnText.style.display = "block";
                        btn.disabled = false;
                        btn.style.cursor = "pointer";
                    }
                })
                .catch(error => {
                    console.error('Erro:', error);
                    showToast("Erro de conexão com o servidor.", "error");

                    loader.style.display = "none";
                    btnText.style.display = "block";
                    btn.disabled = false;
                    btn.style.cursor = "pointer";
                });
        });
        const togglePassword = document.getElementById("togglePassword");
        const passwordInput = document.getElementById("senha");

        togglePassword.addEventListener("click", function () {
            const type =
                passwordInput.getAttribute("type") === "password"
                    ? "text"
                    : "password";
            passwordInput.setAttribute("type", type);
            this.classList.toggle("fa-eye");
            this.classList.toggle("fa-eye-slash");
        });

        function showToast(message, type) {
            const toast = document.getElementById("toast");
            const msg = document.getElementById("toastMsg");
            const icon = toast.querySelector("i");

            msg.textContent = message;

            toast.className = "toast";
            void toast.offsetWidth;

            toast.classList.add("active", type);

            if (type === "success") {
                icon.className = "fas fa-check-circle";
            } else {
                icon.className = "fas fa-exclamation-circle";
            }

            setTimeout(() => {
                toast.classList.remove("active");
            }, 3000);
        }
    </script>
</body>

</html>