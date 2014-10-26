-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2014 at 06:17 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blogging_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_time` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=87 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment`, `comment_time`) VALUES
(73, 48, 34, 'ngon nÃ¨', '2014-10-25 10:30:19'),
(74, 48, 34, 'Ã½e', '2014-10-25 10:30:32'),
(75, 49, 34, 'how', '2014-10-25 10:32:42'),
(76, 49, 34, 'alo', '2014-10-25 10:38:20'),
(77, 50, 34, 'nÃ¨', '2014-10-25 10:38:46'),
(78, 53, 34, 'dddd', '2014-10-25 10:45:41'),
(79, 53, 34, 'demo', '2014-10-25 10:45:45'),
(80, 52, 34, 'demo', '2014-10-25 10:45:58'),
(81, 52, 34, '', '2014-10-25 10:45:58'),
(82, 57, 34, 'Demo', '2014-10-25 10:50:55'),
(84, 59, 35, 'hi khoa hoang', '2014-10-25 11:31:32'),
(85, 60, 35, 'alo', '2014-10-25 11:46:25'),
(86, 60, 35, 'alo', '2014-10-25 11:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_time` datetime NOT NULL,
  `user_post` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=68 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_content`, `post_time`, `user_post`) VALUES
(46, 34, 'alo', '2014-10-25 10:18:14', 34),
(47, 34, 'alo ná»¯a', '2014-10-25 10:18:57', 34),
(48, 34, 'thá»­ láº¡i', '2014-10-25 10:25:47', 34),
(49, 34, 'ok nÃ¨', '2014-10-25 10:30:23', 34),
(50, 34, 'thá»­ láº¡i', '2014-10-25 10:38:24', 34),
(51, 34, 'ok', '2014-10-25 10:38:50', 34),
(52, 34, 'Demov ', '2014-10-25 10:44:29', 34),
(53, 34, 'demo ', '2014-10-25 10:45:33', 34),
(54, 34, 'Demo\n', '2014-10-25 10:47:00', 34),
(55, 34, 'Dmo2222 ', '2014-10-25 10:47:54', 34),
(56, 34, 'Demo \n', '2014-10-25 10:50:11', 34),
(57, 34, 'Demo de', '2014-10-25 10:50:51', 34),
(58, 34, '', '2014-10-25 10:52:38', 34),
(59, 34, '', '2014-10-25 10:52:58', 34),
(60, 35, 'bÃ i cá»§a luffy', '2014-10-25 11:31:10', 35),
(61, 35, 'Salvia portland leggings banh mi fanny pack mixtape, authentic bushwick wes anderson intelligentsia artisan typewriter high life they sold out mixtape high life. Marfa ethnic wayfarers brooklyn keytar mixtape. Blue bottle shoreditch gluten-free, mixtape hoodie whatever pinterest viral twee fashion axe high life irony biodiesel tofu.\n\nRetro church-key thundercats keytar, skateboard irony selvage ethnic freegan banjo pour-over fixie. Raw denim fashion ax eoke locavore disrupt, tonx retro authentic letterpress raw denim stumptown mixtape ugh ', '2014-10-25 13:00:41', 35),
(62, 35, 'Ã¡ds', '2014-10-25 13:12:27', 35),
(63, 35, 'Skateboard artisan bicycle rights next level vinyl cardigan beard twee, farm-to-table truffaut. Shoreditch freegan cliche thundercats, bushwick VHS intelligentsia selfies ethnic try-hard before they sold out. Marfa terry richardson hella, seitan odd future pug butcher. Wes anderson tousled YOLO cardigan. Typewriter high life carles, artisan gentrify mess', '2014-10-25 13:17:48', 35),
(64, 35, 'Skateboard artisan bicycle rights next level vinyl cardigan beard twee, farm-to-table truffaut. Shoreditch freegan cliche thundercats, bushwick VHS intelligentsia selfies ethnic try-hard before they sold out. Marfa terry richardson hella, seitan odd future pug butcher. Wes anderson tousled YOLO cardigan. Typewriter high life carles, artisan gentrify messe', '2014-10-25 13:18:57', 35),
(65, 35, 'Skateboard artisan bicycle rights next level vinyl cardigan beard twee, farm-to-table truffaut. Shoreditch freegan cliche thundercats, bushwick VHS intelligentsia selfies ethnic try-hard before they sold out. Marfa terry richardson hella, seitan odd future pug butcher. Wes anderson tousled YOLO cardigan. Typewriter high life carles, artisan gentrify messenger ', '2014-10-25 13:19:07', 35),
(66, 35, 'Skateboard artisan bicycle rights next level vinyl cardigan beard twee, farm-to-table truffaut. Shoreditch freegan cliche thundercats, bushwick VHS intelligentsia selfies ethnic try-hard before they sold out. Marfa terry richardson hella, seitan odd future pug butcher. Wes anderson tousled YOLO cardigan. y', '2014-10-25 13:21:01', 35),
(67, 35, 'Skateboard artisan bicycle rights next level vinyl cardigan beard twee, farm-to-table truffaut. Shoreditch freegan cliche thundercats, bushwick VHS intelligentsia selfies ethnic try-hard before they sold out. Marfa terry richardson hella, seitan odd future pug butcher. Wes anderson tousled YOLO cardigan. Typewriter high life carles, artisan gentrify messenger bag single-origin coffee truffaut thundercats cray', '2014-10-25 13:21:08', 35);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `active` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_date` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `active`, `registration_date`) VALUES
(34, 'khoahoang', 'khoahoang06@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, '2014-10-23 19:39:11'),
(35, 'Luffy', 'hdkcr7@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, '2014-10-25 11:29:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `comment_id` (`comment_id`), ADD KEY `post_id` (`post_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`post_id`), ADD KEY `post_id` (`post_id`), ADD KEY `user_id` (`user_id`), ADD KEY `user_post` (`user_post`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `emai` (`email`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `username_2` (`username`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_post`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
