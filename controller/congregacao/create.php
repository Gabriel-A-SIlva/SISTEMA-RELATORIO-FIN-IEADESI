<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../../config/conexao_db.php';
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['status' => 'error', 'message' => 'Método não permitido']);
    exit;
}

$input = json_decode(file_get_contents('php://input'), true);
$id_area = $input['id_area'] ?? null;
$nome    = trim($input['nome'] ?? '');

if (!$id_area || empty($nome)) {
    echo json_encode(['status' => 'error', 'message' => 'Todos os campos são obrigatórios']);
    exit;
}

try {
    $stmt = $pdo->prepare("INSERT INTO congregacao (id_area, nome) VALUES (?, ?)");
    $stmt->execute([$id_area, $nome]);

    echo json_encode([
        'status'  => 'success',
        'message' => 'Congregação criada com sucesso',
        'data'    => ['id' => $pdo->lastInsertId(), 'nome' => $nome]
    ]);

} catch (PDOException $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erro no banco: ' . $e->getMessage()]);
}