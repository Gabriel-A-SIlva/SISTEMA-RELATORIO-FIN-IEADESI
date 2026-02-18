<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Gera um token CSRF se ainda não existir
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// Função para inserir o campo CSRF no formulário
function csrf_input()
{
    $token = htmlspecialchars($_SESSION['csrf_token']);
    echo "<input type='hidden' name='csrf_token' value='$token'>";
}

// Função para verificar se o token enviado é válido
function verificar_csrf_token($token_form)
{
    return isset($_SESSION['csrf_token']) && hash_equals($_SESSION['csrf_token'], $token_form);
}
