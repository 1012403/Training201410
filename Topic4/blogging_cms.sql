-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2014 at 03:58 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment`, `comment_time`) VALUES
(1, 14, 34, 'khoa Ä‘áº¡i ca', '2014-10-25 08:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_content` text COLLATE utf8_unicode_ci NOT NULL,
  `post_time` datetime NOT NULL,
  `user_post` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_content`, `post_time`, `user_post`) VALUES
(9, 34, 'h, thiÌ€ chiÌ‰ trong voÌ€ng 6 tuÃ¢Ì€n Ä‘aÌƒ... CoÌ€n laÌ£i 1 sÃ´Ì laÌ€ FA, Ä‘Æ°Æ¡ng nhiÃªn con sÃ´Ì naÌ€ y ko thÃªÌ‰ naÌ€o chiÌnh xaÌc, viÌ€ coÌ thÃªÌ‰ nhiu', '2014-10-24 22:13:58', 34),
(10, 34, 'Ã¡dasdasd', '2014-10-24 22:44:04', 34),
(11, 34, 'acdb', '2014-10-24 22:46:09', 34),
(12, 34, 'laylist Tuyá»ƒn táº­p cÃ¡c ca khÃºc US-UK hay :) do ca sÄ© Äang Cáº­p Nháº­t thá»ƒ hiá»‡n, thuá»™c thá»ƒ loáº¡i Playlist Ã‚u, Má»¹. CÃ¡c báº¡n cÃ³ thá»ƒ nghe, download (táº£i nháº¡c) cÃ¡c bÃ i hÃ¡t trong playlist/album Tuyen Tap CÃ¡c Ca KhÃºc Us-uk Hay :) mp3 miá»…n phÃ­ táº¡i NhacCuaTui.', '2014-10-24 22:48:53', 34),
(13, 34, '123131323', '2014-10-24 22:56:02', 34),
(14, 34, '34458667', '2014-10-25 08:03:44', 34),
(15, 34, 'y do ca sÄ© P!nk thá»ƒ hiá»‡n, thuá»™c thá»ƒ loáº¡i Video Ã‚u, Má»¹, Video Pop. CÃ¡c báº¡n cÃ³ thá»ƒ nghe ,download MV/Video Try miá»…n phÃ­ táº¡i NhacCuaTui.com. ', '2014-10-25 08:12:14', 34),
(16, 34, 'khoahoang', '0000-00-00 00:00:00', 34),
(17, 34, 'khÃ³a', '2014-10-25 08:44:06', 34),
(18, 34, 'zing', '2014-10-25 08:46:21', 34),
(19, 34, 'kaka', '2014-10-25 08:54:06', 34),
(20, 34, 'khsfasfsafasasfsdfsdfasdf', '2014-10-25 08:54:40', 34),
(21, 34, 'lksfhkjsgkasfhlkasfhsaklfhkl', '2014-10-25 08:54:53', 34);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `active`, `registration_date`) VALUES
(34, 'khoahoang', 'khoahoang06@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', NULL, '2014-10-23 19:39:11');

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
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
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
