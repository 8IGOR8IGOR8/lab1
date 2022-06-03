-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 30 2022 г., 08:28
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `network`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `ID_Client` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`ID_Client`, `name`, `login`, `password`, `IP`, `balance`) VALUES
(11, 'Nik', 'fdgsfddfs', 'rwsdg4wtf2w', '188.221.111.0', 500),
(12, 'Bob', 'bob@gmail.com', 'sgerhncbd33', '188.134.145.112', 220),
(13, 'Rob', 'rob@gmail.com', 'sdgdfdg453', '288.104.45.8', -10),
(14, 'Sam', 'sam@gmail.com', 'dsgbfhh666', '88.14.45.112', -200),
(15, 'Kirito', 'kirito@gmail.com', 'bombom2353', '188.34.14.1', 300);

-- --------------------------------------------------------

--
-- Структура таблицы `seanses`
--

CREATE TABLE `seanses` (
  `ID_Seanse` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `stop` datetime NOT NULL,
  `in_trafic` int(11) NOT NULL,
  `out_trafic` int(11) NOT NULL,
  `FID_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `seanses`
--

INSERT INTO `seanses` (`ID_Seanse`, `start`, `stop`, `in_trafic`, `out_trafic`, `FID_Client`) VALUES
(1, '2022-05-01 00:00:00', '2022-05-31 19:00:32', 5000000, 200000, 12),
(2, '2022-04-01 00:00:00', '2022-05-01 00:00:00', 8000000, 10000, 15),
(3, '2022-03-01 00:00:00', '2022-05-17 19:03:34', 3000000, 5000, 11),
(4, '2022-04-11 11:03:34', '2022-05-26 20:03:34', 4000000, 1300000, 13),
(5, '2022-01-02 19:03:34', '2022-02-01 19:03:34', 7000000, 1200000, 14),
(6, '2012-11-01 19:03:34', '2019-11-28 19:03:34', 6000000, 1000000, 14);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID_Client`);

--
-- Индексы таблицы `seanses`
--
ALTER TABLE `seanses`
  ADD PRIMARY KEY (`ID_Seanse`),
  ADD KEY `FID_Client` (`FID_Client`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `ID_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `seanses`
--
ALTER TABLE `seanses`
  MODIFY `ID_Seanse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seanses`
--
ALTER TABLE `seanses`
  ADD CONSTRAINT `seanses_ibfk_1` FOREIGN KEY (`FID_Client`) REFERENCES `clients` (`ID_Client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
