-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2024 at 07:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `imagepath` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Active',
  `publish` tinyint(4) NOT NULL DEFAULT 2,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `short_desc`, `slug`, `description`, `imagepath`, `user_id`, `category_id`, `status`, `publish`, `created_at`) VALUES
(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'lorem-ipsum-is-simply-dummy-text-of-the-printing-and-typesetting-industry', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '1721130727213m7cohclyocsoj1.jpg', 1, 1, 1, 1, '2024-07-16 11:52:07'),
(2, 'It is a long established fact that a reader will be content of a page when looking at its layout.', 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum ', 'it-is-a-long-established-fact-that-a-reader-will-be-distracted-by-the-readable-content-of-a-page-when-looking-at-its-layout', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '1721130845760m7cohclyocv800.jpg', 1, 1, 1, 2, '2024-07-16 11:54:05'),
(3, 'Contrary to popular belief, Lorem Ipsum is not simply random text.', 'Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage', 'contrary-to-popular-belief-lorem-ipsum-is-not-simply-random-text', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>&nbsp;</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '1721130921157m7cohclyocwu6d.jpg', 1, 1, 1, 2, '2024-07-16 11:55:21'),
(4, 'Aliquam interdum ante nisl, eget semper ex aliquam at.', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 'aliquam-interdum-ante-nisl-eget-semper-ex-aliquam-at', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare maximus dictum. Mauris vitae orci risus. Fusce tortor nisi, ullamcorper non hendrerit sed, auctor consectetur est. Praesent molestie risus a porttitor luctus. Aliquam finibus felis in condimentum placerat. Pellentesque rhoncus, tellus in viverra vestibulum, nulla dolor varius leo, consequat rhoncus purus augue eget eros. Aliquam id turpis placerat, venenatis arcu egestas, placerat nibh. In hac habitasse platea dictumst. Fusce semper tortor in imperdiet hendrerit.</p><p>In a porttitor sem. Aliquam interdum ante nisl, eget semper ex aliquam at. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque in ligula tristique, pellentesque nunc vel, scelerisque nulla. Vestibulum suscipit nulla in leo laoreet, non consectetur mauris sagittis. Aenean nec tempor ex. Morbi porta leo laoreet, pellentesque massa sed, bibendum leo. Proin vehicula lacinia aliquam. Vivamus nisl turpis, aliquam ac justo sit amet, ornare scelerisque leo. Curabitur eu elit at leo fringilla faucibus. Etiam feugiat non velit eget gravida.</p>', '1721133251689m7cohclyoeasfd.jpg', 1, 15, 1, 2, '2024-07-16 12:34:11'),
(5, 'Praesent fringilla ullamcorper tincidunt. In eget posuere mi.', 'Quisque aliquam diam at egestas rhoncus. Ut aliquet nunc nec elementum maximus. Quisque in nunc ut dui dignissim gravida vel nec tortor.', 'praesent-fringilla-ullamcorper-tincidunt-in-eget-posuere-mi', '<p>Vestibulum fringilla velit sed molestie congue. In ut aliquam ligula, vel imperdiet augue. Curabitur rhoncus tellus sit amet est suscipit, nec sodales justo iaculis.</p><p>raesent fringilla ullamcorper tincidunt. In eget posuere mi. Vestibulum condimentum nulla non nisi interdum, sed eleifend orci pellentesque. Quisque aliquam diam at egestas rhoncus. Ut aliquet nunc nec elementum maximus. Quisque in nunc ut dui dignissim gravida vel nec tortor. &nbsp;Morbi vel dui vel est hendrerit pretium. Cras lobortis mauris quis interdum tincidunt. Maecenas viverra fermentum elit ac lobortis. Curabitur tempor ligula sit amet ipsum vestibulum, a maximus leo convallis. Mauris sem felis, bibendum et tortor vitae, consectetur pulvinar erat. In vel nisi eget nisi tempor aliquam. Praesent at scelerisque nunc. Aenean eleifend sagittis pharetra. Nunc sed neque sit amet est egestas viverra. Maecenas ipsum enim, auctor feugiat imperdiet ac, pharetra tempus odio. Vestibulum lectus mi, vestibulum eu elementum et, consequat vitae erat. Proin volutpat felis quis ante pretium</p>', '1721133323980m7cohclyoecc7g.jpg', 1, 14, 1, 1, '2024-07-16 12:35:24'),
(6, 'Cras lobortis mauris quis interdum tincidunt. Maecenas viverra fermentum elit ac lobortis.', 'Morbi vel dui vel est hendrerit pretium. Cras lobortis mauris quis interdum tincidunt. Curabitur tempor ligula sit amet ipsum vestibulum, a maximus leo convallis.', 'cras-lobortis-mauris-quis-interdum-tincidunt-maecenas-viverra-fermentum-elit-ac-lobortis', '<p>ras suscipit ornare accumsan. Sed et volutpat metus, id ultrices massa. Mauris hendrerit, metus porttitor viverra posuere, quam velit dictum nisi, eget hendrerit erat orci sed tellus. Aliquam magna mi, laoreet sit amet hendrerit nec, molestie et nisl. Aenean hendrerit risus porttitor elementum scelerisque. Vivamus tristique, sem ut facilisis condimentum, eros ipsum laoreet nisl, vitae tristique lectus enim et orci. Donec fermentum ex et interdum gravida.</p><p>In hac habitasse platea dictumst. Morbi vel dui vel est hendrerit pretium. Cras lobortis mauris quis interdum tincidunt. Maecenas viverra fermentum elit ac lobortis. Curabitur tempor ligula sit amet ipsum vestibulum, a maximus leo convallis. Mauris sem felis, bibendum et tortor vitae, consectetur pulvinar erat. In vel nisi eget nisi tempor aliquam. Praesent at scelerisque nunc. Aenean eleifend sagittis pharetra. Nunc sed neque sit amet est egestas viverra. Maecenas ipsum enim, auctor feugiat imperdiet ac, pharetra tempus odio. Vestibulum lectus mi, vestibulum eu elementum et, consequat vitae erat. Proin volutpat felis quis ante pretium, non aliquet neque dictum. Nulla quis sem velit.</p>', '1721133397016m7cohclyoedwk8.jpg', 1, 13, 1, 2, '2024-07-16 12:36:37'),
(7, 'Cras suscipit ornare accumsan. Sed et volutpat metus, id ultrices massa.', 'Mauris hendrerit, metus porttitor viverra posuere, quam velit dictum nisi, eget hendrerit erat orci sed tellus.', 'cras-suscipit-ornare-accumsan-sed-et-volutpat-metus-id-ultrices-massa', '<p>In hac habitasse platea dictumst. Morbi vel dui vel est hendrerit pretium. Cras lobortis mauris quis interdum tincidunt. Maecenas viverra fermentum elit ac lobortis. Curabitur tempor ligula sit amet ipsum vestibulum, a maximus leo convallis. Mauris sem felis, bibendum et tortor vitae, consectetur pulvinar erat. In vel nisi eget nisi tempor aliquam. Praesent at scelerisque nunc. Aenean eleifend sagittis pharetra. Nunc sed neque sit amet est egestas viverra. Maecenas ipsum enim, auctor feugiat imperdiet ac, pharetra tempus odio. Vestibulum lectus mi, vestibulum eu elementum et, consequat vitae erat. Proin volutpat felis quis ante pretium, non aliquet neque dictum. Nulla quis sem velit.</p><p>Cras suscipit ornare accumsan. Sed et volutpat metus, id ultrices massa. Mauris hendrerit, metus porttitor viverra posuere, quam velit dictum nisi, eget hendrerit erat orci sed tellus. Aliquam magna mi, laoreet sit amet hendrerit nec, molestie et nisl. Aenean hendrerit risus porttitor elementum scelerisque. Vivamus tristique, sem ut facilisis condimentum, eros ipsum laoreet nisl, vitae tristique lectus enim et orci. Donec fermentum ex et interdum gravida.</p>', '1721133445869m7cohclyoeey99.jpg', 1, 12, 1, 1, '2024-07-16 12:37:25'),
(8, 'Donec scelerisque tincidunt justo, ut porta felis molestie in. Quisque auctor neque orci', 'Sed eget ante a elit venenatis vestibulum vel sit amet nunc. Quisque non sapien eget nulla porttitor tempus vitae vitae est. Maecenas ornare non leo vitae molestie.', 'donec-scelerisque-tincidunt-justo-ut-porta-felis-molestie-in-quisque-auctor-neque-orci', '<p>Donec scelerisque tincidunt justo, ut porta felis molestie in. Quisque auctor neque orci, ut tristique augue aliquam sed. Praesent ut iaculis augue, a accumsan felis. Aliquam porta suscipit suscipit. Sed eget ante a elit venenatis vestibulum vel sit amet nunc. Quisque non sapien eget nulla porttitor tempus vitae vitae est. Maecenas ornare non leo vitae molestie.</p><p><i>Integer lorem odio, ultrices id mi suscipit, semper faucibus lorem. Pellentesque in velit mi. Duis fringilla pellentesque dui non luctus. Suspendisse dictum nibh venenatis tortor tincidunt egestas a pharetra leo. Proin quis risus est. Fusce fringilla pulvinar odio. Mauris vitae ante vel odio finibus tempus. Nam vel orci a sapien cursus consequat ac congue tortor.</i></p>', '1721133538189m7cohclyoegxhp.jpg', 1, 11, 1, 1, '2024-07-16 12:38:58'),
(9, 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Nulla facilisi. Fusce tortor lorem, fringilla a metus eget, posuere tempus orci. Integer facilisis est quis leo tristique, sit amet aliquet massa imperdiet. ', 'orci-varius-natoque-penatibus-et-magnis-dis-parturient-montes-nascetur-ridiculus-mus-curabitur-cursus-felis-nulla', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc pretium efficitur enim non consectetur. Ut tristique arcu vitae metus aliquet, et faucibus dui ultrices. Nulla non posuere enim. Nulla feugiat sodales metus non dapibus. Aliquam vestibulum mi non libero interdum hendrerit. Duis tristique eleifend nulla ut dignissim. Suspendisse quis urna sagittis massa vulputate condimentum elementum sit amet ipsum. Sed vehicula justo eget nunc ultricies lacinia. Aliquam justo justo, scelerisque nec rhoncus ac, ullamcorper eu dolor. Morbi luctus congue elit.</p><p>Donec scelerisque tincidunt justo, ut porta felis molestie in. Quisque auctor neque orci, ut tristique augue aliquam sed. Praesent ut iaculis augue, a accumsan felis. Aliquam porta suscipit suscipit. Sed eget ante a elit venenatis vestibulum vel sit amet nunc. Quisque non sapien eget nulla porttitor tempus vitae vitae est. Maecenas ornare non leo vitae molestie.</p><p>Integer lorem odio, ultrices id mi suscipit, semper faucibus lorem. Pellentesque in velit mi. Duis fringilla pellentesque dui non luctus. Suspendisse dictum nibh venenatis tortor tincidunt egestas a pharetra leo. Proin quis risus est. Fusce fringilla pulvinar odio. Mauris vitae ante vel odio finibus tempus. Nam vel orci a sapien cursus consequat ac congue tortor.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur cursus felis nulla, a blandit eros congue nec. Nulla facilisi. Fusce tortor lorem, fringilla a metus eget, posuere tempus orci. Integer facilisis est quis leo tristique, sit amet aliquet massa imperdiet. Sed quis eros eget sem gravida sodales. Pellentesque neque ipsum, tristique in eros volutpat, elementum tempor enim. Nam sit amet diam sit amet metus sodales bibendum nec quis sem. Pellentesque rutrum nec nisl id suscipit. Cras risus leo, venenatis eu mollis eu, bibendum semper nibh. Pellentesque pellentesque neque eget diam molestie imperdiet.</p>', '1721133637454m7cohclyoej232.jpg', 1, 10, 1, 2, '2024-07-16 12:40:37'),
(10, 'Praesent at pretium nibh. Nunc tincidunt magna ipsum', 'Vivamus lorem dolor, maximus in consectetur et, dignissim id odio. Ut enim odio, cursus nec elementum at, viverra eget est. ', 'praesent-at-pretium-nibh-nunc-tincidunt-magna-ipsum-id-egestas-tortor-consectetur-non', '<p>Sed leo magna, scelerisque vitae nunc eu, lacinia fringilla sapien. Vivamus ullamcorper at purus et tempus. Morbi rutrum erat et lorem malesuada, a accumsan urna consectetur. Morbi magna tellus, convallis ornare varius a, viverra vel erat. Morbi quis sollicitudin nisi, rutrum sodales velit. Pellentesque dui nisl, malesuada nec leo ac, aliquet mattis nisl. Aenean est velit, vulputate non risus sit amet, rhoncus pellentesque velit.</p><p>Integer ac massa ut dui rhoncus dignissim. Cras cursus ullamcorper elit, convallis pretium nunc posuere ac. In molestie dapibus odio, et vehicula quam. Ut vulputate nec risus non tristique. Proin tristique rutrum egestas. Vivamus non arcu libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vitae sem ut magna sodales luctus nec sit amet orci. Pellentesque leo nunc, sollicitudin non ipsum sit amet, consequat rutrum dui. Mauris viverra ipsum et posuere convallis.</p><p>Praesent nulla dui, dapibus id lorem vitae, pretium eleifend lacus. Suspendisse eu lectus vitae nunc facilisis iaculis at ut urna. Duis nec eros blandit, malesuada est at, gravida nulla. Nam vel libero a orci blandit lacinia. Ut auctor sagittis nulla, ac ultricies ex eleifend non. Nunc ut turpis mi. Phasellus pharetra, tellus et feugiat porta, lacus tellus lobortis lacus, in eleifend leo mi in nisl. Aenean vel mi aliquam, mattis nisl ut, sollicitudin quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas varius turpis tellus, at tempor leo malesuada quis. Curabitur ut sapien ac erat euismod malesuada.</p>', '1721133934288m7cohclyoepf4g.jpg', 1, 9, 1, 1, '2024-07-16 12:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `status`, `created_at`) VALUES
(1, 'News', 1, '2024-07-16 11:10:13'),
(2, 'Finance', 1, '2024-07-16 12:01:44'),
(3, 'Business', 1, '2024-07-16 12:01:52'),
(4, 'Marketing', 1, '2024-07-16 12:02:08'),
(5, 'Sales', 1, '2024-07-16 12:02:18'),
(6, 'Design and development', 1, '2024-07-16 12:02:26'),
(7, 'Technology', 1, '2024-07-16 12:02:33'),
(8, 'Education', 1, '2024-07-16 12:02:40'),
(9, 'Entertainment ', 1, '2024-07-16 12:03:07'),
(10, 'Travel ', 1, '2024-07-16 12:03:14'),
(11, 'Food and drink', 1, '2024-07-16 12:03:25'),
(12, 'Beauty and fashion ', 1, '2024-07-16 12:03:39'),
(13, 'Health and fitness ', 1, '2024-07-16 12:03:48'),
(14, 'Gaming ', 1, '2024-07-16 12:03:58'),
(15, 'Science and medicine ', 1, '2024-07-16 12:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT '''User''',
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `status`, `created_at`) VALUES
(1, 'Satyendra Singh', 'satyendrasinghbca777@gmail.com', 'password', 'Admin', 1, '2024-07-16 10:52:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
