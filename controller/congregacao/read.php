<?php
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/../../config/conexao_db.php';

$areaId = isset($_GET['area_id']) && $_GET['area_id'] !== '' ? (int)$_GET['area_id'] : null;

try {
    if ($areaId) {
        $stmt = $pdo->prepare("
            SELECT c.id, c.nome, a.area_numero 
            FROM congregacao c 
            JOIN area a ON c.id_area = a.id 
            WHERE c.id_area = ? 
            ORDER BY c.nome ASC
        ");
        $stmt->execute([$areaId]);
    } else {
        $stmt = $pdo->query("
            SELECT c.id, c.nome, a.area_numero 
            FROM congregacao c 
            JOIN area a ON c.id_area = a.id 
            ORDER BY a.area_numero ASC, c.nome ASC
        ");
    }

    $congregacoes = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'status' => 'success',
        'data' => $congregacoes
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'status' => 'error',
        'message' => 'Erro ao carregar congregações: ' . $e->getMessage()
    ]);
}
?>