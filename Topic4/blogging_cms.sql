-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2014 at 05:06 PM
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
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `user_id`, `post_content`, `post_time`, `user_post`) VALUES
(3, 34, 'Ä‘Ã´i(trÆ°Ì€ trÆ°Æ¡Ì€ng hoÌ£p Ä‘ÄƒÌ£t biÃªÌ£t nÃªÌu coÌ). Theo tiÌ€nh hiÌ€nh cfs cho thÃ¢Ìy trung biÌ€nh mÃ´Ìƒi ngaÌ€y coÌ khoaÌ‰ng 10 lÆ¡Ì€i toÌ‰ tiÌ€nh, thiÌ€ chiÌ‰ trong voÌ€ng 6 tuÃ¢Ì€n Ä‘aÌƒ... CoÌ€n laÌ£i 1 sÃ´Ì laÌ€ FA, Ä‘Æ°Æ¡ng nhiÃªn con sÃ´Ì naÌ€ y ko thÃªÌ‰ naÌ€o chiÌnh xaÌc, viÌ€ coÌ thÃªÌ‰ nhiu cfs gÆ°Ì‰i ', '2014-10-24 20:11:19', 34),
(4, 34, 'cfs gÆ°Ì‰i cho cuÌ€ng 1 ng vaÌ€ ngÆ°Æ¡Ì£c laÌ£i, hoÄƒÌ£c chiÌ‰ laÌ€ nhÆ°Ìƒng cfs mang tiÌnh chÃ¢Ìt troll. TrÃªn Ä‘Ã¢y laÌ€ mÃ´Ì£t sÃ´Ì tiÌnh toaÌn ko khoa hoÌ£c cuÌ‰ a em ', '2014-10-24 20:14:55', 34),
(5, 34, 's gÆ°Ì‰i cho cuÌ€ng 1 ng vaÌ€ ngÆ°Æ¡Ì£c laÌ£i, hoÄƒÌ£c chiÌ‰ laÌ€ nhÆ°Ìƒng cfs mang tiÌnh chÃ¢Ìt troll. TrÃªn Ä‘Ã¢y laÌ€ mÃ´Ì£t sÃ´Ì tiÌnh toaÌn ko khoa h', '2014-10-24 21:09:58', 34),
(6, 34, ' 1 ng vaÌ€ ngÆ°Æ¡Ì£c laÌ£i, hoÄƒÌ£c chiÌ‰ laÌ€ nhÆ°Ìƒng cfs mang tiÌnh chÃ¢Ìt troll. TrÃªn Ä‘Ã¢y laÌ€ mÃ´Ì£t sÃ´Ì tiÌnh toaÌn ko khoa hoÌ£c cuÌ‰ a em ', '2014-10-24 21:10:37', 34),
(7, 34, 'h, thiÌ€ chiÌ‰ trong voÌ€ng 6 tuÃ¢Ì€n Ä‘aÌƒ... CoÌ€n laÌ£i 1 sÃ´Ì laÌ€ FA, Ä‘Æ°Æ¡ng nhiÃªn con sÃ´Ì naÌ€ y ko thÃªÌ‰ naÌ€o chiÌnh xaÌc, viÌ€ coÌ thÃªÌ‰ nhiu cfs', '2014-10-24 21:49:17', 34);

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
 ADD PRIMARY KEY (`comment_id`), ADD KEY `comment_id` (`comment_id`), ADD KEY `post_id` (`post_id`);

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
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
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
ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_post`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
