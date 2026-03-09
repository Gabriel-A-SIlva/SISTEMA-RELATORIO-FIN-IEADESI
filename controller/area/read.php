<?php
header('Content-Type: application/json');
require __DIR__ . '/../../config/conexao_db.php';

try {

    $stmt = $pdo->prepare("SELECT id, area_numero FROM area ORDER BY area_numero ASC");
    $stmt->execute();

    $areas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'status' => 'success',
        'data' => $areas
    ]);

} catch (Exception $e) {

    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Erro ao buscar áreas'
    ]);
}