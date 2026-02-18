<!doctype html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Lanchonete - Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet" />
    <!-- Basic Icons -->
    <link href="https://cdn.boxicons.com/3.0.8/fonts/basic/boxicons.min.css" rel="stylesheet">
    <!-- Filled Icons -->
    <link href="https://cdn.boxicons.com/3.0.8/fonts/filled/boxicons-filled.min.css" rel="stylesheet">
    <!-- Brand Icons -->
    <link href="https://cdn.boxicons.com/3.0.8/fonts/brands/boxicons-brands.min.css" rel="stylesheet">

    <link rel="stylesheet" href="/assets/Css/index.css" />
    <!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</head>

<body>
    <div class="container">

        <?php include __DIR__ . '/layout/sidebar.php'; ?>

        <main class="main">
            <div id="section_dashboard_main" class="section_lista">
                <?php include __DIR__ . '/interfaces/dashboard/interface-dashboard.php'; ?>
            </div>

            <div id="section_registro_main" class="section_lista" style="display:none;">
                <?php include __DIR__ . '/interfaces/registro/interface-registro.php'; ?>
            </div>

            <div id="section_relatorio_main" class="section_lista" style="display:none;">
                <?php include __DIR__ . '/interfaces/relatorio/interface-relatorio.php'; ?>
            </div>

        </main>
        <div id="global_toast" class="toast" aria-live="polite" role="status"></div>
    </div>
    <script>
    document.addEventListener("DOMContentLoaded", function() {

        const buttons = document.querySelectorAll(".btn_open");
        const sections = document.querySelectorAll(".section_lista");

        function ativar(targetId) {

            // Esconde sections
            sections.forEach(section => {
                section.style.display = "none";
            });

            // Remove active de TODOS os LI
            document.querySelectorAll(".navigation ul li")
                .forEach(li => li.classList.remove("active"));

            // Mostra section alvo
            const targetDiv = document.getElementById(targetId);
            if (!targetDiv) return;

            targetDiv.style.display = "block";

            // Pega botão correspondente
            const btnAtivo = document.querySelector(
                `.btn_open[data-target="${targetId}"]`
            );

            if (btnAtivo) {
                // 🔥 adiciona active no LI pai
                btnAtivo.closest("li").classList.add("active");
            }
        }

        // Eventos
        buttons.forEach(button => {
            button.addEventListener("click", () => {
                ativar(button.dataset.target);
            });
        });

        // 🔥 Inicia já ativando Dashboard
        ativar("section_dashboard_main");

    });
    </script>

    <script type="module" src="/assets/Js/index.js"></script>
</body>

</html>