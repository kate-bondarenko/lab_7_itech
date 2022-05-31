-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 31 2022 г., 10:55
-- Версия сервера: 10.5.11-MariaDB
-- Версия PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `itechemployeework`
--

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--

CREATE TABLE `department` (
  `id_department` int(10) NOT NULL,
  `chief` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id_department`, `chief`) VALUES
(1, 'John Chen'),
(2, 'Luis Popp'),
(3, 'Bruce Ernst'),
(4, 'Valii Pataballa');

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id_projects` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `manager` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id_projects`, `name`, `manager`) VALUES
(1, 'Project1', 'Bruse Ernst'),
(2, 'Project2', 'David Austin'),
(3, 'Project3', 'Steven King'),
(4, 'Project4', 'John Chen'),
(5, 'Project5', 'Nncy Urman');

-- --------------------------------------------------------

--
-- Структура таблицы `work`
--

CREATE TABLE `work` (
  `fid_worker` int(10) NOT NULL,
  `fid_projects` int(10) NOT NULL,
  `date` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `work`
--

INSERT INTO `work` (`fid_worker`, `fid_projects`, `date`, `time_start`, `time_end`, `description`) VALUES
(5, 4, '2022-02-18', '08:00:00', '16:00:00', '1 этап проекта'),
(1, 4, '2022-02-19', '11:00:00', '16:00:00', '2 этап проекта'),
(6, 4, '2022-02-20', '12:00:00', '18:00:00', '3 этап проекта'),
(2, 3, '2022-04-02', '09:00:00', '18:30:00', '1 этап проекта'),
(3, 3, '2022-04-05', '10:30:00', '15:00:00', '2 этап проекта'),
(4, 3, '2022-04-10', '11:00:00', '14:00:00', '3 этап проекта'),
(6, 1, '2022-03-14', '09:00:00', '15:00:00', '1 этап проекта'),
(7, 1, '2022-03-23', '11:00:00', '16:00:00', '2 этап проекта'),
(6, 1, '2022-03-27', '14:00:00', '19:00:00', '3 этап проекта'),
(8, 2, '2022-01-10', '08:15:00', '12:30:00', '1 этап проекта'),
(3, 2, '2022-01-16', '17:45:00', '18:45:00', '2 этап проекта'),
(9, 2, '2022-01-23', '10:30:00', '17:00:00', '3 этап проекта');

-- --------------------------------------------------------

--
-- Структура таблицы `worker`
--

CREATE TABLE `worker` (
  `id_worker` int(10) NOT NULL,
  `fid_department` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `worker`
--

INSERT INTO `worker` (`id_worker`, `fid_department`) VALUES
(3, 1),
(8, 1),
(10, 1),
(1, 2),
(7, 2),
(2, 3),
(4, 3),
(9, 3),
(5, 4),
(6, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id_department`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_projects`);

--
-- Индексы таблицы `work`
--
ALTER TABLE `work`
  ADD KEY `a1` (`fid_worker`),
  ADD KEY `a2` (`fid_projects`);

--
-- Индексы таблицы `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id_worker`),
  ADD KEY `a3` (`fid_department`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id_projects` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `worker`
--
ALTER TABLE `worker`
  MODIFY `id_worker` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `a1` FOREIGN KEY (`fid_worker`) REFERENCES `worker` (`id_worker`),
  ADD CONSTRAINT `a2` FOREIGN KEY (`fid_projects`) REFERENCES `projects` (`id_projects`);

--
-- Ограничения внешнего ключа таблицы `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `a3` FOREIGN KEY (`fid_department`) REFERENCES `department` (`id_department`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
