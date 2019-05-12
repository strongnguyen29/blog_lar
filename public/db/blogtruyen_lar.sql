-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2019 at 06:50 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogtruyen_lar`
--

-- --------------------------------------------------------

--
-- Table structure for table `bt_authors`
--

CREATE TABLE `bt_authors` (
  `author_id` bigint(20) NOT NULL,
  `author_name` varchar(200) NOT NULL,
  `author_description` text,
  `author_slug` varchar(200) NOT NULL,
  `author_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_categorys`
--

CREATE TABLE `bt_categorys` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL,
  `cat_slug` varchar(200) NOT NULL,
  `cat_description` longtext NOT NULL,
  `cat_type` varchar(200) NOT NULL DEFAULT 'Thể loại',
  `cat_parent` bigint(20) NOT NULL DEFAULT '0',
  `cat_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Luu tru danh muc va cac the loai truyen';

-- --------------------------------------------------------

--
-- Table structure for table `bt_category_story`
--

CREATE TABLE `bt_category_story` (
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `story_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_chapters`
--

CREATE TABLE `bt_chapters` (
  `chap_id` bigint(20) NOT NULL,
  `story_id` bigint(20) NOT NULL DEFAULT '0',
  `chap_name` text NOT NULL,
  `chap_slug` text NOT NULL,
  `chap_number` int(11) NOT NULL DEFAULT '1',
  `chap_content_type` varchar(20) NOT NULL DEFAULT 'text',
  `chap_content` longtext NOT NULL,
  `chap_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Luu tru noi dung chuong truyen';

-- --------------------------------------------------------

--
-- Table structure for table `bt_options`
--

CREATE TABLE `bt_options` (
  `option_id` int(11) NOT NULL,
  `option_name` varchar(200) NOT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Luu tru cac cai dat trang';

-- --------------------------------------------------------

--
-- Table structure for table `bt_storys`
--

CREATE TABLE `bt_storys` (
  `story_id` bigint(20) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `story_name` text NOT NULL,
  `story_description` text NOT NULL,
  `story_slug` text NOT NULL,
  `story_status` varchar(20) NOT NULL DEFAULT 'Đang ra',
  `story_view` bigint(20) NOT NULL DEFAULT '0',
  `story_view_day` bigint(20) NOT NULL DEFAULT '0',
  `story_view_week` bigint(20) NOT NULL DEFAULT '0',
  `story_view_month` bigint(20) NOT NULL DEFAULT '0',
  `story_rating` int(11) NOT NULL DEFAULT '0',
  `story_rating_count` int(11) NOT NULL DEFAULT '0',
  `story_origin` varchar(200) NOT NULL,
  `story_origin_url` varchar(200) NOT NULL,
  `story_origin_id` bigint(20) NOT NULL DEFAULT '0',
  `story_total_chapter` int(11) NOT NULL DEFAULT '0',
  `story_last_chapter` bigint(20) NOT NULL DEFAULT '0',
  `story_modified` datetime NOT NULL,
  `story_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lu tru thong tin truyen';

-- --------------------------------------------------------

--
-- Table structure for table `bt_tags`
--

CREATE TABLE `bt_tags` (
  `tag_id` bigint(20) NOT NULL,
  `tag_name` varchar(200) NOT NULL DEFAULT '',
  `tag_description` text NOT NULL,
  `tag_slug` varchar(200) NOT NULL DEFAULT '',
  `tag_count` bigint(200) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Luu tru tag truyen';

-- --------------------------------------------------------

--
-- Table structure for table `bt_tag_story`
--

CREATE TABLE `bt_tag_story` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The hien quan hre giu 2 bang tag, story';

-- --------------------------------------------------------

--
-- Table structure for table `bt_usermeta`
--

CREATE TABLE `bt_usermeta` (
  `umeta_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bt_users`
--

CREATE TABLE `bt_users` (
  `user_id` bigint(20) NOT NULL,
  `user_role` tinyint(4) NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL,
  `user_pass` varchar(200) NOT NULL DEFAULT '',
  `user_email` varchar(200) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `user_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bt_authors`
--
ALTER TABLE `bt_authors`
  ADD PRIMARY KEY (`author_id`),
  ADD UNIQUE KEY `bt_author_author_name_uindex` (`author_name`);

--
-- Indexes for table `bt_categorys`
--
ALTER TABLE `bt_categorys`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `bt_category_story`
--
ALTER TABLE `bt_category_story`
  ADD PRIMARY KEY (`cat_id`,`story_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `bt_chapters`
--
ALTER TABLE `bt_chapters`
  ADD PRIMARY KEY (`chap_id`);

--
-- Indexes for table `bt_options`
--
ALTER TABLE `bt_options`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `bt_storys`
--
ALTER TABLE `bt_storys`
  ADD PRIMARY KEY (`story_id`);

--
-- Indexes for table `bt_tags`
--
ALTER TABLE `bt_tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `bt_tag_story`
--
ALTER TABLE `bt_tag_story`
  ADD PRIMARY KEY (`tag_id`,`story_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `bt_usermeta`
--
ALTER TABLE `bt_usermeta`
  ADD PRIMARY KEY (`umeta_id`);

--
-- Indexes for table `bt_users`
--
ALTER TABLE `bt_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `tb_users_user_name_uindex` (`user_name`),
  ADD UNIQUE KEY `tb_users_user_email_uindex` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bt_authors`
--
ALTER TABLE `bt_authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_categorys`
--
ALTER TABLE `bt_categorys`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_chapters`
--
ALTER TABLE `bt_chapters`
  MODIFY `chap_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_options`
--
ALTER TABLE `bt_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_storys`
--
ALTER TABLE `bt_storys`
  MODIFY `story_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_tags`
--
ALTER TABLE `bt_tags`
  MODIFY `tag_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_usermeta`
--
ALTER TABLE `bt_usermeta`
  MODIFY `umeta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bt_users`
--
ALTER TABLE `bt_users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
