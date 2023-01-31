SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `gymdb`


-- Table structure for table `login`

CREATE TABLE `login` (
  `name` varchar(30) NOT NULL,
  `pword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Kredencialet per akses admin
--

INSERT INTO `login` (`name`, `pword`) VALUES
('aaa', 'aaa'),
('admin', '1234');

-- --------------------------------------------------------

-- Table structure for table `memberdetails`


CREATE TABLE `memberdetails` (
  `id` int(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `registered_on` date DEFAULT NULL,
  `registered_by` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Te dhena shembull per tabelen 

INSERT INTO `memberdetails` (`id`, `name`, `contact_number`, `address`, `registered_on`, `registered_by`) VALUES
(1, 'asff', 'dssdsd', 'dsdsds', '2016-02-22', 'aaa'),
(2, 'jTextField1', 'jTextField3', 'jTextField4', '2016-02-23', 'aaa'),
(3, 'jTextField1', 'jTextField3', 'jTextField4', '2016-02-23', 'aaa'),
(4, 'jTextField1', 'jTextField3', 'jTextField4', '2016-02-23', 'aaa'),
(6, 'aaa', 'aaa', 'aaa', '2016-02-23', 'aaa'),
(7, 'qqq', 'jTextField3', 'jTextField4', '2016-02-23', 'aaa'),
(8, 'jTextField1', 'jTextField3', 'jTextField4', '2016-02-23', NULL),
(9, 'jTextField1', 'jTextField3', 'jTextField4', '2016-02-23', 'aaa'),
(12, 'Dilan Nilaksha', '23525252', 'asasdd af fasfadfaf', '2016-02-24', 'admin');

-- --------------------------------------------------------

-- Table structure for table `morememberdetails`

CREATE TABLE `morememberdetails` (
  `id` int(20) NOT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `height` double NOT NULL,
  `weight` double NOT NULL,
  `bmi` int(11) NOT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  `lastUpdated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- te dhena shembull
--

INSERT INTO `morememberdetails` (`id`, `nic`, `email`, `emcontact`, `gender`, `height`, `weight`, `bmi`, `remarks`, `lastUpdated`, `membership_cat`, `recipt_no`, `payment_plan`) VALUES
(3, 'jTextField2', 'dsdsdd', 'jTextField1', 'Male', 1.8, 90, 27, 'vdvvsvvdvsdvfvdvfdvfvfvfdvdvdvdvdvdvdvdfvvd', '2016-02-23', NULL, NULL, NULL),
(4, 'jTextField2', 'adadasd', 'jTextField1', 'Male', 2, 222, 55, '', '2016-02-23', NULL, NULL, NULL),
(5, 'jTextField2', 'sdd', 'jTextField1', 'Male', 2, 42, 10, '', '2016-02-23', NULL, NULL, NULL),
(6, 'aaa', 'aaa', 'aaa', 'Male', 22, 22, 0, 'sadsaddddsfdfffff', '2016-02-23', 'Main workout area', 'dfsfdfsdfsdf', '6 months'),
(7, 'jTextField2', '6ytttytyy', 'jTextField1', 'Male', 45, 55, 0, 'yyyyyytytyy', '2016-02-23', 'Main workout area', 'ddddd', '6 months'),
(8, 'jTextField2', 'frfrf', 'jTextField1', 'Male', 22, 22, 0, '', '2016-02-23', 'Main workout area', 'gbg', '6 months'),
(9, 'jTextField2', 'dfdddf', 'jTextField1', 'Male', 22, 27, 0, '', '2016-02-23', 'Main workout area', '222', '6 months'),
(10, '141444344v', '43432424', '343242424', 'Male', 43, 343, 0, 'aaaaaaaaaaaaaaaaaaaaaaa', '2016-02-24', 'Main workout area', '227227', '6 months'),
(11, '235235223v', 'sdfsddf@gdg', '455646546', 'Male', 1.75, 70, 22, 'wdff fe aafa fe ff  eeq eew adfedfweef wewewewe', '2016-02-24', 'Main workout area', '25254225', '6 months'),
(12, '3442343v', 'sdfsf@com', '01112324244', 'Male', 1.79, 55, 17, 'genius', '2016-02-24', 'Main workout area', 'adfasfaf', '6 months');

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `memberdetails`
--
ALTER TABLE `memberdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `added_by` (`registered_by`);

--
-- Indexes for table `morememberdetails`
--
ALTER TABLE `morememberdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `nic` (`nic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `memberdetails, ketu mund te beni reset numrin ku fillon numerimi i ID-se`
--
ALTER TABLE `memberdetails`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
