<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../../config/conexao_db.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Método não permitido']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);
$area_numero = trim($input['area_numero'] ?? '');

if (empty($area_numero) || !is_numeric($area_numero)) {
    echo json_encode(['status' => 'error', 'message' => 'Número da área é obrigatório']);
    exit;
}

try {
    // Verifica se já existe
    $stmt = $pdo->prepare("SELECT id FROM area WHERE area_numero = ?");
    $stmt->execute([$area_numero]);
    if ($stmt->fetch()) {
        echo json_encode(['status' => 'error', 'message' => 'Esta área já existe']);
        exit;
    }

    $stmt = $pdo->prepare("INSERT INTO area (area_numero) VALUES (?)");
    $stmt->execute([$area_numero]);

    echo json_encode([
        'status'  => 'success',
        'message' => 'Área criada com sucesso',
        'data'    => ['id' => $pdo->lastInsertId(), 'area_numero' => $area_numero]
    ]);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erro no banco: ' . $e->getMessage()]);
}