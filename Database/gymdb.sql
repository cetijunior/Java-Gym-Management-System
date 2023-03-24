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
('admin', '1234'),
('cj', 'cj');

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
(3, 'jTextField1', 'jTextField3', 'jTextField4', '2016-02-23', 'aaa');

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

INSERT INTO `morememberdetails` (`id`, `nic`, `email`, `gender`, `height`, `weight`, `bmi`, `remarks`, `lastUpdated`) VALUES
(1, 'jTextField2', 'dsdsdd','Male', 1.8, 90, 27, 'vdvvsvvdvsdvfvdvfdvfvfvfdvdvdvdvdvdvdvdfvvd', '2016-02-23'),
(2, 'aaa', 'aaa', 'Male', 22, 22, 0, 'sadsaddddsfdfffff', '2016-02-23'),
(3, 'jTextField2', '6ytttytyy', 'Male', 45, 55, 0, 'yyyyyytytyy', '2016-02-23');

-- ----------------------------------------------------------
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
