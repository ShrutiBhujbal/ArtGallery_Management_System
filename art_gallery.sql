-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2025 at 01:11 PM
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
-- Database: `art_gallery`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_count` (IN `custid` INT, IN `artid` INT, IN `newcount` INT)  MODIFIES SQL DATA COMMENT 'updates or inserts into the purchases ' BEGIN
    DECLARE oldcount INT DEFAULT 0;
    declare updatecount INT;
SELECT 
    purchases.count
INTO oldcount FROM
    purchases
WHERE
    purchases.id = custid
        AND purchases.art_id = artid; IF oldcount = 0 THEN
INSERT INTO purchases(id,art_id,count)
VALUES(custid, artid, newcount); ELSE
SET
    updatecount = newcount + oldcount;
UPDATE purchases 
SET 
    purchases.count = updatecount
WHERE
    purchases.id = custid
        AND purchases.art_id = artid;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `art`
--

CREATE TABLE `art` (
  `art_id` int(11) NOT NULL,
  `art_title` varchar(50) NOT NULL,
  `artist` varchar(50) NOT NULL,
  `art_type` varchar(30) NOT NULL,
  `art_price` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `stock` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `art`
--

INSERT INTO `art` (`art_id`, `art_title`, `artist`, `art_type`, `art_price`, `seller_id`, `stock`) VALUES
(1, 'Morden Indian style', 'M.F.Husain', 'Painting', 1000, 4, 47),
(2, 'Folk Art', 'Baua Devi', 'Painting', 1200, 2, 39),
(3, 'Abstract Art', 'V. S. Gaitonde', 'Painting', 1745, 3, 50),
(4, 'Mandala Art', 'Chetna Singla', 'Painting', 3000, 1, 41),
(5, 'Folk Art', 'Supriya Guha', 'painting', 4400, 3, 60),
(6, 'Mandala Art', 'Chetna Singla', 'Painting', 2200, 1, 42),
(7, 'Morden Indian style', 'M.F.Husain', 'Painting', 3000, 2, 49),
(8, 'Abstract Art', 'V. S. Gaitonde', 'Painting', 3000, 4, 40),
(9, 'Mandala Art', 'Baua Devi', 'Painting', 4059, 1, 46),
(10, 'Folk Art', 'Supriya Guha', 'Painting', 3200, 3, 53),
(11, 'Morden Indian style', 'M.F.Husain', 'Painting', 1500, 1, 40),
(12, 'Abstract Art', 'V. S. Gaitonde', 'Painting', 2489, 3, 50),
(13, 'Mandala Art', 'Rutuja Chaudhari', 'Painting', 3000, 2, 39),
(14, 'Folk Art', 'Supriya Guha', 'Painting', 2100, 4, 50),
(15, 'Morden Indian style', 'Rutuja Chaudhari', 'Painting', 2200, 3, 53),
(16, 'Abstract Art', 'V. S. Gaitonde', 'Painting', 2000, 2, 40),
(17, 'Mandala Art', 'Chetna Singla', 'Painting', 1800, 4, 50),
(18, 'Folk Art', 'Rutuja Chaudhari', 'Painting', 2500, 4, 42),
(19, 'Morden Indian style', 'M.F.Husain', 'Painting', 1500, 3, 50),
(20, 'Abstract Art', 'Baua Devi', 'Painting', 1745, 2, 42),
(21, 'Mandala Art', 'Supriya Guha', 'Painting', 1900, 1, 61),
(22, 'Folk Art', 'Supriya Guha', 'Painting', 1500, 2, 40),
(23, 'Abstract Art', 'V. S. Gaitonde', 'Painting', 1500, 4, 40),
(24, 'Morden Indian style', 'Chetna Singla', 'Painting', 1489, 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `art_description`
--

CREATE TABLE `art_description` (
  `art_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `year` int(4) NOT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `art_description`
--

INSERT INTO `art_description` (`art_id`, `description`, `year`, `photo`) VALUES
(1, 'Modern Indian style art is a vibrant fusion of traditional Indian aesthetics with contemporary themes and techniques. It draws inspiration from India\'s rich cultural heritage, including tribal art, folk traditions, and classical motifs, while integrating modern forms like abstract expressionism, minimalism, and digital art. Artists often explore themes of identity, social change, mythology, and globalization, using mediums ranging from canvas and sculpture to mixed media and installations. This style reflects the evolving Indian ethos, bridging the gap between ancient traditions and the global art landscape.', 1893, 'Modern_indian_style.jpeg'),
(2, 'Folk art refers to traditional art forms created by self-taught or community-based artisans, often reflecting cultural heritage and local traditions. It encompasses a wide range of crafts, including painting, sculpture, textiles, pottery, and decorative objects, characterized by their vibrant colours, intricate patterns, and storytelling elements. Typically passed down through generations, folk art is deeply rooted in the daily lives, rituals, and beliefs of a community. It often serves both functional and aesthetic purposes, celebrating the shared identity and creativity of its people.', 1889, 'folk_art1.jpeg'),
(3, 'Abstract art is a modern art form that moves away from realistic representation to focus on shapes, colours, forms, and textures. It emphasizes emotional expression, creativity, and imagination, often leaving interpretation open to the viewer. Originating in the early 20th century with artists like Wassily Kandinsky and Piet Mondrian, abstract art challenges traditional perspectives by depicting ideas, emotions, or concepts rather than concrete objects. This style encompasses a wide range of techniques, from geometric patterns to fluid, organic compositions, making it a versatile and thought-provoking artistic movement.', 1903, 'Abstract_art1.jpeg'),
(4, 'Mandala art is a spiritual and intricate design form rooted in ancient Indian traditions, symbolizing the universe, balance, and harmony. Derived from the Sanskrit word \"mandala,\" meaning \"circle,\" it often features symmetrical patterns radiating from a central point. Mandalas are used for meditation, mindfulness, and spiritual growth, with their repetitive geometric shapes and vibrant colours evoking a sense of calm and focus. While traditionally created using natural elements like sand or pigments, modern mandala art spans diverse media, blending traditional motifs with contemporary interpretations.', 1931, 'Mandala art1.jpeg'),
(5, 'Folk art refers to traditional art forms created by self-taught or community-based artisans, often reflecting cultural heritage and local traditions. It encompasses a wide range of crafts, including painting, sculpture, textiles, pottery, and decorative objects, characterized by their vibrant colours, intricate patterns, and storytelling elements. Typically passed down through generations, folk art is deeply rooted in the daily lives, rituals, and beliefs of a community. It often serves both functional and aesthetic purposes, celebrating the shared identity and creativity of its people.', 1897, 'folk_art2.jpeg'),
(6, 'Mandala art is a spiritual and intricate design form rooted in ancient Indian traditions, symbolizing the universe, balance, and harmony. Derived from the Sanskrit word \"mandala,\" meaning \"circle,\" it often features symmetrical patterns radiating from a central point. Mandalas are used for meditation, mindfulness, and spiritual growth, with their repetitive geometric shapes and vibrant colours evoking a sense of calm and focus. While traditionally created using natural elements like sand or pigments, modern mandala art spans diverse media, blending traditional motifs with contemporary interpretations.', 1931, 'mandala_art2.jpg'),
(7, 'Modern Indian style art is a vibrant fusion of traditional Indian aesthetics with contemporary themes and techniques. It draws inspiration from India\'s rich cultural heritage, including tribal art, folk traditions, and classical motifs, while integrating modern forms like abstract expressionism, minimalism, and digital art. Artists often explore themes of identity, social change, mythology, and globalization, using mediums ranging from canvas and sculpture to mixed media and installations. This style reflects the evolving Indian ethos, bridging the gap between ancient traditions and the global art landscape.', 1932, 'modern_img2.jpg'),
(8, 'Abstract art is a modern art form that moves away from realistic representation to focus on shapes, colours, forms, and textures. It emphasizes emotional expression, creativity, and imagination, often leaving interpretation open to the viewer. Originating in the early 20th century with artists like Wassily Kandinsky and Piet Mondrian, abstract art challenges traditional perspectives by depicting ideas, emotions, or concepts rather than concrete objects. This style encompasses a wide range of techniques, from geometric patterns to fluid, organic compositions, making it a versatile and thought-provoking artistic movement.', 2004, 'abstract_2.jpg'),
(9, 'Mandala art is a spiritual and intricate design form rooted in ancient Indian traditions, symbolizing the universe, balance, and harmony. Derived from the Sanskrit word \"mandala,\" meaning \"circle,\" it often features symmetrical patterns radiating from a central point. Mandalas are used for meditation, mindfulness, and spiritual growth, with their repetitive geometric shapes and vibrant colours evoking a sense of calm and focus. While traditionally created using natural elements like sand or pigments, modern mandala art spans diverse media, blending traditional motifs with contemporary interpretations.', 1964, 'mandala_art3.jpg'),
(10, 'Folk art refers to traditional art forms created by self-taught or community-based artisans, often reflecting cultural heritage and local traditions. It encompasses a wide range of crafts, including painting, sculpture, textiles, pottery, and decorative objects, characterized by their vibrant colours, intricate patterns, and storytelling elements. Typically passed down through generations, folk art is deeply rooted in the daily lives, rituals, and beliefs of a community. It often serves both functional and aesthetic purposes, celebrating the shared identity and creativity of its people.', 1987, 'folk_art3.png'),
(11, 'Modern Indian style art is a vibrant fusion of traditional Indian aesthetics with contemporary themes and techniques. It draws inspiration from India\'s rich cultural heritage, including tribal art, folk traditions, and classical motifs, while integrating modern forms like abstract expressionism, minimalism, and digital art. Artists often explore themes of identity, social change, mythology, and globalization, using mediums ranging from canvas and sculpture to mixed media and installations. This style reflects the evolving Indian ethos, bridging the gap between ancient traditions and the global art landscape.', 2003, 'modern_img3.jpg'),
(12, 'Abstract art is a modern art form that moves away from realistic representation to focus on shapes, colours, forms, and textures. It emphasizes emotional expression, creativity, and imagination, often leaving interpretation open to the viewer. Originating in the early 20th century with artists like Wassily Kandinsky and Piet Mondrian, abstract art challenges traditional perspectives by depicting ideas, emotions, or concepts rather than concrete objects. This style encompasses a wide range of techniques, from geometric patterns to fluid, organic compositions, making it a versatile and thought-provoking artistic movement.', 2001, 'abstract_3.jpg'),
(13, 'Mandala art is a spiritual and intricate design form rooted in ancient Indian traditions, symbolizing the universe, balance, and harmony. Derived from the Sanskrit word \"mandala,\" meaning \"circle,\" it often features symmetrical patterns radiating from a central point. Mandalas are used for meditation, mindfulness, and spiritual growth, with their repetitive geometric shapes and vibrant colours evoking a sense of calm and focus. While traditionally created using natural elements like sand or pigments, modern mandala art spans diverse media, blending traditional motifs with contemporary interpretations.', 1990, 'mandala_art4.jpg'),
(14, 'Folk art refers to traditional art forms created by self-taught or community-based artisans, often reflecting cultural heritage and local traditions. It encompasses a wide range of crafts, including painting, sculpture, textiles, pottery, and decorative objects, characterized by their vibrant colours, intricate patterns, and storytelling elements. Typically passed down through generations, folk art is deeply rooted in the daily lives, rituals, and beliefs of a community. It often serves both functional and aesthetic purposes, celebrating the shared identity and creativity of its people.', 1992, 'folk_art4.jpg'),
(15, 'Modern Indian style art is a vibrant fusion of traditional Indian aesthetics with contemporary themes and techniques. It draws inspiration from India\'s rich cultural heritage, including tribal art, folk traditions, and classical motifs, while integrating modern forms like abstract expressionism, minimalism, and digital art. Artists often explore themes of identity, social change, mythology, and globalization, using mediums ranging from canvas and sculpture to mixed media and installations. This style reflects the evolving Indian ethos, bridging the gap between ancient traditions and the global art landscape.', 1987, 'modern_img4.jpg'),
(16, 'Abstract art is a modern art form that moves away from realistic representation to focus on shapes, colours, forms, and textures. It emphasizes emotional expression, creativity, and imagination, often leaving interpretation open to the viewer. Originating in the early 20th century with artists like Wassily Kandinsky and Piet Mondrian, abstract art challenges traditional perspectives by depicting ideas, emotions, or concepts rather than concrete objects. This style encompasses a wide range of techniques, from geometric patterns to fluid, organic compositions, making it a versatile and thought-provoking artistic movement.', 2002, 'abstract_4.jpg'),
(17, 'Mandala art is a spiritual and intricate design form rooted in ancient Indian traditions, symbolizing the universe, balance, and harmony. Derived from the Sanskrit word \"mandala,\" meaning \"circle,\" it often features symmetrical patterns radiating from a central point. Mandalas are used for meditation, mindfulness, and spiritual growth, with their repetitive geometric shapes and vibrant colours evoking a sense of calm and focus. While traditionally created using natural elements like sand or pigments, modern mandala art spans diverse media, blending traditional motifs with contemporary interpretations.', 2000, 'mandala_art5.jpg'),
(18, 'Folk art refers to traditional art forms created by self-taught or community-based artisans, often reflecting cultural heritage and local traditions. It encompasses a wide range of crafts, including painting, sculpture, textiles, pottery, and decorative objects, characterized by their vibrant colours, intricate patterns, and storytelling elements. Typically passed down through generations, folk art is deeply rooted in the daily lives, rituals, and beliefs of a community. It often serves both functional and aesthetic purposes, celebrating the shared identity and creativity of its people.', 1993, 'folk_art5.jpg'),
(19, 'Modern Indian style art is a vibrant fusion of traditional Indian aesthetics with contemporary themes and techniques. It draws inspiration from India\'s rich cultural heritage, including tribal art, folk traditions, and classical motifs, while integrating modern forms like abstract expressionism, minimalism, and digital art. Artists often explore themes of identity, social change, mythology, and globalization, using mediums ranging from canvas and sculpture to mixed media and installations. This style reflects the evolving Indian ethos, bridging the gap between ancient traditions and the global art landscape.', 1997, 'modern_img5.jpg'),
(20, 'Abstract art is a modern art form that moves away from realistic representation to focus on shapes, colours, forms, and textures. It emphasizes emotional expression, creativity, and imagination, often leaving interpretation open to the viewer. Originating in the early 20th century with artists like Wassily Kandinsky and Piet Mondrian, abstract art challenges traditional perspectives by depicting ideas, emotions, or concepts rather than concrete objects. This style encompasses a wide range of techniques, from geometric patterns to fluid, organic compositions, making it a versatile and thought-provoking artistic movement.', 2003, 'abstract_5.jpg'),
(21, 'Mandala art is a spiritual and intricate design form rooted in ancient Indian traditions, symbolizing the universe, balance, and harmony. Derived from the Sanskrit word \"mandala,\" meaning \"circle,\" it often features symmetrical patterns radiating from a central point. Mandalas are used for meditation, mindfulness, and spiritual growth, with their repetitive geometric shapes and vibrant colours evoking a sense of calm and focus. While traditionally created using natural elements like sand or pigments, modern mandala art spans diverse media, blending traditional motifs with contemporary interpretations.', 1989, 'mandala_art6.jpg'),
(22, 'Folk art refers to traditional art forms created by self-taught or community-based artisans, often reflecting cultural heritage and local traditions. It encompasses a wide range of crafts, including painting, sculpture, textiles, pottery, and decorative objects, characterized by their vibrant colours, intricate patterns, and storytelling elements. Typically passed down through generations, folk art is deeply rooted in the daily lives, rituals, and beliefs of a community. It often serves both functional and aesthetic purposes, celebrating the shared identity and creativity of its people.', 1995, 'folk_art6.jpg'),
(23, 'Abstract art is a modern art form that moves away from realistic representation to focus on shapes, colours, forms, and textures. It emphasizes emotional expression, creativity, and imagination, often leaving interpretation open to the viewer. Originating in the early 20th century with artists like Wassily Kandinsky and Piet Mondrian, abstract art challenges traditional perspectives by depicting ideas, emotions, or concepts rather than concrete objects. This style encompasses a wide range of techniques, from geometric patterns to fluid, organic compositions, making it a versatile and thought-provoking artistic movement.', 2015, 'abstract_6.jpg'),
(24, 'Modern Indian style art is a vibrant fusion of traditional Indian aesthetics with contemporary themes and techniques. It draws inspiration from India\'s rich cultural heritage, including tribal art, folk traditions, and classical motifs, while integrating modern forms like abstract expressionism, minimalism, and digital art. Artists often explore themes of identity, social change, mythology, and globalization, using mediums ranging from canvas and sculpture to mixed media and installations. This style reflects the evolving Indian ethos, bridging the gap between ancient traditions and the global art landscape.', 1999, 'modern_img6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `password`, `name`, `phone`, `address`) VALUES
(3, 'pavan', '$2y$10$akWqD.Xz80fAxlVYCFd.reNQ7HjRn.8WkUlLJG/Kf/bnT0hvEKdLq', 'Pavan Rao', '8762557980', 'Bangalore'),
(4, 'shaky', '$2y$10$JOzyXV4ybcblEzRg.fDUFulLvszaynrtQxIhRSJ/gWQB8jDXnevk2', 'Pavan Shekar', '9731675767', 'Bangalore'),
(5, 'cena', '$2y$10$DzWXleSxzSBPG6DQ7B50JOLEZadsODaM5Eut6kHeZly9Eh.fdlnBG', 'John Cena', '1001001001', 'Vegas'),
(6, 'steve', '$2y$10$X.hCCeH2.DjW0V6JSrHCReC.CNg25kI7UE0VFgHtI8tRF4tNk8PlK', 'Steve', '9119911911', 'Washington'),
(7, 'kushal', '$2y$10$l31zP4RMTAW.mtffe9TZvus54hNbtCG0Tt6R7de98P.DdARga82qm', 'Steve Buscemi', '9871236789', 'Bangalore'),
(8, 'nischal', '$2y$10$glEtpakkUbtoD13dTWwEuue4NlbsC0fdvOh88eUo9EeZRp9RUTpdm', 'Nischal', '9876754561', 'Bangalore'),
(9, 'katti', '$2y$10$nsVWGwMk2Tyfc1MObuCBCuLoBpsNVgu5RX5WrAY0A96Vp8hpazp5.', 'Anirudh', '9738436861', 'las vegas'),
(10, 'nikhil', '$2y$10$EnZw3U8YEU1bKzTlqMaYZ.3dtGJw2tEnaBxFr5MleEiX6pfOunFFa', 'nikhil', '8762656471', 'Here'),
(11, 'basketboss', '$2y$10$Afbfu9EM5MyL307W/k37ROlQ9KChIuPHESXjHLvGxD3xZ6MuBPBqS', 'Skund', '9877923221', 'Charlotte'),
(12, 'Tina', '$2y$10$2wcA8QdJn9VmJmNc6L5Xje3peWSuQPvOynAoi3wSqflCBiEkLwNYK', 'Tina', '9633814500', 'Pune'),
(14, 'Shravani', '$2y$10$84GKARMuSu8bi8ISR8z0JuFWpNlrgcO6377ecrYLxdbi0qtCuCtE.', 'Shravani', '7634166730', 'Ahmednagar'),
(16, 'Sakshi', '$2y$10$5yVHIaoL5SUeR5FAQkU0yuSQpdcmSouLjOgVwOVuQ2lQAKiuVb8xi', 'Sakshi', '5698236610', 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `art_id` int(11) NOT NULL,
  `count` int(11) DEFAULT 1,
  `purchase_amt` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `art_id`, `count`, `purchase_amt`) VALUES
(3, 1, 2, 2000),
(3, 4, 2, 14000),
(3, 5, 3, 13200),
(5, 1, 1, 1000),
(5, 3, 1, 9900),
(5, 4, 48, 336000),
(9, 1, 2, 2000),
(9, 2, 3, 3600),
(9, 4, 2, 14000),
(10, 1, 1, 100000),
(10, 2, 3, 360000),
(11, 3, 100, 99000000),
(12, 1, 2, 2000),
(12, 2, 2, 2400),
(12, 3, 2, 3490),
(12, 4, 1, 3000),
(12, 13, 1, 3000),
(14, 1, 1, 1000),
(14, 5, 1, 4400),
(16, 7, 1, 3000),
(16, 9, 1, 4059);

--
-- Triggers `purchases`
--
DELIMITER $$
CREATE TRIGGER `calc_amt_insert_trig` BEFORE INSERT ON `purchases` FOR EACH ROW BEGIN
DECLARE price1 INT DEFAULT 0;
SELECT
    art.art_price
INTO price1
FROM
    art
WHERE
    art.art_id = new.art_id;
set new.purchase_amt = new.count * price1;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calc_amt_update_trig` BEFORE UPDATE ON `purchases` FOR EACH ROW BEGIN
DECLARE price1 INT DEFAULT 0;
SELECT
    art.art_price
INTO price1
FROM
    art
WHERE
    art.art_id = new.art_id;
set new.purchase_amt = new.count * price1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(30) NOT NULL,
  `seller_phone` varchar(10) NOT NULL,
  `seller_address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `seller_name`, `seller_phone`, `seller_address`) VALUES
(1, 'Sakshi', '9980866966', 'RR Nagar'),
(2, 'Krishna', '9986490130', 'Girinagar'),
(3, 'Shivay', '8105940141', 'Hosakerehalli'),
(4, 'Anirudh', '9738436861', 'Jayanagar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `art`
--
ALTER TABLE `art`
  ADD PRIMARY KEY (`art_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `art_description`
--
ALTER TABLE `art_description`
  ADD UNIQUE KEY `art_id` (`art_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cust_phone` (`phone`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`,`art_id`) USING BTREE,
  ADD KEY `art_id` (`art_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `seller_phone` (`seller_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `art`
--
ALTER TABLE `art`
  MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `art`
--
ALTER TABLE `art`
  ADD CONSTRAINT `art_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`) ON UPDATE CASCADE;

--
-- Constraints for table `art_description`
--
ALTER TABLE `art_description`
  ADD CONSTRAINT `art_id` FOREIGN KEY (`art_id`) REFERENCES `art` (`art_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `art` (`art_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
