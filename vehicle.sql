-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2021 at 04:47 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vehicle`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`owner_id`, `name`, `address`, `phone`, `email`, `user_id`) VALUES
(1, 'Vikas Pandey', 'Bangalore\r\nKoramangala\r\n560034', '986234876', 'vikas@gmail.com', 1),
(2, 'Pravin Dubey', 'Yelahanka\r\nBanglore\r\n560070', '986234868', 'pravindubey@gmail.com', 2),
(3, 'Manish Paul', 'Banashankri\r\nBangalore\r\n560070', '986234845', 'manish@gmail.com', 3),
(4, 'Aakash Gupta', 'Church Street\r\nBanglore\r\n560001', '986234812', 'aakash@gmail.com', 4),
(5, 'Chirag Purohit', 'Koramangala\r\nBangalore\r\n560034', '9862347545', 'chirag@gamil.com', 5),
(6, 'Dhavin U', 'JP Nagar\r\nBangalore\r\n560078', '9756446345', 'dhavin@gmail.com', 8),
(7, 'Kanan Gill', 'Bandra\r\nMumbai\r\n400050', '7863452896', 'kanan@gmail.com', 9),
(8, 'Mihir Mohan', '\r\nGujarat\r\n380006', '8963456375', 'mihir@gmail.com', 10),
(9, 'Sachin Athani', 'Yelahanka\r\nBangalore\r\n560064', '8763453698', 'sachin@gmail.com', 11),
(10, 'Arnab Gosh', 'Adarsh Nagar\r\nAmritsar\r\n143502', '7863453694', 'arnab@gmail.com', 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Vikas Pandey', 'vikas@gmail.com', '1234'),
(2, 'Vikas Pandey', 'vikas@gmail.com', '1234'),
(3, 'Manish Paul', 'manish@gmail.com', '1234'),
(4, 'Aakash Gupta', 'aakash@gmail.com', '1234'),
(5, 'Chirag Purohit', 'chirag@gmail.com', '1234'),
(7, 'Thor', 'thor@gmail.com', '1234'),
(8, 'Dhavin U', 'dhavin@gmail.com', '1234'),
(9, 'Kanan Gill', 'kanan@gmail.com', '1234'),
(10, 'Mihir Mohan', 'mihir@gmail.com', '1234'),
(11, 'Sachin Athani', 'sachin@gmail.com', '1234'),
(12, 'Arnab Gosh', 'arnab@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `v_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `model` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `reg_date` date NOT NULL,
  `image` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `area` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `fuel_type` varchar(10) NOT NULL,
  `gear` varchar(10) NOT NULL,
  `avail` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`v_id`, `type`, `model`, `color`, `reg_date`, `image`, `price`, `area`, `city`, `state`, `zip`, `owner_id`, `fuel_type`, `gear`, `avail`, `user_id`) VALUES
(1, 4, 'Maruti Baleno Delta 1.2', 'Red', '2017-08-12', 'https://images10.gaadicdn.com/usedcar_image/gallery/used_car_2285897_1625039848.jpg', 645000, 'Koramangala', 'Bangalore', 'Karnataka', '560034', 1, 'Petrol', 'Manual', 'true', 1),
(2, 2, 'Royal Enfield Thunderbird 500 ', 'Blue', '2016-04-14', 'https://bd.gaadicdn.com/upload/usedbikesimages/2020/08/5f4c982d8ab39.jpeg', 130000, 'Yelahanka', 'Bangalore', 'Karnataka', '560064', 2, 'Petrol', 'Manual', 'true', 2),
(3, 4, 'Mercedes-Benz GLE Class 250d', 'White', '2018-04-12', 'https://images10.gaadicdn.com/usedcar_image/gallery/used_car_2249241_1618829938.jpg', 5495000, 'Banashankari', 'Bangalore', 'Karnataka', '560070', 3, 'Diesel', 'Automatic', 'true', 3),
(4, 2, 'Yamaha FZ25', 'Black', '2018-04-17', 'https://bd.gaadicdn.com/upload/usedbikesimages/2020/08/5f4a429fdee60.jpg', 100000, 'Church Street', 'Bangalore', 'Karnataka', '560001', 4, 'Petrol', 'Manual', 'true', 4),
(6, 4, 'Lexus NX 300h', 'Orange', '2018-06-05', 'https://images10.gaadicdn.com/usedcar_image/gallery/usedcar_whatsappimage2020_11_07at13_220741604748581_1604748592.jpeg', 6395000, 'Koramangala', 'Bangalore', 'Karnataka', '560034', 5, 'Petrol', 'Automatic', 'true', 5),
(7, 4, 'Audi Q8', 'Orange', '2019-11-14', 'https://stimg.cardekho.com/images/carexteriorimages/630x420/Audi/Q8/135/1581404410220/front-left-side-47.jpg?tr=w-456', 9898000, 'JP Nagar', 'Bangalore', 'Karnataka', '560078', 6, 'Petrol', 'Automatic', 'true', 8),
(8, 4, 'Volvo S90 D4 Inscription BSIV', 'White', '2019-10-15', 'https://images10.gaadicdn.com/usedcar_image/gallery/usedcar_c73e9d3d_9fc1_4529_afc4_c9d353adcd5d_319321623090468_1623090643.jpeg', 4450000, 'Bandra', 'Mumbai', 'Maharashtra', '400050', 7, 'Diesel', 'Automatic', 'true', 9),
(9, 4, 'Toyota Innova Crysta 2016-2020 2.4 VX MT', 'Silver', '2017-05-17', 'https://images10.gaadicdn.com/usedcar_image/gallery/used_car_2287547_1625217693.jpg', 1523000, 'Kathwada', 'Ahmedabad', 'Gujarat', '380006', 8, 'Diesel', 'Manual', 'true', 10),
(10, 2, 'KTM 125 Duke BS6', 'Black', '2019-02-05', 'https://bd.gaadicdn.com/upload/usedbikesimages/2020/08/5f478cb5e57b1.jpg', 140000, 'Yelahanka', 'Bangalore', 'Karnataka', '560064', 9, 'Petrol', 'Manual', 'true', 11),
(11, 2, 'Royal Enfield Classic 350 Signals', 'Sky Blue', '2019-10-24', 'https://bd.gaadicdn.com/upload/usedbikesimages/2020/08/5f460dda06c4f.jpg', 164000, 'Adarsh Nagar', 'Amritsar', 'Punjab', '143502', 10, 'Petrol', 'Manual', 'true', 12);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`v_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`v_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
