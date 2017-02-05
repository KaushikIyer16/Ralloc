-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2017 at 12:38 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ralloc`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `Department` (
  `Department_ID` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Intake` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departmentsubject`
--

CREATE TABLE `DepartmentSubject` (
  `Department_ID` int(11) DEFAULT NULL,
  `CourseCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dependency`
--

CREATE TABLE `Dependency` (
  `Dependency_ID` int(255) NOT NULL,
  `Room_offered` varchar(255) DEFAULT NULL,
  `Subject_Registered` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `Room` (
  `Room_ID` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Capacity` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roomdependency`
--

CREATE TABLE `RoomDependency` (
  `Dependency_ID` int(11) DEFAULT NULL,
  `Room_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `Student` (
  `USN` varchar(255) NOT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `Department_ID` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studentsubject`
--

CREATE TABLE `StudentSubject` (
  `USN` varchar(255) DEFAULT NULL,
  `CourseCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `Subject` (
  `CourseCode` varchar(255) NOT NULL,
  `InstitutionalElective` binary(255) DEFAULT NULL,
  `DepartmentElective` binary(255) DEFAULT NULL,
  `ClusterElective` binary(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjectdependency`
--

CREATE TABLE `SubjectDependency` (
  `Dependency_ID` int(11) DEFAULT NULL,
  `CourseCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `departmentsubject`
--
ALTER TABLE `DepartmentSubject`
  ADD KEY `Department_ID` (`Department_ID`),
  ADD KEY `CourseCode` (`CourseCode`);

--
-- Indexes for table `dependency`
--
ALTER TABLE `Dependency`
  ADD PRIMARY KEY (`Dependency_ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`Room_ID`);

--
-- Indexes for table `roomdependency`
--
ALTER TABLE `RoomDependency`
  ADD KEY `Dependency_ID` (`Dependency_ID`),
  ADD KEY `Room_ID` (`Room_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`USN`),
  ADD KEY `Department_ID` (`Department_ID`);

--
-- Indexes for table `studentsubject`
--
ALTER TABLE `StudentSubject`
  ADD KEY `USN` (`USN`),
  ADD KEY `CourseCode` (`CourseCode`);

--
-- Indexes for table `subject`
--
ALTER TABLE `Subject`
  ADD PRIMARY KEY (`CourseCode`);

--
-- Indexes for table `subjectdependency`
--
ALTER TABLE `SubjectDependency`
  ADD KEY `Dependency_ID` (`Dependency_ID`),
  ADD KEY `CourseCode` (`CourseCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departmentsubject`
--
ALTER TABLE `DepartmentSubject`
  ADD CONSTRAINT `departmentsubject_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`),
  ADD CONSTRAINT `departmentsubject_ibfk_2` FOREIGN KEY (`CourseCode`) REFERENCES `Subject` (`CourseCode`);

--
-- Constraints for table `roomdependency`
--
ALTER TABLE `RoomDependency`
  ADD CONSTRAINT `roomdependency_ibfk_1` FOREIGN KEY (`Dependency_ID`) REFERENCES `Dependency` (`Dependency_ID`),
  ADD CONSTRAINT `roomdependency_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `Room` (`Room_ID`);

--
-- Constraints for table `student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `Department` (`Department_ID`);

--
-- Constraints for table `studentsubject`
--
ALTER TABLE `StudentSubject`
  ADD CONSTRAINT `studentsubject_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `Student` (`USN`),
  ADD CONSTRAINT `studentsubject_ibfk_2` FOREIGN KEY (`CourseCode`) REFERENCES `Subject` (`CourseCode`);

--
-- Constraints for table `subjectdependency`
--
ALTER TABLE `SubjectDependency`
  ADD CONSTRAINT `subjectdependency_ibfk_1` FOREIGN KEY (`Dependency_ID`) REFERENCES `Dependency` (`Dependency_ID`),
  ADD CONSTRAINT `subjectdependency_ibfk_2` FOREIGN KEY (`CourseCode`) REFERENCES `Subject` (`CourseCode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
