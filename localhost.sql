-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 19/02/2026 às 17:43
-- Versão do servidor: 5.7.23-23
-- Versão do PHP: 8.1.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gab76941_MANA`
--
CREATE DATABASE IF NOT EXISTS `gab76941_MANA` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `gab76941_MANA`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `adicionais_grupos`
--

CREATE TABLE `adicionais_grupos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('single','multiple') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `adicionais_grupos`
--

INSERT INTO `adicionais_grupos` (`id`, `titulo`, `tipo`, `ativo`, `created_at`) VALUES
(6, 'Deseja colher?', 'single', 1, '2026-02-09 02:32:34'),
(10, 'Pudim', 'single', 1, '2026-02-19 14:30:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `adicionais_opcoes`
--

CREATE TABLE `adicionais_opcoes` (
  `id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `adicionais_opcoes`
--

INSERT INTO `adicionais_opcoes` (`id`, `grupo_id`, `titulo`, `preco`, `imagem`, `ativo`, `created_at`) VALUES
(10, 6, 'Sim', 0.00, '/media/adicionais/69894742e3363.jpg', 1, '2026-02-09 02:32:34'),
(11, 6, 'Não ', 0.00, '/media/adicionais/69894742e3b08.jpg', 1, '2026-02-09 02:32:34'),
(17, 10, 'Pudim ', 5.00, '/media/adicionais/69971e7972045.jpg', 1, '2026-02-19 14:30:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha_acesso` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_restaurante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `admin`
--

INSERT INTO `admin` (`id`, `nome`, `senha_acesso`, `id_restaurante`) VALUES
(1, 'mana_root', '$2y$10$hXlQTFXKFhXWoDg9V7Yrx.8Sgj49yh0Awhqw9iOynpH.9PJ3HTXjO', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `arroz`
--

CREATE TABLE `arroz` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardapio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `arroz`
--

INSERT INTO `arroz` (`id`, `nome`, `cardapio`, `imagem`, `ativo`) VALUES
(17, 'Arroz Branco', '18', '/media/arroz/arroz-branco-1767630811.jpg', 1),
(19, 'Arroz de cuxá ', '18', '/media/arroz/arroz-de-cux----1770727593.jpg', 0),
(20, 'Arroz de Cenoura ', '18', '/media/arroz/arroz-de-cenoura--1770904578.jpg', 1),
(21, 'Arroz Baião ', '18', '/media/arroz/arroz-bai--o--1770991727.jpg', 0),
(22, 'Arroz de abóbora ', '18', '/media/arroz/arroz-de-ab--bora--1771162161.webp', 0),
(24, 'Arroz Maria isabel ', '18', '/media/arroz/arroz-maria-isabel--1771333903.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `bairros`
--

CREATE TABLE `bairros` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `bairros`
--

INSERT INTO `bairros` (`id`, `nome`, `valor_frete`, `created_at`, `updated_at`, `ativo`) VALUES
(78, 'Adelaide Cabral', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(79, 'Aeroporto', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(80, 'Alto do Olegário', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(81, 'Angelim', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(82, 'Bairro do Céu', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(83, 'Barretinho', 5.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(84, 'Canaã', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(85, 'Canecão', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(86, 'Centro', 5.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(87, 'Cohab', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(88, 'Condomínio 3 Corações', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(89, 'Condomínio Casa e Jardim', 5.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(90, 'Condomínio Colina Park', 12.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(91, 'Condomínio Gran Valle', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(92, 'Condomínio Vale do Pindaré', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(93, 'Conjunto da Vale', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(94, 'Cultia Pelada', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(95, 'Edmundo Rios', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(96, 'Esplanada', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(97, 'IEMA Santa Inês', 10.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(98, 'IFMA', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(99, 'Residencial Brasil', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(100, 'Residencial Campo Verde', 10.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(101, 'Sabbak', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(102, 'Santa Filomena', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(103, 'Santa Helena', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(104, 'Santo Antônio', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(105, 'São Benedito', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(106, 'São Cristóvão', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(107, 'Sinaps', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(108, 'Sol Nascente', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(109, 'Uema', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(110, 'Vila Cabral', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(111, 'Vila Adelaide Cabral', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(112, 'Vila Conceição', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(113, 'Vila Davi', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(114, 'Vila Edmundo Rios', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(115, 'Vila Embratel', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(116, 'Vila Marcony', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(117, 'Vila Marconi', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(118, 'Vila Militar', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(119, 'Vila Olímpia', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(120, 'Vila Parente', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(121, 'Vila Ritinha', 12.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(122, 'Coheb', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(123, 'Nova Santa Inês', 5.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(124, 'Itapec', 10.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(125, 'Jardim Abreu', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(126, 'Jardim Brasília', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(127, 'Jardim Magnólia', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(128, 'Jardim Nova Era', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(129, 'Jardim Tropical', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(130, 'Laranjeiras', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(131, 'Loteamento Carajás', 12.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(132, 'Macrorregional', 10.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(133, 'Mercado Municipal', 5.50, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(134, 'Mutirão', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(135, 'Noja Jerusalém', 12.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(136, 'Núcleo da Vale', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(137, 'Oásis', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(138, 'Paládios', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(139, 'Palmeiras', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(140, 'Parque das Palmeiras', 12.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(141, 'Parque Pra Morar 1', 12.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(142, 'Parque Pra Morar 2', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(143, 'Parque Santa Cruz', 7.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(144, 'Pinheiro Park', 6.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(145, 'Pequizeiro', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(146, 'Poeirão', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(147, 'Polo Industrial', 10.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(148, 'Posto 7', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(149, 'Posto Felipão', 15.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(150, 'Posto Shell', 8.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(151, 'Povoado São Raimundo', 20.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1),
(152, 'Alto do Bode', 20.00, '2026-02-10 14:21:53', '2026-02-10 14:21:53', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `bebida`
--

CREATE TABLE `bebida` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `bebida`
--

INSERT INTO `bebida` (`id`, `categoria`, `nome`, `valor`, `imagem`, `ativo`) VALUES
(69, 'refrigerante-350ml', 'Coca-Cola', 5.00, NULL, 1),
(70, 'refrigerante-350ml', 'Coca-Cola 0', 5.00, NULL, 1),
(71, 'refrigerante-350ml', 'Fanta Laranja', 5.00, NULL, 1),
(72, 'refrigerante-350ml', 'Jesus ', 5.00, NULL, 1),
(73, 'refrigerante-350ml', 'Guaraná Kaut', 5.00, NULL, 1),
(74, 'refrigerante-350ml', 'Fanta Uva', 5.00, NULL, 1),
(75, 'agua-sem-gas', 'Água sem Gás', 3.00, NULL, 1),
(76, 'Água-com-Gás', 'água com Gás ', 4.00, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `criado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tema` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'claro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `criado_em`, `tema`) VALUES
(6, 'Gabriel alves da silva', '98985327694', '2026-02-10 10:48:41', 'claro'),
(7, 'Denize Lima', '98991281083', '2026-02-10 11:39:28', 'claro'),
(8, 'Cristhian', '98981049849', '2026-02-10 11:57:01', 'claro'),
(9, 'Ingride', '98985099296', '2026-02-12 12:17:21', 'claro'),
(10, 'Emilly', '98985795079', '2026-02-12 14:00:06', 'claro'),
(11, 'Leonardo', '98991135436', '2026-02-13 14:46:41', 'claro'),
(12, 'Warmysson', '98982059425', '2026-02-14 11:36:27', 'claro'),
(13, 'Eliane Rodrigues', '98992249941', '2026-02-14 11:53:29', 'claro'),
(14, 'Carla Mayrla', '98987348900', '2026-02-14 12:23:38', 'claro'),
(15, 'Gleyciane', '98891014274', '2026-02-14 12:58:26', 'claro'),
(16, 'Heloisa', '98984643215', '2026-02-14 13:44:42', 'claro'),
(17, 'Ronilson', '98989913492', '2026-02-14 13:58:11', 'claro'),
(18, 'Larissa', '98985798242', '2026-02-15 14:12:06', 'claro'),
(19, 'Thays klissman', '98970041099', '2026-02-16 12:20:08', 'claro'),
(20, 'Érica', '98985234876', '2026-02-17 10:25:54', 'claro'),
(21, 'Ana', '98985192937', '2026-02-17 11:41:36', 'claro'),
(22, 'João', '98985841480', '2026-02-17 12:14:46', 'claro'),
(23, 'Vanessa', '98984474048', '2026-02-18 11:13:52', 'claro'),
(24, 'Antônio Carlos', '98981220698', '2026-02-18 11:37:44', 'claro'),
(25, 'Cristiane Coelho', '99985063420', '2026-02-18 11:38:33', 'claro'),
(26, 'Mário Oliveira', '98991824074', '2026-02-18 11:50:21', 'claro'),
(27, 'restauranre', '9884346229', '2026-02-19 12:05:36', 'claro'),
(28, 'Rainara', '98988242976', '2026-02-19 13:11:01', 'claro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `combo`
--

CREATE TABLE `combo` (
  `id` int(10) UNSIGNED NOT NULL,
  `proteina` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arroz` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feijao` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salada` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bebida` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `farofa` tinyint(1) NOT NULL DEFAULT '0',
  `macarrao` tinyint(1) NOT NULL DEFAULT '0',
  `colher` tinyint(1) NOT NULL DEFAULT '0',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `complemento`
--

CREATE TABLE `complemento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardapio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `complemento`
--

INSERT INTO `complemento` (`id`, `nome`, `cardapio`, `imagem`, `ativo`) VALUES
(48, 'Macarrão ', '18', '/media/complemento/macarr--o--1770728228.jpg', 1),
(49, 'Farofa ', '18', '/media/complemento/farofa--1770728294.jpg', 1),
(50, 'Macaxeira frita ', '25', '/media/complemento/macaxeira-frita--1771334187.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracao_entrega`
--

CREATE TABLE `configuracao_entrega` (
  `id_config_entrega` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  `retirada_balcao` tinyint(1) DEFAULT '0',
  `delivery_ativo` tinyint(1) DEFAULT '1',
  `frete_gratis` tinyint(1) DEFAULT '0',
  `frete_taxa_fixa` tinyint(1) DEFAULT '0',
  `valor_frete_fixo` decimal(10,2) DEFAULT NULL,
  `frete_sob_consulta` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `configuracao_entrega`
--

INSERT INTO `configuracao_entrega` (`id_config_entrega`, `id_restaurante`, `retirada_balcao`, `delivery_ativo`, `frete_gratis`, `frete_taxa_fixa`, `valor_frete_fixo`, `frete_sob_consulta`) VALUES
(1, 1, 1, 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dados_pix`
--

CREATE TABLE `dados_pix` (
  `id_pix` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  `destinatario` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chave_pix` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `dados_pix`
--

INSERT INTO `dados_pix` (`id_pix`, `id_restaurante`, `destinatario`, `chave_pix`) VALUES
(1, 1, 'Wefferson Cristhian', '98981233857');

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo_entrega` enum('entrega','retirada') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'entrega',
  `rua` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obs` text COLLATE utf8mb4_unicode_ci,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `endereco_cliente`
--

INSERT INTO `endereco_cliente` (`id`, `cliente_id`, `tipo_entrega`, `rua`, `numero`, `bairro`, `obs`, `criado_em`, `atualizado_em`) VALUES
(136, 6, 'entrega', 'Vital Brasil', '816', 'Sabbak', 'Atrás do Lions  club', '2026-02-10 10:49:36', '2026-02-10 10:49:36'),
(138, 7, 'entrega', 'Avenida Castelo Branco', '2277', 'Santo Antônio', 'Maranhão Motos \nSegundo Piso', '2026-02-10 11:41:06', '2026-02-10 11:41:06'),
(139, 8, 'entrega', 'Rua Osvaldo Cruz', '888', 'Santo Antônio', '', '2026-02-10 12:00:32', '2026-02-10 12:00:32'),
(140, 10, 'entrega', 'Rua da Estrela', '09', 'Centro', 'Condomínio Doce Lar', '2026-02-12 14:03:45', '2026-02-12 14:03:45'),
(141, 11, 'entrega', 'Travessa Abraão Barros', '303', 'Aeroporto', '', '2026-02-13 14:47:24', '2026-02-13 14:47:24'),
(146, 15, 'entrega', 'Rua sao.benedito', '1729', 'São Benedito', 'Frutaria perto da panificadora muniz', '2026-02-14 13:00:41', '2026-02-14 13:00:41'),
(148, 17, 'entrega', 'Henrique Dias', '321', 'Sabbak', 'Cor da casa amarela', '2026-02-14 13:59:19', '2026-02-14 13:59:19'),
(150, 14, 'entrega', 'Rua vila Nazaré', '165', 'Centro', '', '2026-02-15 12:12:16', '2026-02-15 12:12:16'),
(151, 18, 'entrega', 'Rua Tomé de Souza', '159', 'Canecão', '', '2026-02-15 14:12:30', '2026-02-15 14:12:30'),
(152, 20, 'entrega', 'Rua da pedra branca', '77', 'Centro', 'Prédio edifício Edite Alves \nFica em cima da loja florestinha \nAo subir a escada a primeira sala à direita com porta de vidro', '2026-02-17 10:27:13', '2026-02-17 10:27:13'),
(154, 21, 'entrega', 'Dom Pedro ll', '309', 'Santo Antônio', 'Próximo à escola Darcy Ribeiro', '2026-02-17 11:43:10', '2026-02-17 11:43:10'),
(156, 12, 'entrega', 'Fernando Henrique', '03', 'Alto do Olegário', '', '2026-02-17 11:44:42', '2026-02-17 11:44:42'),
(158, 22, 'entrega', 'Custódio de melo', '115', 'Santo Antônio', 'Dormitório chaves', '2026-02-17 12:21:30', '2026-02-17 12:21:30'),
(159, 13, 'entrega', 'Travessa dois irmãos', '101', 'Centro', '', '2026-02-17 12:30:06', '2026-02-17 12:30:06'),
(160, 23, 'entrega', 'Rua pituã', '108', 'Parque Santa Cruz', 'Próximo ao detran', '2026-02-18 11:14:31', '2026-02-18 11:14:31'),
(161, 24, 'entrega', 'Rua das cajazeiras', '80', 'Centro', '', '2026-02-18 11:38:14', '2026-02-18 11:38:14'),
(165, 28, 'entrega', '15 de novembro', '389', 'Centro', 'Próximo ao Estácio', '2026-02-19 13:12:33', '2026-02-19 13:12:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entradas`
--

CREATE TABLE `entradas` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `categoria` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `entradas`
--

INSERT INTO `entradas` (`id`, `descricao`, `valor`, `categoria`, `data`) VALUES
(1, '2 pratos + Coca-Cola + Laranja + Pudim', 55.00, 'balcão', '2026-02-16 10:35:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada_bebidas`
--

CREATE TABLE `entrada_bebidas` (
  `id` int(11) NOT NULL,
  `entrada_id` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `categoria` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `entrada_bebidas`
--

INSERT INTO `entrada_bebidas` (`id`, `entrada_id`, `nome`, `categoria`, `valor`) VALUES
(1, 1, 'Coca-Cola', 'refrigerante-2l', 12.00),
(2, 1, 'Laranja', 'suco-com-leite', 10.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada_outros`
--

CREATE TABLE `entrada_outros` (
  `id` int(11) NOT NULL,
  `entrada_id` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `entrada_outros`
--

INSERT INTO `entrada_outros` (`id`, `entrada_id`, `nome`, `valor`) VALUES
(1, 1, 'Pudim', 8.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada_prato`
--

CREATE TABLE `entrada_prato` (
  `id` int(11) NOT NULL,
  `entrada_id` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `entrada_prato`
--

INSERT INTO `entrada_prato` (`id`, `entrada_id`, `nome`, `valor`) VALUES
(1, 1, '2 pratos', 25.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado_restaurante`
--

CREATE TABLE `estado_restaurante` (
  `id` int(11) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `estado_restaurante`
--

INSERT INTO `estado_restaurante` (`id`, `status`) VALUES
(1, 'fechado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `feijao`
--

CREATE TABLE `feijao` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardapio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `feijao`
--

INSERT INTO `feijao` (`id`, `nome`, `cardapio`, `imagem`, `ativo`) VALUES
(3, 'Feijão Carioca ', '18', '/media/feijao/feij--o-carioca-1767630916.jpg', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  `dinheiro` tinyint(1) DEFAULT '0',
  `pix` tinyint(1) DEFAULT '0',
  `credito` tinyint(1) DEFAULT '0',
  `debito` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id_pagamento`, `id_restaurante`, `dinheiro`, `pix`, `credito`, `debito`) VALUES
(3, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forma_pagamento_cliente`
--

CREATE TABLE `forma_pagamento_cliente` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `forma_pagamento` enum('dinheiro','pix','credito','debito') COLLATE utf8mb4_unicode_ci NOT NULL,
  `atualizado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `forma_pagamento_cliente`
--

INSERT INTO `forma_pagamento_cliente` (`id`, `cliente_id`, `forma_pagamento`, `atualizado_em`) VALUES
(148, 6, 'pix', '2026-02-10 10:49:36'),
(150, 7, 'pix', '2026-02-10 11:41:06'),
(151, 8, 'pix', '2026-02-10 12:00:32'),
(152, 10, 'pix', '2026-02-12 14:03:45'),
(153, 11, 'pix', '2026-02-13 14:47:24'),
(158, 15, 'dinheiro', '2026-02-14 13:00:41'),
(160, 16, 'pix', '2026-02-14 13:46:00'),
(162, 17, 'pix', '2026-02-14 13:59:19'),
(164, 14, '', '2026-02-15 12:12:16'),
(165, 18, 'pix', '2026-02-15 14:12:30'),
(166, 20, 'dinheiro', '2026-02-17 10:27:13'),
(168, 21, 'pix', '2026-02-17 11:43:10'),
(170, 12, 'dinheiro', '2026-02-17 11:44:42'),
(172, 22, 'dinheiro', '2026-02-17 12:21:30'),
(173, 13, 'pix', '2026-02-17 12:30:06'),
(174, 23, '', '2026-02-18 11:14:31'),
(175, 24, 'pix', '2026-02-18 11:38:14'),
(176, 25, 'dinheiro', '2026-02-18 11:38:52'),
(177, 27, 'pix', '2026-02-19 12:05:44'),
(181, 28, 'pix', '2026-02-19 13:12:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_cmv_semanal`
--

CREATE TABLE `historico_cmv_semanal` (
  `id` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `estoque_inicial` decimal(10,2) NOT NULL,
  `compras_periodo` decimal(10,2) NOT NULL,
  `estoque_final` decimal(10,2) NOT NULL,
  `cmv_valor` decimal(10,2) NOT NULL,
  `cmv_percentual` decimal(5,2) DEFAULT NULL,
  `faturamento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_pedidos` int(11) NOT NULL DEFAULT '0',
  `data_registro` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_ticket_semanal`
--

CREATE TABLE `historico_ticket_semanal` (
  `id` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `faturamento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_pedidos` int(11) NOT NULL DEFAULT '0',
  `ticket_medio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horario_funcionamento`
--

CREATE TABLE `horario_funcionamento` (
  `id_horario` int(11) NOT NULL,
  `id_restaurante` int(11) NOT NULL,
  `dia_semana` enum('segunda','terca','quarta','quinta','sexta','sabado','domingo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_abertura` time NOT NULL,
  `hora_fechamento` time NOT NULL,
  `ativo` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `horario_funcionamento`
--

INSERT INTO `horario_funcionamento` (`id_horario`, `id_restaurante`, `dia_semana`, `hora_abertura`, `hora_fechamento`, `ativo`) VALUES
(38, 1, 'segunda', '11:00:00', '15:00:00', 1),
(39, 1, 'terca', '11:00:00', '15:00:00', 1),
(40, 1, 'quarta', '11:00:00', '15:00:00', 1),
(41, 1, 'quinta', '11:00:00', '15:00:00', 1),
(42, 1, 'sexta', '11:00:00', '15:00:00', 1),
(43, 1, 'sabado', '11:00:00', '15:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `pedido_codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `mensagem` text COLLATE utf8mb4_unicode_ci,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status_pagamento` enum('aguardando','pago') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aguardando',
  `situacao` enum('aceito','preparando','saiu_entrega','entregue','cancelado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aceito',
  `processado` tinyint(1) DEFAULT '0',
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `pedido_codigo`, `cliente_id`, `mensagem`, `valor_total`, `status_pagamento`, `situacao`, `processado`, `criado_em`) VALUES
(193, 'PED-1770734463563-88497', 7, 'PEDIDO: #PED-1770734463563-88497\nCLI: DENIZE LIMA\n            ENTREGA             \n2026-02-10 11:41:03\n--------------------------------\nRUA: AVENIDA CASTELO BRANCO, 2277\nBAIRRO: SANTO ANTôNIO\nOBS: MARANHãO MOTOS \nSEGUNDO PISO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  [PT] 1x Carne Trinchada Mista\n  ARRO: Arroz de cuxá\n  SALA: Salada de Alface\n  COMP: Macarrão\n  COMP: Farofa\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 24,00\n\n\n.', 24.00, 'aguardando', 'aceito', 1, '2026-02-10 14:41:03'),
(195, 'PED-1770735634304-18758', 8, 'PEDIDO: #PED-1770735634304-18758\nCLI: CRISTHIAN\n            ENTREGA             \n2026-02-10 12:00:32\n--------------------------------\nRUA: RUA OSVALDO CRUZ, 888\nBAIRRO: SANTO ANTôNIO\n--------------------------------\n* MARMITA                     \n  [PT] 2x Frango ao molho\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n  [BEBIDAS]:\n  -> 1x Refrigerante 350ml — Coca-Cola\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 29,00\n\n\n.', 29.00, 'aguardando', 'aceito', 1, '2026-02-10 15:00:32'),
(196, 'PED-1770915825405-85131', 10, 'PEDIDO: #PED-1770915825405-85131\nCLI: EMILLY\n            ENTREGA             \n2026-02-12 14:03:45\n--------------------------------\nRUA: RUA DA ESTRELA, 09\nBAIRRO: CENTRO\nOBS: CONDOMíNIO DOCE LAR\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  ARRO: Arroz Branco\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 23,00\n\n\n.', 23.00, 'aguardando', 'aceito', 1, '2026-02-12 17:03:45'),
(197, 'PED-1771004844207-83614', 11, 'PEDIDO: #PED-1771004844207-83614\nCLI: LEONARDO\n            ENTREGA             \n2026-02-13 14:47:24\n--------------------------------\nRUA: TRAVESSA ABRAãO BARROS, 303\nBAIRRO: AEROPORTO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Toscana\n  [PT] 1x Bisteca Suína assada\n  ARRO: Arroz Branco\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n  [BEBIDAS]:\n  -> 1x Refrigerante 350ml — Jesus\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 29,00\n\n\n.', 29.00, 'aguardando', 'aceito', 1, '2026-02-13 17:47:24'),
(198, 'PED-1771079868435-98251', 12, 'PEDIDO: #PED-1771079868435-98251\nCLI: WARMYSSON\n            ENTREGA             \n2026-02-14 11:37:48\n--------------------------------\nRUA: FERNANDO HENRIQUE, 03\nBAIRRO: ALTO DO OLEGáRIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Panelada\n  ARRO: Arroz Branco\n  SALA: Salada de Repolho\n--------------------------------\n* MARMITA                     \n  [PT] 1x Torta de Frango\n  [PT] 1x Panelada\n  ARRO: Arroz Branco\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 49,00\n\n\n.', 49.00, 'aguardando', 'aceito', 1, '2026-02-14 14:37:48'),
(199, 'PED-1771079869767-98251', 12, 'PEDIDO: #PED-1771079869767-98251\nCLI: WARMYSSON\n            ENTREGA             \n2026-02-14 11:37:49\n--------------------------------\nRUA: FERNANDO HENRIQUE, 03\nBAIRRO: ALTO DO OLEGáRIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Panelada\n  ARRO: Arroz Branco\n  SALA: Salada de Repolho\n--------------------------------\n* MARMITA                     \n  [PT] 1x Torta de Frango\n  [PT] 1x Panelada\n  ARRO: Arroz Branco\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 49,00\n\n\n.', 49.00, 'aguardando', 'aceito', 1, '2026-02-14 14:37:49'),
(200, 'PED-1771080944625-85424', 13, 'PEDIDO: #PED-1771080944625-85424\nCLI: ELIANE RODRIGUES\n            ENTREGA             \n2026-02-14 11:55:47\n--------------------------------\nRUA: TRAVESSA DOIS IRMãOS, 101\nBAIRRO: AEROPORTO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 24,00\n\n\n.', 24.00, 'aguardando', 'aceito', 1, '2026-02-14 14:55:47'),
(201, 'PED-1771082636026-33968', 14, 'PEDIDO: #PED-1771082636026-33968\nCLI: CARLA MAYRLA\n            ENTREGA             \n2026-02-14 12:23:56\n--------------------------------\nRUA: RUA VILA NAZARé, 165\nBAIRRO: CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  [PT] 1x Lasanha de Frango\n  ARRO: Arroz Branco\n  SALA: Salada Maionese\n  [BEBIDAS]:\n  -> 1x Refrigerante 350ml — Coca-Cola 0\n--------------------------------\nPAGAMENTO: \nTOTAL: R$ 40,00\n\n\n.', 40.00, 'aguardando', 'aceito', 1, '2026-02-14 15:23:56'),
(202, 'PED-1771084838715-18118', 15, 'PEDIDO: #PED-1771084838715-18118\nCLI: GLEYCIANE\n            ENTREGA             \n2026-02-14 13:00:41\n--------------------------------\nRUA: RUA SAO.BENEDITO, 1729\nBAIRRO: SãO BENEDITO\nOBS: FRUTARIA PERTO DA PANIFICADORA MUNIZ\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango assado\n  [PT] 1x Toscana\n  ARRO: Arroz Baião\n  SALA: Salada Maionese\n  COMP: Macarrão\n  COMP: Farofa\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 24,00\n\n\n.', 24.00, 'aguardando', 'aceito', 1, '2026-02-14 16:00:41'),
(203, 'PED-1771087555496-41719', 16, 'PEDIDO: #PED-1771087555496-41719\nCLI: HELOISA\n            RETIRADA            \n2026-02-14 13:45:57\n--------------------------------\nRETIRADA NO BALCÃO\nRUA DA RAPOSA, 28, CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango assado\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 18,00\n\n\n.', 18.00, 'aguardando', 'aceito', 1, '2026-02-14 16:45:57'),
(204, 'PED-1771087559141-41719', 16, 'PEDIDO: #PED-1771087559141-41719\nCLI: HELOISA\n            RETIRADA            \n2026-02-14 13:46:00\n--------------------------------\nRETIRADA NO BALCÃO\nRUA DA RAPOSA, 28, CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango assado\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 18,00\n\n\n.', 18.00, 'aguardando', 'aceito', 1, '2026-02-14 16:46:00'),
(205, 'PED-1771088355396-59752', 17, 'PEDIDO: #PED-1771088355396-59752\nCLI: RONILSON\n            ENTREGA             \n2026-02-14 13:59:15\n--------------------------------\nRUA: HENRIQUE DIAS, 321\nBAIRRO: SABBAK\nOBS: COR DA CASA AMARELA\n--------------------------------\n* MARMITA                     \n  [PT] 1x Lasanha de Frango\n  [PT] 1x Carne de sol\n  ARRO: Arroz Baião\n  SALA: Salada Maionese\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 36,00\n\n\n.', 36.00, 'aguardando', 'aceito', 1, '2026-02-14 16:59:15'),
(206, 'PED-1771088359478-59752', 17, 'PEDIDO: #PED-1771088359478-59752\nCLI: RONILSON\n            ENTREGA             \n2026-02-14 13:59:19\n--------------------------------\nRUA: HENRIQUE DIAS, 321\nBAIRRO: SABBAK\nOBS: COR DA CASA AMARELA\n--------------------------------\n* MARMITA                     \n  [PT] 1x Lasanha de Frango\n  [PT] 1x Carne de sol\n  ARRO: Arroz Baião\n  SALA: Salada Maionese\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 36,00\n\n\n.', 36.00, 'aguardando', 'aceito', 1, '2026-02-14 16:59:19'),
(207, 'PED-1771168335769-67978', 14, 'PEDIDO: #PED-1771168335769-67978\nCLI: CARLA MAYRLA\n            ENTREGA             \n2026-02-15 12:12:16\n--------------------------------\nRUA: RUA VILA NAZARé, 165\nBAIRRO: CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  ARRO: Arroz Branco\n  SALA: Vinagrete\n  COMP: Macarrão\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: \nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-15 15:12:16'),
(208, 'PED-1771168336818-67978', 14, 'PEDIDO: #PED-1771168336818-67978\nCLI: CARLA MAYRLA\n            ENTREGA             \n2026-02-15 12:12:16\n--------------------------------\nRUA: RUA VILA NAZARé, 165\nBAIRRO: CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  ARRO: Arroz Branco\n  SALA: Vinagrete\n  COMP: Macarrão\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: \nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-15 15:12:16'),
(209, 'PED-1771175549738-4138', 18, 'PEDIDO: #PED-1771175549738-4138\nCLI: LARISSA\n            ENTREGA             \n2026-02-15 14:12:30\n--------------------------------\nRUA: RUA TOMé DE SOUZA, 159\nBAIRRO: CANECãO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Feijoada\n  [PT] 1x Bife ao Molho Madeira\n  ARRO: Arroz de abóbora\n  SALA: Salada Maionese\n  COMP: Macarrão\n  COMP: Farofa\n  [BEBIDAS]:\n  -> 1x Refrigerante 350ml — Coca-Cola\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 36,00\n\n\n.', 36.00, 'aguardando', 'aceito', 1, '2026-02-15 17:12:30'),
(210, 'PED-1771334831927-20583', 20, 'PEDIDO: #PED-1771334831927-20583\nCLI: ÉRICA\n            ENTREGA             \n2026-02-17 10:27:13\n--------------------------------\nRUA: RUA DA PEDRA BRANCA, 77\nBAIRRO: CENTRO\nOBS: PRéDIO EDIFíCIO EDITE ALVES \nFICA EM CIMA DA LOJA FLORESTINHA \nAO SUBIR A ESCADA A PRIMEIRA SALA à DIREITA COM PORTA DE VIDRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Ass panela bovino\n  ARRO: Arroz Branco\n  COMP: Macarrão\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 23,00\n\n\n.', 23.00, 'aguardando', 'aceito', 1, '2026-02-17 13:27:13'),
(211, 'PED-1771339387282-34621', 21, 'PEDIDO: #PED-1771339387282-34621\nCLI: ANA\n            ENTREGA             \n2026-02-17 11:43:10\n--------------------------------\nRUA: DOM PEDRO LL, 309\nBAIRRO: SANTO ANTôNIO\nOBS: PRóXIMO à ESCOLA DARCY RIBEIRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Panelada\n  [PT] 1x Carne Assada\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macaxeira frita\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 31,00\n\n\n.', 31.00, 'aguardando', 'aceito', 1, '2026-02-17 14:43:10'),
(212, 'PED-1771339389965-34621', 21, 'PEDIDO: #PED-1771339389965-34621\nCLI: ANA\n            ENTREGA             \n2026-02-17 11:43:10\n--------------------------------\nRUA: DOM PEDRO LL, 309\nBAIRRO: SANTO ANTôNIO\nOBS: PRóXIMO à ESCOLA DARCY RIBEIRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Panelada\n  [PT] 1x Carne Assada\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macaxeira frita\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 31,00\n\n\n.', 31.00, 'aguardando', 'aceito', 1, '2026-02-17 14:43:10'),
(213, 'PED-1771339481564-26601', 12, 'PEDIDO: #PED-1771339481564-26601\nCLI: WARMYSSON\n            ENTREGA             \n2026-02-17 11:44:41\n--------------------------------\nRUA: FERNANDO HENRIQUE, 03\nBAIRRO: ALTO DO OLEGáRIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Panelada\n  ARRO: Arroz Branco\n  SALA: Salada de Repolho\n  COMP: Macarrão\n--------------------------------\n* MARMITA                     \n  [PT] 1x Galinha Caipira\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 49,00\n\n\n.', 49.00, 'aguardando', 'aceito', 1, '2026-02-17 14:44:41'),
(214, 'PED-1771339482778-26601', 12, 'PEDIDO: #PED-1771339482778-26601\nCLI: WARMYSSON\n            ENTREGA             \n2026-02-17 11:44:42\n--------------------------------\nRUA: FERNANDO HENRIQUE, 03\nBAIRRO: ALTO DO OLEGáRIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Panelada\n  ARRO: Arroz Branco\n  SALA: Salada de Repolho\n  COMP: Macarrão\n--------------------------------\n* MARMITA                     \n  [PT] 1x Galinha Caipira\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 49,00\n\n\n.', 49.00, 'aguardando', 'aceito', 1, '2026-02-17 14:44:42'),
(215, 'PED-1771341646788-88122', 22, 'PEDIDO: #PED-1771341646788-88122\nCLI: JOãO\n            ENTREGA             \n2026-02-17 12:20:47\n--------------------------------\nRUA: CUSTóDIO DE MELO, 115\nBAIRRO: SANTO ANTôNIO\nOBS: DORMITóRIO CHAVES\n--------------------------------\n* MARMITA                     \n  [PT] 1x Toscana\n  ARRO: Arroz Maria isabel\n  SALA: Salada de Repolho\n  COMP: Macarrão\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 24,00\n\n\n.', 24.00, 'aguardando', 'aceito', 1, '2026-02-17 15:20:47'),
(216, 'PED-1771341690391-88122', 22, 'PEDIDO: #PED-1771341690391-88122\nCLI: JOãO\n            ENTREGA             \n2026-02-17 12:21:30\n--------------------------------\nRUA: CUSTóDIO DE MELO, 115\nBAIRRO: SANTO ANTôNIO\nOBS: DORMITóRIO CHAVES\n--------------------------------\n* MARMITA                     \n  [PT] 1x Toscana\n  ARRO: Arroz Maria isabel\n  SALA: Salada de Repolho\n  COMP: Macarrão\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Sim x1\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 24,00\n\n\n.', 24.00, 'aguardando', 'aceito', 1, '2026-02-17 15:21:30'),
(217, 'PED-1771342205409-25883', 13, 'PEDIDO: #PED-1771342205409-25883\nCLI: ELIANE RODRIGUES\n            ENTREGA             \n2026-02-17 12:30:06\n--------------------------------\nRUA: TRAVESSA DOIS IRMãOS, 101\nBAIRRO: CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Carne Assada\n  [PT] 1x Galinha Caipira\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n  COMP: Farofa\n  COMP: Macaxeira frita\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-17 15:30:06'),
(218, 'PED-1771424071367-74542', 23, 'PEDIDO: #PED-1771424071367-74542\nCLI: VANESSA\n            ENTREGA             \n2026-02-18 11:14:31\n--------------------------------\nRUA: RUA PITUã, 108\nBAIRRO: PARQUE SANTA CRUZ\nOBS: PRóXIMO AO DETRAN\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  [PT] 1x Frango assado\n  ARRO: Arroz Branco\n  SALA: Vinagrete\n  COMP: Macarrão\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: \nTOTAL: R$ 25,00\n\n\n.', 25.00, 'aguardando', 'aceito', 1, '2026-02-18 14:14:31'),
(219, 'PED-1771425494376-82041', 24, 'PEDIDO: #PED-1771425494376-82041\nCLI: ANTôNIO CARLOS\n            ENTREGA             \n2026-02-18 11:38:14\n--------------------------------\nRUA: RUA DAS CAJAZEIRAS, 80\nBAIRRO: CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Cozidão\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n--------------------------------\n* MARMITA                     \n  [PT] 1x Cozidão\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  COMP: Macarrão\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 41,00\n\n\n.', 41.00, 'aguardando', 'aceito', 1, '2026-02-18 14:38:14'),
(220, 'PED-1771425531835-71480', 25, 'PEDIDO: #PED-1771425531835-71480\nCLI: CRISTIANE COELHO\n            RETIRADA            \n2026-02-18 11:38:52\n--------------------------------\nRETIRADA NO BALCÃO\nRUA DA RAPOSA, 28, CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  ARRO: Arroz Maria isabel\n  SALA: Salada de Alface\n  COMP: Farofa\n  FEIJ: Feijão Carioca\n--------------------------------\nPAGAMENTO: DINHEIRO\nTOTAL: R$ 18,00\n\n\n.', 18.00, 'aguardando', 'aceito', 1, '2026-02-18 14:38:52'),
(221, 'PED-1771513543083-92', 27, 'PEDIDO: #PED-1771513543083-92\nCLI: RESTAURANRE\n            RETIRADA            \n2026-02-19 12:05:44\n--------------------------------\nRETIRADA NO BALCÃO\nRUA DA RAPOSA, 28, CENTRO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Frango ao molho\n  [PT] 1x Frango assado\n  ARRO: Arroz de Cenoura\n  COMP: Macarrão\n  FEIJ: Feijão Carioca\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n  PUDIM\n  > Pudim  x1 R$ 5,00\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 23,00\n\n\n.', 23.00, 'aguardando', 'aceito', 1, '2026-02-19 15:05:44'),
(222, 'PED-1771517551417-5932', 28, 'PEDIDO: #PED-1771517551417-5932\nCLI: RAINARA\n            ENTREGA             \n2026-02-19 13:12:31\n--------------------------------\nRUA: 15 DE NOVEMBRO, 389\nBAIRRO: CENTRO\nOBS: PRóXIMO AO ESTáCIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Bife ao Molho\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-19 16:12:31'),
(223, 'PED-1771517551788-5932', 28, 'PEDIDO: #PED-1771517551788-5932\nCLI: RAINARA\n            ENTREGA             \n2026-02-19 13:12:31\n--------------------------------\nRUA: 15 DE NOVEMBRO, 389\nBAIRRO: CENTRO\nOBS: PRóXIMO AO ESTáCIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Bife ao Molho\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-19 16:12:31'),
(224, 'PED-1771517549384-5932', 28, 'PEDIDO: #PED-1771517549384-5932\nCLI: RAINARA\n            ENTREGA             \n2026-02-19 13:12:33\n--------------------------------\nRUA: 15 DE NOVEMBRO, 389\nBAIRRO: CENTRO\nOBS: PRóXIMO AO ESTáCIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Bife ao Molho\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-19 16:12:33'),
(225, 'PED-1771517543086-5932', 28, 'PEDIDO: #PED-1771517543086-5932\nCLI: RAINARA\n            ENTREGA             \n2026-02-19 13:12:33\n--------------------------------\nRUA: 15 DE NOVEMBRO, 389\nBAIRRO: CENTRO\nOBS: PRóXIMO AO ESTáCIO\n--------------------------------\n* MARMITA                     \n  [PT] 1x Bife ao Molho\n  ARRO: Arroz Branco\n  SALA: Salada de Alface\n  ADICIONAIS:\n  DESEJA COLHER?\n  > Não  x1\n--------------------------------\nPAGAMENTO: PIX\nTOTAL: R$ 30,00\n\n\n.', 30.00, 'aguardando', 'aceito', 1, '2026-02-19 16:12:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `proteina`
--

CREATE TABLE `proteina` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardapio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `proteina`
--

INSERT INTO `proteina` (`id`, `nome`, `cardapio`, `imagem`, `ativo`) VALUES
(617, 'Frango ao molho ', '18', '/media/proteina/frango-ao-molho--1770727123.webp', 1),
(618, 'Carne Trinchada Mista ', '18', '/media/proteina/carne-trinchada-mista--1770727247.png', 0),
(622, 'Frango assado', '18', '/media/proteina/frango-assado-1770728575.jpg', 1),
(623, 'Torta de frango ', '25', '/media/proteina/torta-de-frango--1770728650.jpg', 1),
(624, 'Feijoada ', '25', '/media/proteina/feijoada--1770729064.jpeg', 0),
(625, 'Fraldinha Assada ', '30', '/media/proteina/fraldinha-assada--1770729237.jpg', 0),
(626, 'Peixe Frito', '18', '/media/proteina/peixe-frito-1770814398.jpg', 0),
(627, 'Cozidão ', '18', '/media/proteina/cozid--o--1770814489.jpg', 0),
(628, 'Bife acebolado ', '25', '/media/proteina/bife-acebolado--1770814591.jpg', 0),
(629, 'Costelinha Assada de Panela Bovina ', '18', '/media/proteina/costelinha-assada-de-panela-bovna--1770903104.jpg', 1),
(630, 'Torta de Frango', '25', '/media/proteina/torta-de-sardinha-1770903172.jpg', 0),
(631, 'Panelada ', '18', '/media/proteina/panelada--1770903260.jpg', 0),
(633, 'Bife ao Molho', '25', '/media/proteina/bife-ao-molho-madeira--1770903602.jpg', 1),
(634, 'Carne Assada', '30', '/media/proteina/carne-assada-1770903688.jpg', 1),
(635, 'Lasanha de Frango', '30', '/media/proteina/lasanha-de-frango-1770903776.jpg', 1),
(636, 'Carne de sol ', '25', '/media/proteina/carne-de-sol--1770904351.jpg', 0),
(637, 'Toscana ', '18', '/media/proteina/toscana--1770991180.png', 1),
(638, 'Bisteca Suína assada', '18', '/media/proteina/bisteca-su--na-assada-1770991270.jpg', 0),
(639, 'Vaca atolada ', '18', '/media/proteina/vaca-atolada--1770991542.jpg', 0),
(640, 'Picanha ', '30', '/media/proteina/picanha--1771162308.jpg', 0),
(641, 'Frango caramelado', '18', '/media/proteina/frango-caramelado-1771247324.jpg', 0),
(642, 'Ass panela bovino', '18', '/media/proteina/ass-panela-bovino-1771247512.webp', 0),
(643, 'Galinha Caipira ', '25', '/media/proteina/galinha-caipira--1771333590.webp', 0),
(644, 'Caldo de Frango', '25', '/media/proteina/caldo-de-frango-1771333733.webp', 0),
(646, 'Fígado ', '18', '/media/proteina/f--gado--1771423634.jpeg', 0),
(647, 'Picanha ', '30', '/media/proteina/picanha--1771425155.jpg', 0),
(648, 'Peixe Cozido', '25', '/media/proteina/peixe-cozido-1771425247.jpg', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurante`
--

CREATE TABLE `restaurante` (
  `id_restaurante` int(11) NOT NULL,
  `whatsapp_comercial` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco_completo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `criado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `restaurante`
--

INSERT INTO `restaurante` (`id_restaurante`, `whatsapp_comercial`, `endereco_completo`, `criado_em`, `atualizado_em`) VALUES
(1, '98984346229', 'Rua da Raposa, 28, Centro', '2026-02-06 11:48:21', '2026-02-10 13:08:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `saidas`
--

CREATE TABLE `saidas` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `salada`
--

CREATE TABLE `salada` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardapio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `salada`
--

INSERT INTO `salada` (`id`, `nome`, `cardapio`, `imagem`, `ativo`) VALUES
(83, 'Salada Tropical', '18', '/media/salada/-1770727728.jpg', 0),
(84, 'Salada de Alface', '18', '/media/salada/-1770727803.jpg', 0),
(85, 'Salada Maionese', '18', '/media/salada/-1770727859.webp', 0),
(87, 'Vinagrete ', '18', '/media/salada/-1770814800.jpg', 0),
(88, 'Salada de Repolho', '18', '/media/salada/salada-de-repolho-1770904749.jpg', 1),
(89, 'Salada de Legumes ', '18', '/media/salada/-1770904819.jpg', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `adicionais_grupos`
--
ALTER TABLE `adicionais_grupos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `adicionais_opcoes`
--
ALTER TABLE `adicionais_opcoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_grupo_adicional` (`grupo_id`);

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_restaurante` (`id_restaurante`);

--
-- Índices de tabela `arroz`
--
ALTER TABLE `arroz`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `bairros`
--
ALTER TABLE `bairros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_bairro_nome` (`nome`);

--
-- Índices de tabela `bebida`
--
ALTER TABLE `bebida`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `combo`
--
ALTER TABLE `combo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `complemento`
--
ALTER TABLE `complemento`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `configuracao_entrega`
--
ALTER TABLE `configuracao_entrega`
  ADD PRIMARY KEY (`id_config_entrega`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Índices de tabela `dados_pix`
--
ALTER TABLE `dados_pix`
  ADD PRIMARY KEY (`id_pix`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Índices de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cliente_etiqueta` (`cliente_id`);

--
-- Índices de tabela `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data` (`data`),
  ADD KEY `categoria` (`categoria`);

--
-- Índices de tabela `entrada_bebidas`
--
ALTER TABLE `entrada_bebidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_id` (`entrada_id`);

--
-- Índices de tabela `entrada_outros`
--
ALTER TABLE `entrada_outros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_id` (`entrada_id`);

--
-- Índices de tabela `entrada_prato`
--
ALTER TABLE `entrada_prato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_id` (`entrada_id`);

--
-- Índices de tabela `estado_restaurante`
--
ALTER TABLE `estado_restaurante`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `feijao`
--
ALTER TABLE `feijao`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Índices de tabela `forma_pagamento_cliente`
--
ALTER TABLE `forma_pagamento_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_cliente_forma_pagamento` (`cliente_id`);

--
-- Índices de tabela `historico_cmv_semanal`
--
ALTER TABLE `historico_cmv_semanal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_semana` (`data_inicio`,`data_fim`);

--
-- Índices de tabela `historico_ticket_semanal`
--
ALTER TABLE `historico_ticket_semanal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_semana` (`data_inicio`,`data_fim`);

--
-- Índices de tabela `horario_funcionamento`
--
ALTER TABLE `horario_funcionamento`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_restaurante` (`id_restaurante`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pedido_codigo` (`pedido_codigo`),
  ADD KEY `idx_cliente_id` (`cliente_id`);

--
-- Índices de tabela `proteina`
--
ALTER TABLE `proteina`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`id_restaurante`);

--
-- Índices de tabela `saidas`
--
ALTER TABLE `saidas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `salada`
--
ALTER TABLE `salada`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `adicionais_grupos`
--
ALTER TABLE `adicionais_grupos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `adicionais_opcoes`
--
ALTER TABLE `adicionais_opcoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `arroz`
--
ALTER TABLE `arroz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `bairros`
--
ALTER TABLE `bairros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT de tabela `bebida`
--
ALTER TABLE `bebida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `combo`
--
ALTER TABLE `combo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `complemento`
--
ALTER TABLE `complemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `configuracao_entrega`
--
ALTER TABLE `configuracao_entrega`
  MODIFY `id_config_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `dados_pix`
--
ALTER TABLE `dados_pix`
  MODIFY `id_pix` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de tabela `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entrada_bebidas`
--
ALTER TABLE `entrada_bebidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `entrada_outros`
--
ALTER TABLE `entrada_outros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entrada_prato`
--
ALTER TABLE `entrada_prato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `estado_restaurante`
--
ALTER TABLE `estado_restaurante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `feijao`
--
ALTER TABLE `feijao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `forma_pagamento_cliente`
--
ALTER TABLE `forma_pagamento_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT de tabela `historico_cmv_semanal`
--
ALTER TABLE `historico_cmv_semanal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `historico_ticket_semanal`
--
ALTER TABLE `historico_ticket_semanal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `horario_funcionamento`
--
ALTER TABLE `horario_funcionamento`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT de tabela `proteina`
--
ALTER TABLE `proteina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- AUTO_INCREMENT de tabela `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `id_restaurante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `saidas`
--
ALTER TABLE `saidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `salada`
--
ALTER TABLE `salada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `adicionais_opcoes`
--
ALTER TABLE `adicionais_opcoes`
  ADD CONSTRAINT `fk_grupo_adicional` FOREIGN KEY (`grupo_id`) REFERENCES `adicionais_grupos` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_admin_restaurante` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurante` (`id_restaurante`);

--
-- Restrições para tabelas `configuracao_entrega`
--
ALTER TABLE `configuracao_entrega`
  ADD CONSTRAINT `configuracao_entrega_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurante` (`id_restaurante`) ON DELETE CASCADE;

--
-- Restrições para tabelas `dados_pix`
--
ALTER TABLE `dados_pix`
  ADD CONSTRAINT `dados_pix_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurante` (`id_restaurante`) ON DELETE CASCADE;

--
-- Restrições para tabelas `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `fk_end_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `entrada_bebidas`
--
ALTER TABLE `entrada_bebidas`
  ADD CONSTRAINT `entrada_bebidas_ibfk_1` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `entrada_outros`
--
ALTER TABLE `entrada_outros`
  ADD CONSTRAINT `entrada_outros_ibfk_1` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `entrada_prato`
--
ALTER TABLE `entrada_prato`
  ADD CONSTRAINT `entrada_prato_ibfk_1` FOREIGN KEY (`entrada_id`) REFERENCES `entradas` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD CONSTRAINT `forma_pagamento_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurante` (`id_restaurante`) ON DELETE CASCADE;

--
-- Restrições para tabelas `forma_pagamento_cliente`
--
ALTER TABLE `forma_pagamento_cliente`
  ADD CONSTRAINT `fk_forma_pagamento_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pag_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `horario_funcionamento`
--
ALTER TABLE `horario_funcionamento`
  ADD CONSTRAINT `horario_funcionamento_ibfk_1` FOREIGN KEY (`id_restaurante`) REFERENCES `restaurante` (`id_restaurante`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidoshistorico_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
