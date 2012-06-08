-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 03, 2011 at 10:30 PM
-- Server version: 5.1.49
-- PHP Version: 5.3.3-1ubuntu9.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ziown`
--

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE IF NOT EXISTS `codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `codes`
--


-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(150) CHARACTER SET utf8 NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8 NOT NULL,
  `plain_body` text CHARACTER SET utf8 NOT NULL,
  `html_body` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `type`, `subject`, `plain_body`, `html_body`) VALUES
(6, 'ACCOUNT_ACTIVATION_EMAIL', 'Ziown - Account Activation', 'Dear {USER_NAME},\r\n\r\nPlease on the link to activate your account\r\n\r\n{ACTIVATION_URL}\r\n\r\nZiown Support Team\r\n\r\n', 'Dear {USER_NAME},\r\n\r\nPlease on the link to activate your account\r\n\r\n{ACTIVATION_URL}\r\n\r\nZiown Support Team\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE IF NOT EXISTS `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `instructions` varchar(250) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `options` text NOT NULL,
  `size` int(11) NOT NULL,
  `default_value` varchar(100) DEFAULT NULL,
  `position` tinyint(4) NOT NULL,
  `range_min` int(11) NOT NULL,
  `range_max` int(11) NOT NULL,
  `range_type` tinyint(4) NOT NULL,
  `cols` smallint(6) NOT NULL DEFAULT '0',
  `rows` smallint(6) NOT NULL DEFAULT '0',
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `field_validation` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FormId` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `fields`
--


-- --------------------------------------------------------

--
-- Table structure for table `field_types`
--

CREATE TABLE IF NOT EXISTS `field_types` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `field_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE IF NOT EXISTS `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `spam_email` varchar(255) NOT NULL,
  `redirect` varchar(255) NOT NULL,
  `success_message` text,
  `create_date` date NOT NULL DEFAULT '0000-00-00',
  `uses` int(11) NOT NULL DEFAULT '0',
  `s_uses` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `send_button_name` varchar(64) NOT NULL,
  `send_button_align` varchar(12) NOT NULL,
  `label_placement` varchar(50) DEFAULT NULL,
  `clear_button` tinyint(4) NOT NULL DEFAULT '0',
  `clear_button_name` varchar(64) CHARACTER SET latin1 NOT NULL,
  `anti_spam` tinyint(4) NOT NULL DEFAULT '0',
  `display_mode` tinyint(4) NOT NULL DEFAULT '0',
  `font_face` varchar(64) CHARACTER SET latin1 NOT NULL,
  `font_size` float NOT NULL DEFAULT '0',
  `bg_color` varchar(7) CHARACTER SET latin1 NOT NULL,
  `color` varchar(7) NOT NULL,
  `show_form_name` tinyint(4) DEFAULT NULL,
  `header` text NOT NULL,
  `footer` text NOT NULL,
  `table_css` text NOT NULL,
  `td_css` text NOT NULL,
  `message_from_option` tinyint(4) NOT NULL DEFAULT '1',
  `message_from` varchar(250) DEFAULT NULL,
  `message_subject_option` tinyint(4) NOT NULL DEFAULT '1',
  `message_subject` varchar(250) DEFAULT NULL,
  `description` text NOT NULL,
  `paid` tinyint(4) NOT NULL,
  `style` tinyint(4) NOT NULL,
  `field_json` text,
  `form_json` text,
  `link` varchar(250) DEFAULT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forms`
--


-- --------------------------------------------------------

--
-- Table structure for table `forms_data`
--

CREATE TABLE IF NOT EXISTS `forms_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `submitted_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `delivered_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `temp_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `security_code` varchar(64) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `forms_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `form_fields_data`
--

CREATE TABLE IF NOT EXISTS `form_fields_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) NOT NULL DEFAULT '0',
  `field_id` int(11) NOT NULL DEFAULT '0',
  `data` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EmailId` (`email_id`),
  KEY `FFieldId` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_fields_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `form_statuses`
--

CREATE TABLE IF NOT EXISTS `form_statuses` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `form_statuses`
--


-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` smallint(6) unsigned NOT NULL,
  `permission` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `role`, `permission`) VALUES
(13, 1, 'core_index_index');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`) VALUES
(1, 'mango'),
(2, 'orange');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'User', ''),
(2, 'Advertiser', ''),
(3, 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `rosources`
--

CREATE TABLE IF NOT EXISTS `rosources` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rosources`
--

INSERT INTO `rosources` (`id`, `name`) VALUES
(1, 'core_index_index');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `value` varchar(300) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `title`) VALUES
(2, 'admin_email', 'rajuniit_bd@yahoo.com', 'Admin Email'),
(3, 'site_name', 'Ziown', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `form_id` int(11) NOT NULL,
  `category` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `slug`, `form_id`, `category`) VALUES
(1, 'testing', 'testing', 247, '1'),
(4, 'testing nothing', 'testing-nothing', 2, 'surveys'),
(5, 'testing nothing', 'testing-nothing-2', 3, 'invitations'),
(6, 'testin nothing', 'testin-nothing', 4, 'surveys'),
(7, 'testin nothing', 'testin-nothing1295189720', 4, 'surveys'),
(8, 'testing nothing', 'testing-nothing-1295189768', 4, 'surveys');

-- --------------------------------------------------------

--
-- Table structure for table `template_categories`
--

CREATE TABLE IF NOT EXISTS `template_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slug` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `template_categories`
--

INSERT INTO `template_categories` (`id`, `name`, `slug`) VALUES
(1, 'Surveys', 'surveys'),
(2, 'Invitations', 'invitations');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `css_property` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `css_property`) VALUES
(1, 'default', 'a:4:{s:9:"themeName";s:7:"default";s:7:"logoUrl";s:25:"/assets/images/fjlogo.png";s:11:"bgLogoColor";s:5:"green";s:11:"bgFormColor";s:7:"#cccccc";}'),
(2, 'pink', 'a:4:{s:9:"themeName";s:4:"pink";s:7:"logoUrl";s:25:"/assets/images/fjlogo.png";s:11:"bgLogoColor";s:4:"pink";s:11:"bgFormColor";s:4:"pink";}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role` smallint(5) unsigned NOT NULL,
  `ip_address` char(16) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `status` smallint(5) unsigned NOT NULL,
  `plan` smallint(5) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `plan` (`plan`),
  KEY `role` (`role`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `ip_address`, `username`, `password`, `email`, `activation_code`, `forgotten_password_code`, `status`, `plan`, `create_date`) VALUES
(14, 1, '127.0.1.1', 'rajuniit', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'rajuniit@gmail.com', '', NULL, 1, 1, '2011-07-10 17:20:23'),
(15, 1, '127.0.1.1', 'raju', '10470c3b4b1fed12c3baac014be15fac67c6e815', 'raju@gmail.com', 'dd4ad318461730405bdc619b1bceef0d00bf784d', NULL, 3, 1, '2011-08-03 18:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_statuses`
--

CREATE TABLE IF NOT EXISTS `user_statuses` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_statuses`
--

INSERT INTO `user_statuses` (`id`, `name`) VALUES
(1, 'active'),
(2, 'inactive'),
(3, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `user_themes`
--

CREATE TABLE IF NOT EXISTS `user_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`theme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_themes`
--

INSERT INTO `user_themes` (`id`, `user_id`, `theme_id`) VALUES
(4, 3, 1),
(3, 3, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`status`) REFERENCES `user_statuses` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`plan`) REFERENCES `plans` (`id`);
SET FOREIGN_KEY_CHECKS=1;
