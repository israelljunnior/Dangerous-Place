-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 12-Ago-2018 às 19:05
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.2

use dangerousplace1;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dangerousplace1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `conteudo` varchar(2000) CHARACTER SET utf8 NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL,
  `id_publicacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `conteudo`, `data_hora`, `id_usuario`, `id_publicacao`) VALUES
(1, 'asfafsaf', '2018-08-12 13:26:06', 1, 1),
(2, 'asdasdasd', '2018-08-12 13:26:26', 2, 1),
(3, 'sadsada', '2018-08-12 13:26:41', 2, 1),
(4, 'asdasdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '2018-08-12 13:58:26', 2, 1),
(5, 'asdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafafasdafasfasffsafasfsafasfsafsafsafaf', '2018-08-12 13:58:38', 2, 1),
(6, 'isa\r\n,,,,', '2018-08-12 15:04:19', 2, 3),
(7, 'israel,,,,', '2018-08-12 16:03:02', 2, 3),
(8, 'israel,,,,', '2018-08-12 16:30:38', 2, 3),
(9, 'israel,,,,', '2018-08-12 16:37:46', 2, 3),
(10, 'israel\r\n', '2018-08-12 17:02:53', 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_acidentes`
--

CREATE TABLE `dados_acidentes` (
  `id_dados_acidentes` int(11) NOT NULL,
  `natureza` varchar(15) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `onibus` int(11) NOT NULL,
  `viatura` int(11) NOT NULL,
  `vitima` int(11) NOT NULL,
  `ciclista` int(11) NOT NULL,
  `pedestre` int(11) NOT NULL,
  `auto` int(11) NOT NULL,
  `moto` int(11) NOT NULL,
  `caminhao` int(11) NOT NULL,
  `id_dados_municipios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_municipios`
--

CREATE TABLE `dados_municipios` (
  `id_dados_municipios` int(11) NOT NULL,
  `nome_municipios` varchar(25) NOT NULL,
  `id_dados_regioes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_municipio_cvli`
--

CREATE TABLE `dados_municipio_cvli` (
  `id_dados_municipio_cvli` int(11) NOT NULL,
  `total_cvli` int(11) NOT NULL,
  `qtd_mulher` int(11) NOT NULL,
  `qtd_homem` int(11) NOT NULL,
  `qtd_conflito_fam` int(11) NOT NULL,
  `qtd_cinfilto_comu` int(11) NOT NULL,
  `qtd_criminal` int(11) NOT NULL,
  `qtd_homicidio` int(11) NOT NULL,
  `qtd_latrocinio` int(11) NOT NULL,
  `qtd_lesado_morte` int(11) NOT NULL,
  `qtd_armabranca` int(11) NOT NULL,
  `qtd_armafogo` int(11) NOT NULL,
  `idade_ate12` int(11) NOT NULL,
  `idade_13a17` int(11) NOT NULL,
  `idade_18a30` int(11) NOT NULL,
  `idade_31a65` int(11) NOT NULL,
  `idade_acima65` int(11) NOT NULL,
  `id_dados_municipios` int(11) NOT NULL,
  `id_dados_municipios_cvli` int(11) NOT NULL,
  `qtd_cinflito` int(11) DEFAULT NULL,
  `qtd_conflito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_municipio_cvp`
--

CREATE TABLE `dados_municipio_cvp` (
  `id_dados_municipio_cvp` int(11) NOT NULL,
  `roubo_transeunte` int(11) NOT NULL,
  `roubo_veiculo` int(11) NOT NULL,
  `roubo_estabelecimento` int(11) NOT NULL,
  `roubo_extorsao` int(11) NOT NULL,
  `roubo_inst_financ` int(11) NOT NULL,
  `roubo_carga` int(11) NOT NULL,
  `roubo_motoneta` int(11) NOT NULL,
  `roubo_onibus` int(11) NOT NULL,
  `roubo_residencias` int(11) NOT NULL,
  `id_dados_municipios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dados_regioes`
--

CREATE TABLE `dados_regioes` (
  `id_dados_regioes` int(11) NOT NULL,
  `nome_regiao` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicacao`
--

CREATE TABLE `publicacao` (
  `id_publicacao` int(11) NOT NULL,
  `titulo` varchar(30) NOT NULL,
  `tema` varchar(40) NOT NULL,
  `conteudo` varchar(4000) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `publicacao`
--

INSERT INTO `publicacao` (`id_publicacao`, `titulo`, `tema`, `conteudo`, `data_hora`, `id_usuario`) VALUES
(1, 'sei lá ', 'Assaltos', 'afsasfasfsafasfassssssssssssssssssssssssssssssssssssssssssssssss', '2018-08-12 14:11:39', 1),
(2, 'ônibus bateu em jaboatão', 'Assaltos', 'Em um cruzamento sem sinalização o ônibus bateu no meu carro, onde eu estava parada esperando a sua passagem para que eu seguisse, o motorista do ônibus em seu B.O assumiu a culpa dizendo que não viu o meu carro, tenho que marcar uma \"reuniao\" para tentar acordo entre as partes, queria saber como proceder nesse caso e se não houver acordo o que posso alegar? Estou totalmente perdida.', '2018-08-12 14:11:44', 1),
(3, 'ônibus bateu em jaboatão', 'Acidentes de Trânsito', 'Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas Batida de onibus morre 1000 pessoas  e 50 são abduzidas ', '2018-08-09 19:57:20', 2),
(4, 'david é gay', 'Assaltos', 'david due o botrequesabfhafsdhsdfuhsgo', '2018-08-09 19:59:39', 2),
(5, 'ônibus bateu em jaboatão', 'Assaltos', 'frstsyrsysuti', '2018-08-09 22:00:26', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(130) NOT NULL,
  `senha` varchar(130) NOT NULL,
  `sexo` char(1) NOT NULL,
  `endereco` varchar(70) NOT NULL,
  `nivel_acesso` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `sexo`, `endereco`, `nivel_acesso`) VALUES
(1, 'diego', 'die-gops@hotmail.com', 'Teste@123', 'F', '54330254', 'usuario'),
(2, 'adm', 'adm@gmail.com', 'Adm@123', 'F', '54330254', 'usuario');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `FK1c6uci7257qn6yx1hrmab1x2` (`id_publicacao`),
  ADD KEY `FK9619kv3mim3a4yl0m5mdhhbh1` (`id_usuario`);

--
-- Indexes for table `dados_acidentes`
--
ALTER TABLE `dados_acidentes`
  ADD PRIMARY KEY (`id_dados_acidentes`),
  ADD KEY `FKrnxbsvnhclf5njbjf56f4jenl` (`id_dados_municipios`);

--
-- Indexes for table `dados_municipios`
--
ALTER TABLE `dados_municipios`
  ADD PRIMARY KEY (`id_dados_municipios`),
  ADD KEY `FKbo87l62tnq8b729whaekycatt` (`id_dados_regioes`);

--
-- Indexes for table `dados_municipio_cvli`
--
ALTER TABLE `dados_municipio_cvli`
  ADD PRIMARY KEY (`id_dados_municipio_cvli`),
  ADD KEY `FKo03vs0gnnfdrcky0qdhptxm5a` (`id_dados_municipios`);

--
-- Indexes for table `dados_municipio_cvp`
--
ALTER TABLE `dados_municipio_cvp`
  ADD PRIMARY KEY (`id_dados_municipio_cvp`),
  ADD KEY `FK1af8n2ltoiyy25yi4gojj44fr` (`id_dados_municipios`);

--
-- Indexes for table `dados_regioes`
--
ALTER TABLE `dados_regioes`
  ADD PRIMARY KEY (`id_dados_regioes`);

--
-- Indexes for table `publicacao`
--
ALTER TABLE `publicacao`
  ADD PRIMARY KEY (`id_publicacao`),
  ADD KEY `FKfmx5o13ybwqeiee1finmwdi48` (`id_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dados_acidentes`
--
ALTER TABLE `dados_acidentes`
  MODIFY `id_dados_acidentes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dados_municipios`
--
ALTER TABLE `dados_municipios`
  MODIFY `id_dados_municipios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dados_municipio_cvli`
--
ALTER TABLE `dados_municipio_cvli`
  MODIFY `id_dados_municipio_cvli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dados_municipio_cvp`
--
ALTER TABLE `dados_municipio_cvp`
  MODIFY `id_dados_municipio_cvp` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dados_regioes`
--
ALTER TABLE `dados_regioes`
  MODIFY `id_dados_regioes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publicacao`
--
ALTER TABLE `publicacao`
  MODIFY `id_publicacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `FK1c6uci7257qn6yx1hrmab1x2` FOREIGN KEY (`id_publicacao`) REFERENCES `publicacao` (`id_publicacao`),
  ADD CONSTRAINT `FK9619kv3mim3a4yl0m5mdhhbh1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `comentario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `comentario_ibfk_2` FOREIGN KEY (`id_publicacao`) REFERENCES `publicacao` (`id_publicacao`);

--
-- Limitadores para a tabela `dados_acidentes`
--
ALTER TABLE `dados_acidentes`
  ADD CONSTRAINT `FKrnxbsvnhclf5njbjf56f4jenl` FOREIGN KEY (`id_dados_municipios`) REFERENCES `dados_municipios` (`id_dados_municipios`),
  ADD CONSTRAINT `dados_acidentes_ibfk_1` FOREIGN KEY (`id_dados_municipios`) REFERENCES `dados_municipios` (`id_dados_municipios`);

--
-- Limitadores para a tabela `dados_municipios`
--
ALTER TABLE `dados_municipios`
  ADD CONSTRAINT `FKbo87l62tnq8b729whaekycatt` FOREIGN KEY (`id_dados_regioes`) REFERENCES `dados_regioes` (`id_dados_regioes`),
  ADD CONSTRAINT `dados_municipios_ibfk_1` FOREIGN KEY (`id_dados_regioes`) REFERENCES `dados_regioes` (`id_dados_regioes`);

--
-- Limitadores para a tabela `dados_municipio_cvli`
--
ALTER TABLE `dados_municipio_cvli`
  ADD CONSTRAINT `FKo03vs0gnnfdrcky0qdhptxm5a` FOREIGN KEY (`id_dados_municipios`) REFERENCES `dados_municipios` (`id_dados_municipios`),
  ADD CONSTRAINT `dados_municipio_cvli_ibfk_1` FOREIGN KEY (`id_dados_municipios`) REFERENCES `dados_municipios` (`id_dados_municipios`);

--
-- Limitadores para a tabela `dados_municipio_cvp`
--
ALTER TABLE `dados_municipio_cvp`
  ADD CONSTRAINT `FK1af8n2ltoiyy25yi4gojj44fr` FOREIGN KEY (`id_dados_municipios`) REFERENCES `dados_municipios` (`id_dados_municipios`),
  ADD CONSTRAINT `dados_municipio_cvp_ibfk_1` FOREIGN KEY (`id_dados_municipios`) REFERENCES `dados_municipios` (`id_dados_municipios`);

--
-- Limitadores para a tabela `publicacao`
--
ALTER TABLE `publicacao`
  ADD CONSTRAINT `FKfmx5o13ybwqeiee1finmwdi48` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `publicacao_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
