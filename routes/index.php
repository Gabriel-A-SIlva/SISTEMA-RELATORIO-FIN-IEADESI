<?php

// --------------------------------------------------
// Inicialização
// --------------------------------------------------
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$uri = rtrim($uri, '/');
$uri = $uri === '' ? '/' : $uri;


// --------------------------------------------------
// 1️⃣ ROTAS HTML (APENAS 3)
// --------------------------------------------------

// Rota da página principal
if ($uri === '/') {
    require_once __DIR__ . '/../page/index.php';
    exit;
}

// --------------------------------------------------
// ROTAS DE INTERFACE (API para o fetch do JS)
// --------------------------------------------------
if (strpos($uri, '/admin/cadastros/get-interface/') === 0) {
    $section = str_replace('/admin/cadastros/get-interface/', '', $uri);
    $filePath = __DIR__ . "/../page/admin/interfaces/cadastros/interface-{$section}.html";

    if (file_exists($filePath)) {
        header('Content-Type: text/html');
        readfile($filePath);
        exit;
    } else {
        http_response_code(404);
        echo "Interface não encontrada: {$section}";
        exit;
    }
}
// --------------------------------------------------
// 2️⃣ ROTAS DE CONTROLLER AUTOMÁTICAS (AJUSTADAS)
// --------------------------------------------------
$segments = array_values(array_filter(explode('/', trim($uri, '/'))));

$allowedAreas = ['client', 'admin', 'main'];

if (count($segments) >= 2) {
    $area = $segments[0];

    if (!in_array($area, $allowedAreas, true)) {
        // Área não permitida
        http_response_code(404);
        echo '404 - Área não permitida';
        exit;
    }

    if ($area === 'admin' && count($segments) >= 4) {
        // Admin mantém o esquema antigo: /admin/subarea/entity/action
        [$area, $subarea, $entity, $action] = $segments;
        $controllerPath = dirname(__DIR__) 
            . "/controller/{$area}/{$subarea}/{$entity}/{$action}.php";
    } else {
        // Client ou Main: esquema reduzido /client/auth/arquivo
        [$area, $subarea, $action] = $segments;
        $controllerPath = dirname(__DIR__) 
            . "/controller/{$area}/{$subarea}/{$action}.php";
    }

    if (is_file($controllerPath)) {
        require $controllerPath;
        exit;
    }
}

// --------------------------------------------------
// 3️⃣ 404 FINAL
// --------------------------------------------------
http_response_code(404);
echo '404 - Rota não encontrada';
exit;