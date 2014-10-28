-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2014 at 05:50 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `forumdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `CmtID` int(11) NOT NULL AUTO_INCREMENT,
  `Content` varchar(512) NOT NULL,
  `CmtDay` date NOT NULL,
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`CmtID`),
  KEY `PostID` (`PostID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `PostID` int(11) NOT NULL AUTO_INCREMENT,
  `PostTitle` varchar(100) NOT NULL,
  `View` int(11) NOT NULL DEFAULT '0',
  `Content` varchar(1024) NOT NULL,
  `PostedDay` date NOT NULL,
  `PostUser` int(11) NOT NULL,
  `GivenUser` int(11) NOT NULL,
  PRIMARY KEY (`PostID`),
  KEY `PostUser` (`PostUser`),
  KEY `GivenUser` (`GivenUser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

-- --------------------------------------------------------

--
-- Table structure for table `resetpassword`
--

CREATE TABLE IF NOT EXISTS `resetpassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `pass_key` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `resetpassword`
--

INSERT INTO `resetpassword` (`id`, `email_id`, `pass_key`, `date_created`, `status`) VALUES
(1, 5, '544aa039f11541.49083152', '2014-10-25 01:53:45', 'A'),
(2, 5, '544aa03e719f99.01727501', '2014-10-25 01:53:50', 'A'),
(3, 5, '544aa03fcf3131.56796024', '2014-10-25 01:53:51', 'A'),
(4, 5, '544aa0412cf790.61606949', '2014-10-25 01:53:53', 'A'),
(5, 5, '544aa043097980.91490209', '2014-10-25 01:53:55', 'A'),
(6, 5, '544aa0a2db8e28.51848019', '2014-10-25 01:55:30', 'A'),
(7, 5, '544aa0d43234e3.30542586', '2014-10-25 01:56:20', 'A'),
(8, 5, '544aa12e6122a2.11404271', '2014-10-25 01:57:50', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FName` varchar(255) NOT NULL,
  `LName` varchar(255) NOT NULL,
  `Dob` date NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Address` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `UserID` (`UserID`),
  KEY `UserID_2` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `FName`, `LName`, `Dob`, `Email`, `Password`, `Address`) VALUES
(5, 'Minh Thanh', 'Vo ', '2014-10-24', 'vmthanh@apcs.vn', '$1$ib0.Du..$mGNktjtt2Wu3LcUdPmW4A.', 'cao lanh'),
(8, 'Kha', 'Vo', '2014-10-11', 'luckyluck379@gmail.com', '$1$rD/.Y75.$nHe.ia9YBVxvABSzVDlfh.', 'Dong Thap');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`PostUser`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`GivenUser`) REFERENCES `user` (`UserID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
