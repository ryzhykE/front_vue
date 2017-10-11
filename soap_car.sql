-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 10 2017 г., 17:21
-- Версия сервера: 5.7.11
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `soap_car`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `engine` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `maxSpeed` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `year`, `engine`, `color`, `price`, `maxSpeed`) VALUES
(1, 'BMW', 'M5', 2016, 2500, 'Red', 2900, 180),
(2, 'Toyota', 'Corola', 2015, 1600, 'Black', 1200, 160),
(3, 'BMW', 'Gran Turismo', 2011, 2500, 'Grey', 2900, 190),
(4, 'BMW', 'BMW X4', 2011, 3200, 'Red', 5000, 180),
(5, 'Audi', 'A4', 2016, 1600, 'Black', 1200, 160),
(6, 'Audi', 'Audi TT', 2016, 3200, 'Black', 5000, 200),
(7, 'Audi', 'S5', 2015, 3200, 'Red', 10000, 190);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` enum('get','send') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_car`, `id_user`, `status`) VALUES
(1, 1, 1, 'get'),
(2, 2, 1, 'send'),
(3, 3, 2, 'get'),
(5, 1, 1, 'get'),
(6, 1, 5, 'send');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hash` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `hash`) VALUES
(1, 'test', '1b2b1c1b9a4f61971e9332ba3772cdd8', '31b5bf6897b94ff8233a3596c41d4def'),
(2, 'login', 'pass', 'pass');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
