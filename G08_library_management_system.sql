-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2022 at 01:00 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Book_ID` varchar(30) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Author` varchar(30) NOT NULL,
  `Category` varchar(30) NOT NULL,
  `Abstract` varchar(1000) NOT NULL,
  `Edition` int(11) NOT NULL,
  `Interpreter` varchar(30) DEFAULT NULL,
  `Series` varchar(30) DEFAULT NULL,
  `Price` int(11) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Book_cover` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `PID` varchar(30) NOT NULL,
  `Add_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Book_ID`, `ISBN`, `Title`, `Author`, `Category`, `Abstract`, `Edition`, `Interpreter`, `Series`, `Price`, `Status`, `Book_cover`, `Location`, `PID`, `Add_Date`) VALUES
('326159487', '9126981484101', 'Title B', 'Mister B', 'Classics', 'message B', 1, NULL, 'Series B', 399, 'Available', 'Image_Path2', 'หมวดหมู่อาหาร ชั้น1', '123123465456', '1995-01-01'),
('784951623', '9783161484100', 'Title A', 'Mister A', 'Action and Adventure', 'message A', 1, 'Person A', NULL, 500, 'Broken', 'Image_Path1', 'หมวดหมู่การเรียนรู้ ชั้น2', '123123465456', '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `M_ID` varchar(30) NOT NULL,
  `Book_no` varchar(30) NOT NULL,
  `Borrow_ID` varchar(30) NOT NULL,
  `Borrow_Date` date DEFAULT NULL,
  `Reserve_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`M_ID`, `Book_no`, `Borrow_ID`, `Borrow_Date`, `Reserve_Date`) VALUES
('453453453', '784951623', '147953268', '2022-10-18', NULL),
('453453453', '784951623', '569831742', NULL, '2022-10-17');

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE `charge` (
  `Essn` varchar(13) NOT NULL,
  `MID` varchar(30) NOT NULL,
  `Charge_date` date NOT NULL,
  `Pay_date` date DEFAULT NULL,
  `Charge_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charge`
--

INSERT INTO `charge` (`Essn`, `MID`, `Charge_date`, `Pay_date`, `Charge_id`) VALUES
('333445555', '453453453', '1972-08-05', '1972-08-07', '1122334455666'),
('123456789', '987987987', '1969-04-10', '1969-04-10', '2211335544777'),
('666884444', '666443333', '1983-10-28', '1983-10-28', '3333557711222'),
('987654321', '777554444', '1946-04-15', '1946-04-16', '6655442211444'),
('999887777', '888666555', '1937-11-21', '1937-11-30', '9955446611333');

-- --------------------------------------------------------

--
-- Table structure for table `charge_detail`
--

CREATE TABLE `charge_detail` (
  `Charge_type` varchar(10) NOT NULL,
  `BookID` varchar(30) NOT NULL,
  `Charge_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `charge_detail`
--

INSERT INTO `charge_detail` (`Charge_type`, `BookID`, `Charge_id`) VALUES
('Late', '784951623', '1122334455666'),
('Defective', '326159487', '1122334455666'),
('Disappear', '145278963', '1122334455666'),
('Disappear', '856974123', '2211335544777'),
('Disappear', '745812369', '9955446611333');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Dname` varchar(30) NOT NULL,
  `Salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Dname`, `Salary`) VALUES
('Administration', 43000),
('Archive & Collection Services', 25000),
('Cataloging', 38000),
('Circulation/Access Services', 40000),
('Public Relations', 30000);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Fname` varchar(30) NOT NULL,
  `Lname` varchar(30) NOT NULL,
  `Birth_date` date NOT NULL,
  `Tel_no` varchar(10) NOT NULL,
  `Sex` char(1) NOT NULL,
  `E_ssn` varchar(13) NOT NULL,
  `Department` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Fname`, `Lname`, `Birth_date`, `Tel_no`, `Sex`, `E_ssn`, `Department`) VALUES
('John', 'Smith', '1965-01-09', '0812223333', 'M', '123456789', 'Public Relations'),
('Franklin', 'Wong', '1955-12-08', '0823334444', 'M', '333445555', 'Public Relations'),
('Ramesh', 'Narayan', '1962-09-15', '0856667777', 'M', '666884444', 'Public Relations'),
('Jennifer', 'Wallace', '1941-06-20', '0845556666', 'F', '987654321', 'Archive & Collection Services'),
('Alica', 'Zelaya', '1968-01-19', '0834445555', 'F', '999887777', 'Archive & Collection Services');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Fname` varchar(30) NOT NULL,
  `Lname` varchar(30) NOT NULL,
  `Birth_date` date NOT NULL,
  `Tel_no` varchar(10) NOT NULL,
  `Type` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `UID` varchar(30) NOT NULL,
  `Sex` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Fname`, `Lname`, `Birth_date`, `Tel_no`, `Type`, `Email`, `Username`, `Password`, `UID`, `Sex`) VALUES
('John', 'H. Watson', '1976-10-24', '0809876543', 'half_year', 'DrWatson@email.uk', 'H_Watson', '2345678', '21342576', 'M'),
('Jocye', 'English', '1972-07-31', '0867778888', 'half_year', 'joyce_english@email.com', 'Joyce_E', '11111111', '453453453', 'M'),
('Theodore', 'Jabbar', '1983-10-25', '0801112222', 'half_year', 'theodore_jabbar@email.com', 'Theodore_J', '55555555', '666443333', 'M'),
('Alice', 'English', '1946-04-05', '0890001111', 'annual', 'alice_english@email.com', 'Alice_E', '44444444', '777554444', 'F'),
('James', 'Borg', '1937-11-10', '0889990000', 'half_year', 'james_borg@email.com', 'James_B', '33333333', '888666555', 'M'),
('Ahmad', 'Jabbar', '1969-03-29', '0878889999', 'annual', 'ahmad_jabbar@email.com', 'Ahmad_J', '22222222', '987987987', 'F');

-- --------------------------------------------------------

--
-- Table structure for table `mem_payhistory`
--

CREATE TABLE `mem_payhistory` (
  `UID` varchar(30) NOT NULL,
  `Payment_History` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mem_payhistory`
--

INSERT INTO `mem_payhistory` (`UID`, `Payment_History`) VALUES
('453453453', '1122334455666'),
('987987987', '2211335544777'),
('888666555', '9955446611333'),
('777554444', '6655442211444'),
('666443333', '3333557711222');

-- --------------------------------------------------------

--
-- Table structure for table `mem_prefer`
--

CREATE TABLE `mem_prefer` (
  `UID` varchar(30) NOT NULL,
  `Prefer_Category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mem_prefer`
--

INSERT INTO `mem_prefer` (`UID`, `Prefer_Category`) VALUES
('453453453', 'Action and Adventure'),
('453453453', 'Classics'),
('453453453', 'Fantas'),
('777554444', 'Historical Fiction'),
('666443333', 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `Contact` varchar(10) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(30) NOT NULL,
  `Publisher_id` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`Contact`, `Name`, `Location`, `Publisher_id`) VALUES
('0611112222', 'Alphabet Book', '12/1 Village a No.1 Angle Road', '123123465455'),
('0622223333', 'Speed Book', '37/5 Village b No.2 Satan Road', '123123465456'),
('0612224444', 'Good Book', '15/9 Village c No.3 Dendilion ', '987987654654'),
('0615553333', 'GetRead Book', '45/7 Village d No.4 Flower Roa', '987987654655'),
('0637779999', 'Book Company', '118/4 Village e  No.5 Sunset R', '987987654656');

-- --------------------------------------------------------

--
-- Table structure for table `return_`
--

CREATE TABLE `return_` (
  `Mno` varchar(30) NOT NULL,
  `Book_ID` varchar(30) NOT NULL,
  `Return_id` varchar(30) NOT NULL,
  `Return_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_ID`),
  ADD KEY `book_ibfk_1` (`PID`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`Borrow_ID`),
  ADD KEY `M_ID` (`M_ID`),
  ADD KEY `Book_no` (`Book_no`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`Charge_id`),
  ADD KEY `charge_ibfk_1` (`MID`),
  ADD KEY `Essn` (`Essn`);

--
-- Indexes for table `charge_detail`
--
ALTER TABLE `charge_detail`
  ADD KEY `charge_detail_ibfk_1` (`Charge_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dname`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`E_ssn`),
  ADD KEY `Department` (`Department`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`UID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- Indexes for table `mem_payhistory`
--
ALTER TABLE `mem_payhistory`
  ADD KEY `mem_payhistory_ibfk_1` (`UID`);

--
-- Indexes for table `mem_prefer`
--
ALTER TABLE `mem_prefer`
  ADD KEY `mem_prefer_ibfk_1` (`UID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`Publisher_id`);

--
-- Indexes for table `return_`
--
ALTER TABLE `return_`
  ADD PRIMARY KEY (`Return_id`),
  ADD KEY `return__ibfk_1` (`Mno`),
  ADD KEY `return__ibfk_2` (`Book_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `publisher` (`Publisher_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `member` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`Book_no`) REFERENCES `book` (`Book_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `charge`
--
ALTER TABLE `charge`
  ADD CONSTRAINT `charge_ibfk_1` FOREIGN KEY (`MID`) REFERENCES `member` (`UID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `charge_ibfk_2` FOREIGN KEY (`Essn`) REFERENCES `employee` (`E_ssn`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `charge_detail`
--
ALTER TABLE `charge_detail`
  ADD CONSTRAINT `charge_detail_ibfk_1` FOREIGN KEY (`Charge_id`) REFERENCES `charge` (`Charge_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Dname`) ON UPDATE CASCADE;

--
-- Constraints for table `mem_payhistory`
--
ALTER TABLE `mem_payhistory`
  ADD CONSTRAINT `mem_payhistory_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `member` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mem_prefer`
--
ALTER TABLE `mem_prefer`
  ADD CONSTRAINT `mem_prefer_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `member` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `return_`
--
ALTER TABLE `return_`
  ADD CONSTRAINT `return__ibfk_1` FOREIGN KEY (`Mno`) REFERENCES `member` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `return__ibfk_2` FOREIGN KEY (`Book_ID`) REFERENCES `book` (`Book_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
