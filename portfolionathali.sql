-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2024 at 07:14 PM
-- Server version: 8.0.39
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolionathali`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_me`
--

CREATE TABLE `about_me` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `about_me`
--

INSERT INTO `about_me` (`id`, `title`, `description`, `image`, `created_at`) VALUES
(1, '\"Blending IT logic with musical soul, \r\nI create harmony in both worlds.\"', 'I am a student majoring in Informatics at Pembangunan Jaya University. My main focus is in the field of information technology, where I study various things related to programming, data management and system development. However, even though I am busy with the IT world, I also have a huge passion for music, which has become an important part of my life.\r\n\r\nMusic for me is not just a hobby, but also a means to express myself. Through music, I can express feelings, stories, and experiences that I can\'t always convey with words. Musical instruments such as bass, piano and guitar have become my medium for creating, and of course, singing is one way I channel my creativity and emotions.\r\n\r\nWith quite a long experience in the world of music, I feel that music has shaped my personality and perspective on life. Every note and melody that I create or play has its own meaning, and this is what makes music so valuable in my life. I believe that the balance between technology and art, especially music, provides a unique perspective on my life journey.', 'nath1.jpg', '2024-10-19 19:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `image`, `name`, `description`, `link`) VALUES
(1, 'artikel1.jpg', 'Benarkah ChatGPT Membuat Mahasiswa Malas?', 'This article discusses the impact of using ChatGPT on students, specifically whether this AI technology makes students lazy. On the one hand, ChatGPT really helps students in answering questions, providing access to learning materials, and helping them understand difficult topics. However, relying too much on ChatGPT can hinder students\' critical thinking abilities and independence.\r\n\r\n', 'https://geotimes.id/tips/benarkah-chatgpt-membuat-mahasiswa-malas/'),
(2, 'artikel2.jpg', 'Mengungkap Ancaman Deepfake dan Strategi Menghindarinya', 'This article discusses the threat posed by deepfake technology, which allows the manipulation of video and audio to create fake content that looks very real. An example of the case raised was the distribution of indecent photos of the famous singer Taylor Swift, which turned out to be the result of a deepfake. This technology can be used for various malicious acts, such as fraud, defamation, hoaxes and abuse of privacy, which have a negative impact on society.\r\n', 'https://geotimes.id/opini/mengungkap-ancaman-deepfake-dan-strategi-menghindarinya/'),
(3, 'artikel3.jpg', 'Memahami dan Mengatasi Perbedaan Gaya Komunikasi Pria dan Wanita dalam Hubungan', 'This article discusses the differences in communication styles between men and women in relationships, which are often a source of conflict. Women tend to be more expressive and direct when addressing problems, while men often avoid or withdraw to maintain emotional stability. These differences can be influenced by gender roles and cultural norms, which frequently lead to misunderstandings between partners', 'https://kumparan.com/nathali01abarua/memahami-dan-mengatasi-perbedaan-gaya-komunikasi-pria-and-wanita-dalam-hubungan-23iRpvuI3ce');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `address`, `phone_number`, `email`) VALUES
(1, 'Tangerang Selatan, Banten, Indonesia', '08871729073', 'nathali01abarua@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`, `description`) VALUES
(1, 'Informatics, S1', 'Universitas Pembangunan Jaya'),
(2, 'Semester 3', 'Faculty of Technology and Design'),
(3, 'Scholarship', 'OSC Medcom Full Scholarship');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` int NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `image`) VALUES
(1, '1aja.jpg'),
(2, 'nath3.jpg'),
(3, '3aja.jpg'),
(4, 'nath5.jpg'),
(5, 'nath6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `home_section`
--

CREATE TABLE `home_section` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` text NOT NULL,
  `button_text` varchar(100) NOT NULL,
  `button_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `home_section`
--

INSERT INTO `home_section` (`id`, `title`, `subtitle`, `button_text`, `button_link`) VALUES
(4, 'Hi, I am Nathali!', 'A female musician who always expresses stories through melody', 'See My CV', 'CV Nathali Katrin.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `instruments_section`
--

CREATE TABLE `instruments_section` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `instruments_section`
--

INSERT INTO `instruments_section` (`id`, `name`, `description`, `image`) VALUES
(2, 'Vocal', 'Everyone loves to sing, right?\r\n', 'vocal.jpg'),
(3, 'Key', 'My second favorite\r\n', 'synth.jpg'),
(5, 'Bass', 'I\'m really good at this one\r\n', 'bass.jpg'),
(6, 'Piano', 'Best for expressing feelings\r\n', 'piano.jpg'),
(7, 'Guitar', 'Very useful at hangouts\r\n', 'guitar.jpg'),
(8, 'Drum', 'Actually, I\'m still learning this one', 'drum.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'hilmi', 'hilmimuhammad1298@gmail.com', 'test1', '2024-10-19 17:38:43'),
(2, 'hilmi', 'hilmimuhammad1298@gmail.com', 'test2', '2024-10-19 17:40:48'),
(3, 'hilmi', 'hilmimuhammad1298@gmail.com', 'test akhir', '2024-10-20 22:01:58'),
(4, 'hilmi', 'hilmimuhammad1298@gmail.com', 'test perubahan notifikasi', '2024-10-20 22:06:13'),
(5, 'Hilmi', 'hilmi.muhammad@gmail.com', 'I love you...', '2024-10-22 16:35:12'),
(6, 'Nathali Katrin Fredeline Abarua', 'nathali01abarua@gmail.com', 'coba lagi aja', '2024-10-23 17:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`id`, `image`, `name`, `title`) VALUES
(51, 'nathali.jpg', 'Wedding', '2018 - Present'),
(52, 'porto2.jpg', 'Events', '2018 - Present'),
(53, 'porto3.jpg', 'Collab', '2018 - Present'),
(54, 'porto4.jpg', 'Join us for live music every Saturday & Sunday at Peri Zicron Cafe, 7pm - 11pm!', ''),
(55, 'porto5.jpg', 'Bring your friends and enjoy a night of very great music, and also good vibes!', ''),
(56, 'porto6.jpg', 'Don’t miss out on a memorable musical experience! See you at the event later!', ''),
(57, 'porto7.jpg', 'Festival', '2021'),
(58, 'porto8.jpg', 'Pensi', '2020 - Present'),
(59, 'porto9.jpg', 'Tribute to', '2021 - Present');

-- --------------------------------------------------------

--
-- Table structure for table `works_section`
--

CREATE TABLE `works_section` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `works_section`
--

INSERT INTO `works_section` (`id`, `name`, `title`, `image`) VALUES
(17, 'X Factor Indonesia 2021', 'I got the Top 6 Award in the Group Category', 'xfactor1new.jpg'),
(19, 'X Factor Indonesia 2021', 'I got the Top 6 Award in the Group Category', 'xfactor2.jpg'),
(25, 'X Factor Indonesia 2021', 'I got the Top 6 Award in the Group Category', 'xfactor3.jpg'),
(26, 'X Factor Indonesia 2021', 'I followed online audition for X Factor Indonesia 2021. Unexpectedly, I passed the judging stage which will be broadcast on television. This stage was attended by hundreds of thousands of people from all over Indonesia, but I managed to pass to the next stage.', 'xfactor6.jpg'),
(27, 'X Factor Indonesia 2021', 'I have gone through various stages with various obstacles. There are a total of 7 stages that I have to pass to be able to get an award as the top 30 in all categories and the top 6 in the group category.', 'xfactor4.jpg'),
(28, 'X Factor Indonesia 2021', 'I gained very valuable lessons and experiences. This will be a memory that I will never forget. A big thank you to X Factor Indonesia for giving me the opportunity to experience a very luxurious and spectacular stage!', 'xfactor5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_me`
--
ALTER TABLE `about_me`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_section`
--
ALTER TABLE `home_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instruments_section`
--
ALTER TABLE `instruments_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `works_section`
--
ALTER TABLE `works_section`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_me`
--
ALTER TABLE `about_me`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `home_section`
--
ALTER TABLE `home_section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `instruments_section`
--
ALTER TABLE `instruments_section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `works_section`
--
ALTER TABLE `works_section`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
