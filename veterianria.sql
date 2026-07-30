-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/07/2026 às 17:26
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `veterianria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `idani` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `nomeani` varchar(255) NOT NULL,
  `especie` varchar(255) NOT NULL,
  `raca` varchar(100) NOT NULL,
  `datanasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`idani`, `idcliente`, `nomeani`, `especie`, `raca`, `datanasc`) VALUES
(1, 1, 'Luna', 'gato', 'siames', '0000-00-00'),
(2, 1, 'Roberto', 'gato', 'SRD', '0000-00-00'),
(3, 2, 'pitoco', 'Arara', 'Arara-azul', '0000-00-00'),
(4, 3, 'claudio', 'peixe', 'tilapia', '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `idate` int(11) NOT NULL,
  `idanimal` int(11) DEFAULT NULL,
  `idvete` int(11) DEFAULT NULL,
  `dataate` date NOT NULL,
  `horaate` time NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nomecli` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nomecli`, `telefone`, `email`, `cpf`, `endereco`) VALUES
(1, 'Arthur Gomes', '11 97146-5623', 'arthur.hamilton08@gmail.com', '123.456.789.12', 'Rua Tabarana Ribeirão Pires - SP'),
(2, 'cleiton almeida', '11 97847-3874', 'cleiton.23@gmail.com', '431.456.539.02', 'Rua dos Rios Rio de Janeiro - RJ'),
(3, 'Jane', '11 93457-3745', 'jnesa@gmail.com', '346.926.469.16', 'Rua dos bosques Colina Verde - ES');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `idvet` int(11) NOT NULL,
  `nomevet` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `crmv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`idani`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Índices de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`idate`),
  ADD KEY `idanimal` (`idanimal`),
  ADD KEY `idvete` (`idvete`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idvet`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `idani` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `idate` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `idvet` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`);

--
-- Restrições para tabelas `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `atendimentos_ibfk_1` FOREIGN KEY (`idanimal`) REFERENCES `animais` (`idani`),
  ADD CONSTRAINT `atendimentos_ibfk_2` FOREIGN KEY (`idvete`) REFERENCES `veterinario` (`idvet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
