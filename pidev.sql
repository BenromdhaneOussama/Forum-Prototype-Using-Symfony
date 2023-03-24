-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2023 at 05:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pidev`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_rubrique` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `titre`, `description`, `photo`, `votes`, `date`, `id_rubrique`, `id_user`) VALUES
(73, 'aaaaaaaaa', 'aaaaaaa', 'e11affc6b3e05289cbea8e94a221228a.png', 0, '2023-03-24 14:56:02', 1, 1),
(74, 'bbbbbbb', 'bbbbbbb', '56bf0749ee413514be845dd9a577e596.png', 0, '2023-03-24 15:01:49', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `votes` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_parent_comment` int(11) NOT NULL,
  `id_blog` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `description`, `votes`, `date`, `id_parent_comment`, `id_blog`, `id_user`) VALUES
(1, 'aaaaaa', 0, '2022-04-18 16:09:41', 0, 23, 1),
(2, 'bbbbbbbbbb', 0, '2022-04-18 14:10:54', 1, 23, 1),
(8, 'fgfgf', 0, '2022-04-18 17:03:41', 2, 23, 1),
(30, 'kek', 0, '2022-04-19 13:59:29', 0, 24, 1),
(50, 'abc', 0, '2022-04-20 13:38:41', 30, 24, 1),
(51, 'def', 0, '2022-04-20 13:38:50', 50, 24, 1),
(54, 'ab', 0, '2022-04-21 06:52:49', 52, 24, 1),
(55, 'test', 0, '2022-04-21 06:53:35', 0, 24, 1),
(56, 'aaaaaaa', 0, '2023-03-24 14:56:58', 0, 73, 1),
(59, 'bbbbbb', 0, '2023-03-24 14:59:03', 56, 73, 2),
(60, 'cccccccc', 0, '2023-03-24 14:59:26', 59, 73, 1),
(61, 'test', 0, '2023-03-24 15:02:56', 0, 74, 1),
(62, 'test2', 0, '2023-03-24 15:03:14', 61, 74, 2),
(63, 'test2', 0, '2023-03-24 15:03:33', 62, 74, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rubrique`
--

CREATE TABLE `rubrique` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rubrique`
--

INSERT INTO `rubrique` (`id`, `titre`) VALUES
(1, 'Advice/Tips'),
(2, 'other'),
(8, 'ac'),
(25, 'test1111');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `dateNaissance` date NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `cin` varchar(8) NOT NULL,
  `numTel` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `isSuperAdmin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `nom`, `prenom`, `dateNaissance`, `sexe`, `cin`, `numTel`, `email`, `password`, `isSuperAdmin`) VALUES
(1, 'a', 'a', '2020-03-04', 'm', '11111111', '1', 'a@gmail.com', 'a', 0),
(2, 'b', 'b', '2022-11-09', 'm', '22222222', '2', 'b@gmail.com', 'b', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_rubrique` (`id_rubrique`),
  ADD KEY `fk_id_user` (`id_user`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_blog` (`id_blog`),
  ADD KEY `fkid_user` (`id_user`);

--
-- Indexes for table `rubrique`
--
ALTER TABLE `rubrique`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `rubrique`
--
ALTER TABLE `rubrique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `fk_id_rubrique` FOREIGN KEY (`id_rubrique`) REFERENCES `rubrique` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_user	` FOREIGN KEY (`id_user`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
