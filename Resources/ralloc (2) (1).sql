-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2017 at 01:01 PM
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
  `DepartmentID` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Intake` int(255) DEFAULT NULL,
  `ClusterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `Department` (`DepartmentID`, `Name`, `Intake`, `ClusterID`) VALUES
(1, 'ISE', 90, 1),
(2, 'ECE', 90, 2),
(3, 'TCE', 90, 2),
(4, 'ME', 200, 3),
(5, 'CSE', 180, 1),
(6, 'EEE', 120, 4);

-- --------------------------------------------------------

--
-- Table structure for table `departmentsubject`
--

CREATE TABLE `DepartmentSubject` (
  `DepartmentID` int(11) DEFAULT NULL,
  `CourseCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departmentsubject`
--

INSERT INTO `DepartmentSubject` (`DepartmentID`, `CourseCode`) VALUES
(1, '16IS5DCDBM'),
(1, '16IS5DCDCN'),
(1, '16IS5DCJAV'),
(1, '16IS5DCWEP'),
(1, '16IS5DEAIN'),
(1, '16IS5DEDMG'),
(2, '16EC5DCCSM'),
(2, '16EC5DCCT1'),
(2, '16EC5DCDSP'),
(2, '16EC5DCFOV'),
(2, '16EC5DCMWE'),
(2, '16EC5DE1CA'),
(2, '16EC5DE1IP'),
(2, '16EC5DE1OP'),
(3, '16TE5DCACM'),
(3, '16TE5DCCN1'),
(3, '16TE5DCDTS'),
(3, '16TE5DCLCS'),
(3, '16TE5DCVLI'),
(3, '16TE5DE1OS'),
(4, '16ME5DCCMD'),
(4, '16ME5DCDM2'),
(4, '16ME5DCDOM'),
(4, '16ME5DCFHT'),
(4, '16ME5DCMAE'),
(4, '16ME5DEICE'),
(4, '16ME5DENTM'),
(4, '16ME5DETOE'),
(4, '16ME5DE1FD'),
(1, '15CI3GCPCP'),
(1, '15IS3DCCOE'),
(1, '15IS3DCDSC'),
(1, '15IS3DCTFC'),
(1, '15MA3CCDMS'),
(5, '15MA3CCDMS'),
(5, '15CS3DCDST'),
(5, '15CI3GCPCP'),
(5, '15CS3DCWEP'),
(5, '15CS3DCCOA'),
(4, '15MA3GCMAT'),
(4, '15ME3DCMSM'),
(4, '15ME3DCSOM'),
(4, '15ME3DCFWT'),
(4, '15ME3DCFME'),
(2, '15MA3GCAEM'),
(2, '15ES3GCLCA'),
(2, '15ES3GCDEC'),
(2, '15ES3GCFAW'),
(2, '15EC3DLSL1'),
(6, '15EE3DCSL1'),
(6, '15MA3GCAEM'),
(6, '15ES3GCLCA'),
(6, '15ES3GCDEC'),
(6, '15EE3DCFTH'),
(6, '15ES3GCAME'),
(2, '15ES3GCAME'),
(4, '15ME3DCBTD'),
(4, '15AM1DCABC'),
(1, '15IS5DCDAE');

-- --------------------------------------------------------

--
-- Table structure for table `dependency`
--

CREATE TABLE `Dependency` (
  `DependencyID` int(255) NOT NULL,
  `CourseCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependency`
--

INSERT INTO `Dependency` (`DependencyID`, `CourseCode`) VALUES
(3, '16ME5DCCMD'),
(4, '16ME5DCCMD'),
(1, '16ME5DCDM2'),
(2, '16ME5DCDM2');

-- --------------------------------------------------------

--
-- Table structure for table `dependencyroom`
--

CREATE TABLE `DependencyRoom` (
  `DependencyID` int(255) DEFAULT NULL,
  `RoomID` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependencyroom`
--

INSERT INTO `DependencyRoom` (`DependencyID`, `RoomID`) VALUES
(1, 8),
(2, 9),
(3, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `Room` (
  `RoomID` int(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Capacity` int(255) DEFAULT NULL,
  `Dependency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `Room` (`RoomID`, `Name`, `Capacity`, `Dependency`) VALUES
(1, 'C101', 40, 0),
(2, 'C102', 40, 0),
(3, 'C103', 40, 0),
(4, 'C104', 40, 0),
(5, 'C201', 40, 0),
(6, 'C202', 40, 0),
(7, 'C203', 40, 0),
(8, 'ML1', 100, 1),
(9, 'ML2', 100, 1),
(10, 'ST1', 40, 1),
(11, 'ST2', 40, 1),
(12, 'ST-3', 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `Student` (
  `USN` varchar(255) NOT NULL,
  `DepartmentID` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `Student` (`USN`, `DepartmentID`) VALUES
('1BM10IS063', 1),
('1BM11IS055', 1),
('1BM12IS059', 1),
('1BM12IS097', 1),
('1BM12IS099', 1),
('1BM13IS041', 1),
('1BM13IS056', 1),
('1BM13IS077', 1),
('1BM13IS093', 1),
('1BM13IS101', 1),
('1BM14IS001', 1),
('1BM14IS002', 1),
('1BM14IS003', 1),
('1BM14IS004', 1),
('1BM14IS005', 1),
('1BM14IS006', 1),
('1BM14IS008', 1),
('1BM14IS009', 1),
('1BM14IS010', 1),
('1BM14IS011', 1),
('1BM14IS012', 1),
('1BM14IS013', 1),
('1BM14IS014', 1),
('1BM14IS015', 1),
('1BM14IS016', 1),
('1BM14IS018', 1),
('1BM14IS019', 1),
('1BM14IS020', 1),
('1BM14IS021', 1),
('1BM14IS022', 1),
('1BM14IS023', 1),
('1BM14IS024', 1),
('1BM14IS025', 1),
('1BM14IS026', 1),
('1BM14IS028', 1),
('1BM14IS029', 1),
('1BM14IS030', 1),
('1BM14IS031', 1),
('1BM14IS032', 1),
('1BM14IS034', 1),
('1BM14IS035', 1),
('1BM14IS037', 1),
('1BM14IS038', 1),
('1BM14IS039', 1),
('1BM14IS040', 1),
('1BM14IS041', 1),
('1BM14IS042', 1),
('1BM14IS043', 1),
('1BM14IS044', 1),
('1BM14IS045', 1),
('1BM14IS046', 1),
('1BM14IS047', 1),
('1BM14IS048', 1),
('1BM14IS049', 1),
('1BM14IS050', 1),
('1BM14IS051', 1),
('1BM14IS052', 1),
('1BM14IS054', 1),
('1BM14IS055', 1),
('1BM14IS056', 1),
('1BM14IS057', 1),
('1BM14IS058', 1),
('1BM14IS059', 1),
('1BM14IS060', 1),
('1BM14IS061', 1),
('1BM14IS062', 1),
('1BM14IS063', 1),
('1BM14IS064', 1),
('1BM14IS065', 1),
('1BM14IS067', 1),
('1BM14IS068', 1),
('1BM14IS069', 1),
('1BM14IS070', 1),
('1BM14IS071', 1),
('1BM14IS072', 1),
('1BM14IS073', 1),
('1BM14IS074', 1),
('1BM14IS076', 1),
('1BM14IS078', 1),
('1BM14IS079', 1),
('1BM14IS080', 1),
('1BM14IS081', 1),
('1BM14IS082', 1),
('1BM14IS083', 1),
('1BM14IS084', 1),
('1BM14IS085', 1),
('1BM14IS086', 1),
('1BM14IS087', 1),
('1BM14IS088', 1),
('1BM14IS089', 1),
('1BM14IS090', 1),
('1BM14IS091', 1),
('1BM14IS092', 1),
('1BM14IS093', 1),
('1BM14IS094', 1),
('1BM14IS095', 1),
('1BM14IS096', 1),
('1BM14IS097', 1),
('1BM14IS098', 1),
('1BM14IS099', 1),
('1BM14IS100', 1),
('1BM14IS101', 1),
('1BM14IS102', 1),
('1BM14IS103', 1),
('1BM14IS104', 1),
('1BM14IS106', 1),
('1BM14IS415', 1),
('1BM15IS400', 1),
('1BM15IS401', 1),
('1BM15IS402', 1),
('1BM15IS403', 1),
('1BM15IS405', 1),
('1BM15IS406', 1),
('1BM15IS407', 1),
('1BM15IS408', 1),
('1BM15IS409', 1),
('1BM15IS410', 1),
('1BM15IS411', 1),
('1BM15IS413', 1),
('1BM15IS414', 1),
('1BM15IS415', 1),
('1BM15IS416', 1),
('1BM15IS417', 1),
('1BM12EC004', 2),
('1BM13EC009', 2),
('1BM13EC010', 2),
('1BM13EC082', 2),
('1BM13EC116', 2),
('1BM14EC001', 2),
('1BM14EC002', 2),
('1BM14EC003', 2),
('1BM14EC005', 2),
('1BM14EC006', 2),
('1BM14EC007', 2),
('1BM14EC008', 2),
('1BM14EC009', 2),
('1BM14EC010', 2),
('1BM14EC011', 2),
('1BM14EC012', 2),
('1BM14EC013', 2),
('1BM14EC014', 2),
('1BM14EC015', 2),
('1BM14EC016', 2),
('1BM14EC017', 2),
('1BM14EC018', 2),
('1BM14EC019', 2),
('1BM14EC020', 2),
('1BM14EC021', 2),
('1BM14EC022', 2),
('1BM14EC024', 2),
('1BM14EC025', 2),
('1BM14EC026', 2),
('1BM14EC027', 2),
('1BM14EC028', 2),
('1BM14EC029', 2),
('1BM14EC030', 2),
('1BM14EC031', 2),
('1BM14EC032', 2),
('1BM14EC033', 2),
('1BM14EC034', 2),
('1BM14EC035', 2),
('1BM14EC036', 2),
('1BM14EC037', 2),
('1BM14EC038', 2),
('1BM14EC039', 2),
('1BM14EC040', 2),
('1BM14EC041', 2),
('1BM14EC042', 2),
('1BM14EC043', 2),
('1BM14EC044', 2),
('1BM14EC045', 2),
('1BM14EC046', 2),
('1BM14EC047', 2),
('1BM14EC048', 2),
('1BM14EC049', 2),
('1BM14EC050', 2),
('1BM14EC051', 2),
('1BM14EC052', 2),
('1BM14EC053', 2),
('1BM14EC054', 2),
('1BM14EC055', 2),
('1BM14EC056', 2),
('1BM14EC057', 2),
('1BM14EC058', 2),
('1BM14EC060', 2),
('1BM14EC061', 2),
('1BM14EC062', 2),
('1BM14EC063', 2),
('1BM14EC064', 2),
('1BM14EC065', 2),
('1BM14EC066', 2),
('1BM14EC067', 2),
('1BM14EC068', 2),
('1BM14EC069', 2),
('1BM14EC070', 2),
('1BM14EC071', 2),
('1BM14EC072', 2),
('1BM14EC073', 2),
('1BM14EC074', 2),
('1BM14EC075', 2),
('1BM14EC076', 2),
('1BM14EC077', 2),
('1BM14EC078', 2),
('1BM14EC080', 2),
('1BM14EC081', 2),
('1BM14EC082', 2),
('1BM14EC083', 2),
('1BM14EC084', 2),
('1BM14EC085', 2),
('1BM14EC086', 2),
('1BM14EC087', 2),
('1BM14EC088', 2),
('1BM14EC089', 2),
('1BM14EC090', 2),
('1BM14EC091', 2),
('1BM14EC092', 2),
('1BM14EC093', 2),
('1BM14EC094', 2),
('1BM14EC095', 2),
('1BM14EC096', 2),
('1BM14EC097', 2),
('1BM14EC098', 2),
('1BM14EC099', 2),
('1BM14EC100', 2),
('1BM14EC101', 2),
('1BM14EC102', 2),
('1BM14EC103', 2),
('1BM14EC104', 2),
('1BM14EC105', 2),
('1BM14EC106', 2),
('1BM14EC107', 2),
('1BM14EC108', 2),
('1BM14EC109', 2),
('1BM14EC110', 2),
('1BM14EC111', 2),
('1BM14EC112', 2),
('1BM14EC113', 2),
('1BM14EC114', 2),
('1BM14EC115', 2),
('1BM14EC116', 2),
('1BM14EC117', 2),
('1BM14EC118', 2),
('1BM14EC119', 2),
('1BM14EC120', 2),
('1BM14EC121', 2),
('1BM14EC122', 2),
('1BM14EC123', 2),
('1BM14EC124', 2),
('1BM14EC125', 2),
('1BM14EC126', 2),
('1BM14EC127', 2),
('1BM14EC128', 2),
('1BM14EC129', 2),
('1BM14EC130', 2),
('1BM14EC131', 2),
('1BM14EC132', 2),
('1BM14EC133', 2),
('1BM14EC134', 2),
('1BM14EC135', 2),
('1BM14EC136', 2),
('1BM14EC137', 2),
('1BM14EC138', 2),
('1BM14EC139', 2),
('1BM14EC140', 2),
('1BM14EC141', 2),
('1BM14EC142', 2),
('1BM14EC143', 2),
('1BM14EC145', 2),
('1BM12ME006', 4),
('1BM12ME044', 4),
('1BM12ME062', 4),
('1BM12ME064', 4),
('1BM12ME068', 4),
('1BM12ME121', 4),
('1BM12ME151', 4),
('1BM13ME001', 4),
('1BM13ME003', 4),
('1BM13ME004', 4),
('1BM13ME005', 4),
('1BM13ME006', 4),
('1BM13ME007', 4),
('1BM13ME008', 4),
('1BM13ME009', 4),
('1BM13ME010', 4),
('1BM13ME011', 4),
('1BM13ME012', 4),
('1BM13ME013', 4),
('1BM13ME014', 4),
('1BM13ME015', 4),
('1BM13ME016', 4),
('1BM13ME017', 4),
('1BM13ME018', 4),
('1BM13ME021', 4),
('1BM13ME022', 4),
('1BM13ME023', 4),
('1BM13ME024', 4),
('1BM13ME025', 4),
('1BM13ME026', 4),
('1BM13ME027', 4),
('1BM13ME028', 4),
('1BM13ME030', 4),
('1BM13ME031', 4),
('1BM13ME032', 4),
('1BM13ME033', 4),
('1BM13ME034', 4),
('1BM13ME035', 4),
('1BM13ME036', 4),
('1BM13ME037', 4),
('1BM13ME038', 4),
('1BM13ME039', 4),
('1BM13ME041', 4),
('1BM13ME042', 4),
('1BM13ME044', 4),
('1BM13ME045', 4),
('1BM13ME046', 4),
('1BM13ME047', 4),
('1BM13ME048', 4),
('1BM13ME049', 4),
('1BM13ME050', 4),
('1BM13ME051', 4),
('1BM13ME053', 4),
('1BM13ME054', 4),
('1BM13ME055', 4),
('1BM13ME056', 4),
('1BM13ME057', 4),
('1BM13ME058', 4),
('1BM13ME059', 4),
('1BM13ME060', 4),
('1BM13ME062', 4),
('1BM13ME063', 4),
('1BM13ME064', 4),
('1BM13ME065', 4),
('1BM13ME066', 4),
('1BM13ME067', 4),
('1BM13ME068', 4),
('1BM13ME069', 4),
('1BM13ME070', 4),
('1BM13ME071', 4),
('1BM13ME073', 4),
('1BM13ME074', 4),
('1BM13ME075', 4),
('1BM13ME076', 4),
('1BM13ME077', 4),
('1BM13ME078', 4),
('1BM13ME079', 4),
('1BM13ME080', 4),
('1BM13ME081', 4),
('1BM13ME082', 4),
('1BM13ME083', 4),
('1BM13ME084', 4),
('1BM13ME085', 4),
('1BM13ME086', 4),
('1BM13ME087', 4),
('1BM13ME088', 4),
('1BM13ME091', 4),
('1BM13ME092', 4),
('1BM13ME093', 4),
('1BM13ME094', 4),
('1BM13ME095', 4),
('1BM13ME096', 4),
('1BM13ME097', 4),
('1BM13ME098', 4),
('1BM13ME099', 4),
('1BM13ME100', 4),
('1BM13ME101', 4),
('1BM13ME102', 4),
('1BM13ME103', 4),
('1BM13ME104', 4),
('1BM13ME106', 4),
('1BM13ME107', 4),
('1BM13ME108', 4),
('1BM13ME109', 4),
('1BM13ME110', 4),
('1BM13ME111', 4),
('1BM13ME112', 4),
('1BM13ME115', 4),
('1BM13ME116', 4),
('1BM13ME117', 4),
('1BM13ME118', 4),
('1BM13ME119', 4),
('1BM13ME120', 4),
('1BM13ME121', 4),
('1BM13ME122', 4),
('1BM13ME123', 4),
('1BM13ME124', 4),
('1BM13ME125', 4),
('1BM13ME126', 4),
('1BM13ME127', 4),
('1BM13ME128', 4),
('1BM13ME129', 4),
('1BM13ME130', 4),
('1BM13ME133', 4),
('1BM13ME137', 4),
('1BM13ME139', 4),
('1BM13ME141', 4),
('1BM13ME142', 4),
('1BM13ME143', 4),
('1BM13ME146', 4),
('1BM13ME151', 4),
('1BM13ME152', 4),
('1BM13ME405', 4),
('1BM14ME400', 4),
('1BM14ME401', 4),
('1BM14ME402', 4),
('1BM14ME403', 4),
('1BM14ME404', 4),
('1BM14ME405', 4),
('1BM14ME406', 4),
('1BM14ME407', 4),
('1BM14ME408', 4),
('1BM14ME409', 4),
('1BM14ME410', 4),
('1BM14ME411', 4),
('1BM14ME412', 4),
('1BM14ME413', 4),
('1BM14ME414', 4),
('1BM14ME415', 4),
('1BM14ME416', 4),
('1BM14ME417', 4),
('1BM14ME418', 4),
('1BM14ME420', 4),
('1BM14ME421', 4),
('1BM14ME422', 4),
('1BM12CS100', 5),
('1BM12CS405', 5),
('1BM13CS005', 5),
('1BM13CS011', 5),
('1BM13CS025', 5),
('1BM13CS044', 5),
('1BM13CS050', 5),
('1BM13CS060', 5),
('1BM13CS065', 5),
('1BM13CS096', 5),
('1BM13CS099', 5),
('1BM13CS115', 5),
('1BM13CS116', 5),
('1BM13CS125', 5),
('1BM13CS130', 5),
('1BM13CS135', 5),
('1BM13CS143', 5),
('1BM13CS419', 5),
('1BM14CS001', 5),
('1BM14CS002', 5),
('1BM14CS003', 5),
('1BM14CS004', 5),
('1BM14CS005', 5),
('1BM14CS006', 5),
('1BM14CS007', 5),
('1BM14CS009', 5),
('1BM14CS010', 5),
('1BM14CS012', 5),
('1BM14CS013', 5),
('1BM14CS014', 5),
('1BM14CS015', 5),
('1BM14CS016', 5),
('1BM14CS017', 5),
('1BM14CS018', 5),
('1BM14CS019', 5),
('1BM14CS020', 5),
('1BM14CS021', 5),
('1BM14CS022', 5),
('1BM14CS023', 5),
('1BM14CS024', 5),
('1BM14CS025', 5),
('1BM14CS026', 5),
('1BM14CS028', 5),
('1BM14CS029', 5),
('1BM14CS030', 5),
('1BM14CS031', 5),
('1BM14CS032', 5),
('1BM14CS033', 5),
('1BM14CS034', 5),
('1BM14CS035', 5),
('1BM14CS036', 5),
('1BM14CS037', 5),
('1BM14CS038', 5),
('1BM14CS039', 5),
('1BM14CS041', 5),
('1BM14CS042', 5),
('1BM14CS043', 5),
('1BM14CS044', 5),
('1BM14CS045', 5),
('1BM14CS046', 5),
('1BM14CS047', 5),
('1BM14CS048', 5),
('1BM14CS050', 5),
('1BM14CS051', 5),
('1BM14CS053', 5),
('1BM14CS054', 5),
('1BM14CS057', 5),
('1BM14CS058', 5),
('1BM14CS059', 5),
('1BM14CS060', 5),
('1BM14CS061', 5),
('1BM14CS062', 5),
('1BM14CS063', 5),
('1BM14CS064', 5),
('1BM14CS065', 5),
('1BM14CS066', 5),
('1BM14CS067', 5),
('1BM14CS068', 5),
('1BM14CS069', 5),
('1BM14CS070', 5),
('1BM14CS071', 5),
('1BM14CS073', 5),
('1BM14CS075', 5),
('1BM14CS076', 5),
('1BM14CS077', 5),
('1BM14CS078', 5),
('1BM14CS079', 5),
('1BM14CS080', 5),
('1BM14CS081', 5),
('1BM14CS082', 5),
('1BM14CS083', 5),
('1BM14CS084', 5),
('1BM14CS085', 5),
('1BM14CS086', 5),
('1BM14CS087', 5),
('1BM14CS089', 5),
('1BM14CS090', 5),
('1BM14CS091', 5),
('1BM14CS092', 5),
('1BM14CS093', 5),
('1BM14CS094', 5),
('1BM14CS095', 5),
('1BM14CS096', 5),
('1BM14CS097', 5),
('1BM14CS099', 5),
('1BM14CS100', 5),
('1BM14CS101', 5),
('1BM14CS102', 5),
('1BM14CS103', 5),
('1BM14CS104', 5),
('1BM14CS105', 5),
('1BM14CS106', 5),
('1BM14CS108', 5),
('1BM14CS110', 5),
('1BM14CS111', 5),
('1BM14CS112', 5),
('1BM14CS113', 5),
('1BM14CS114', 5),
('1BM14CS115', 5),
('1BM14CS116', 5),
('1BM14CS118', 5),
('1BM14CS121', 5),
('1BM14CS122', 5),
('1BM14CS123', 5),
('1BM14CS126', 5),
('1BM14CS127', 5),
('1BM14CS128', 5),
('1BM14CS130', 5),
('1BM14CS131', 5),
('1BM14CS132', 5),
('1BM14CS133', 5),
('1BM14CS135', 5),
('1BM14CS136', 5),
('1BM14CS138', 5),
('1BM14CS139', 5),
('1BM14CS140', 5),
('1BM14CS143', 5),
('1BM15CS400', 5),
('1BM15CS401', 5),
('1BM15CS402', 5),
('1BM15CS403', 5),
('1BM15CS404', 5),
('1BM15CS405', 5),
('1BM15CS406', 5),
('1BM15CS407', 5),
('1BM15CS408', 5),
('1BM15CS409', 5),
('1BM15CS410', 5),
('1BM15CS411', 5),
('1BM15CS412', 5),
('1BM15CS413', 5),
('1BM15CS414', 5),
('1BM15CS415', 5),
('1BM15CS416', 5),
('1BM15CS417', 5),
('1BM15CS418', 5),
('1BM15CS419', 5),
('1BM15CS420', 5),
('1BM15CS421', 5),
('1BM15CS422', 5),
('1BM15CS423', 5);

-- --------------------------------------------------------

--
-- Table structure for table `studentsubject`
--

CREATE TABLE `StudentSubject` (
  `USN` varchar(255) DEFAULT NULL,
  `CourseCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentsubject`
--

INSERT INTO `StudentSubject` (`USN`, `CourseCode`) VALUES
('1BM14EC001', '15ES3GCLCA'),
('1BM14EC002', '15ES3GCLCA'),
('1BM14EC003', '15ES3GCLCA'),
('1BM12EC004', '15ES3GCLCA'),
('1BM14EC005', '15ES3GCLCA'),
('1BM14EC006', '15ES3GCLCA'),
('1BM14EC007', '15ES3GCLCA'),
('1BM14EC008', '15ES3GCLCA'),
('1BM14EC009', '15ES3GCLCA'),
('1BM14EC010', '15ES3GCLCA'),
('1BM14EC011', '15ES3GCLCA'),
('1BM14EC012', '15ES3GCLCA'),
('1BM14EC013', '15ES3GCLCA'),
('1BM14EC014', '15ES3GCLCA'),
('1BM14EC015', '15ES3GCLCA'),
('1BM14EC016', '15ES3GCLCA'),
('1BM14EC017', '15ES3GCLCA'),
('1BM14EC018', '15ES3GCLCA'),
('1BM14EC019', '15ES3GCLCA'),
('1BM14EC020', '15ES3GCLCA'),
('1BM14EC021', '15ES3GCLCA'),
('1BM14EC022', '15ES3GCLCA'),
('1BM14EC024', '15ES3GCLCA'),
('1BM14EC025', '15ES3GCLCA'),
('1BM14EC026', '15ES3GCLCA'),
('1BM14EC027', '15ES3GCLCA'),
('1BM14EC028', '15ES3GCLCA'),
('1BM14EC029', '15ES3GCLCA'),
('1BM14EC030', '15ES3GCLCA'),
('1BM14EC031', '15ES3GCLCA'),
('1BM14EC032', '15ES3GCLCA'),
('1BM14EC033', '15ES3GCLCA'),
('1BM14EC034', '15ES3GCLCA'),
('1BM14EC035', '15ES3GCLCA'),
('1BM14EC036', '15ES3GCLCA'),
('1BM14EC037', '15ES3GCLCA'),
('1BM14EC038', '15ES3GCLCA'),
('1BM14EC039', '15ES3GCLCA'),
('1BM14EC040', '15ES3GCLCA'),
('1BM14EC041', '15ES3GCLCA'),
('1BM14EC042', '15ES3GCLCA'),
('1BM14EC043', '15ES3GCLCA'),
('1BM14EC044', '15ES3GCLCA'),
('1BM14EC045', '15ES3GCLCA'),
('1BM14EC046', '15ES3GCLCA'),
('1BM14EC047', '15ES3GCLCA'),
('1BM14EC048', '15ES3GCLCA'),
('1BM14EC049', '15ES3GCLCA'),
('1BM14EC050', '15ES3GCLCA'),
('1BM14EC051', '15ES3GCLCA'),
('1BM14EC052', '15ES3GCLCA'),
('1BM14EC053', '15ES3GCLCA'),
('1BM14EC054', '15ES3GCLCA'),
('1BM14EC055', '15ES3GCLCA'),
('1BM14EC056', '15ES3GCLCA'),
('1BM14EC057', '15ES3GCLCA'),
('1BM14EC058', '15ES3GCLCA'),
('1BM14EC060', '15ES3GCLCA'),
('1BM14EC061', '15ES3GCLCA'),
('1BM14EC062', '15ES3GCLCA'),
('1BM14EC063', '15ES3GCLCA'),
('1BM14EC064', '15ES3GCLCA'),
('1BM14EC065', '15ES3GCLCA'),
('1BM14EC066', '15ES3GCLCA'),
('1BM14EC067', '15ES3GCLCA'),
('1BM14EC068', '15ES3GCLCA'),
('1BM14EC069', '15ES3GCLCA'),
('1BM14EC070', '15ES3GCLCA'),
('1BM14EC071', '15ES3GCLCA'),
('1BM14EC072', '15ES3GCLCA'),
('1BM14EC073', '15ES3GCLCA'),
('1BM14EC074', '15ES3GCLCA'),
('1BM14EC075', '15ES3GCLCA'),
('1BM14EC076', '15ES3GCLCA'),
('1BM14EC077', '15ES3GCLCA'),
('1BM14EC078', '15ES3GCLCA'),
('1BM14EC080', '15ES3GCLCA'),
('1BM14EC081', '15ES3GCLCA'),
('1BM14EC082', '15ES3GCLCA'),
('1BM14EC083', '15ES3GCLCA'),
('1BM14EC084', '15ES3GCLCA'),
('1BM14EC085', '15ES3GCLCA'),
('1BM14EC086', '15ES3GCLCA'),
('1BM14EC087', '15ES3GCLCA'),
('1BM14EC088', '15ES3GCLCA'),
('1BM14EC089', '15ES3GCLCA'),
('1BM14EC090', '15ES3GCLCA'),
('1BM14EC091', '15ES3GCLCA'),
('1BM14EC092', '15ES3GCLCA'),
('1BM14EC093', '15ES3GCLCA'),
('1BM14EC094', '15ES3GCLCA'),
('1BM14EC095', '15ES3GCLCA'),
('1BM14EC096', '15ES3GCLCA'),
('1BM14EC097', '15ES3GCLCA'),
('1BM14EC098', '15ES3GCLCA'),
('1BM14EC099', '15ES3GCLCA'),
('1BM14EC100', '15ES3GCLCA'),
('1BM14EC101', '15ES3GCLCA'),
('1BM14EC102', '15ES3GCLCA'),
('1BM14EC103', '15ES3GCLCA'),
('1BM14EC104', '15ES3GCLCA'),
('1BM14EC105', '15ES3GCLCA'),
('1BM14EC106', '15ES3GCLCA'),
('1BM14EC107', '15ES3GCLCA'),
('1BM14EC108', '15ES3GCLCA'),
('1BM14EC109', '15ES3GCLCA'),
('1BM14EC110', '15ES3GCLCA'),
('1BM14EC111', '15ES3GCLCA'),
('1BM14EC112', '15ES3GCLCA'),
('1BM14EC113', '15ES3GCLCA'),
('1BM14EC114', '15ES3GCLCA'),
('1BM14EC115', '15ES3GCLCA'),
('1BM14EC116', '15ES3GCLCA'),
('1BM14EC117', '15ES3GCLCA'),
('1BM14EC118', '15ES3GCLCA'),
('1BM14EC119', '15ES3GCLCA'),
('1BM14EC120', '15ES3GCLCA'),
('1BM14EC121', '15ES3GCLCA'),
('1BM14EC122', '15ES3GCLCA'),
('1BM14EC123', '15ES3GCLCA'),
('1BM14EC124', '15ES3GCLCA'),
('1BM14EC125', '15ES3GCLCA'),
('1BM14EC126', '15ES3GCLCA'),
('1BM14EC127', '15ES3GCLCA'),
('1BM14EC128', '15ES3GCLCA'),
('1BM14EC129', '15ES3GCLCA'),
('1BM14EC130', '15ES3GCLCA'),
('1BM14EC131', '15ES3GCLCA'),
('1BM14EC132', '15ES3GCLCA'),
('1BM14EC133', '15ES3GCLCA'),
('1BM14EC134', '15ES3GCLCA'),
('1BM14EC135', '15ES3GCLCA'),
('1BM14EC136', '15ES3GCLCA'),
('1BM14EC137', '15ES3GCLCA'),
('1BM14EC138', '15ES3GCLCA'),
('1BM14EC139', '15ES3GCLCA'),
('1BM14EC140', '15ES3GCLCA'),
('1BM14EC141', '15ES3GCLCA'),
('1BM14EC142', '15ES3GCLCA'),
('1BM14EC143', '15ES3GCLCA'),
('1BM14EC145', '15ES3GCLCA'),
('1BM13EC009', '15ES3GCLCA'),
('1BM13EC010', '15ES3GCLCA'),
('1BM13EC082', '15ES3GCLCA'),
('1BM13EC116', '15ES3GCLCA'),
('1BM14CS001', '15CS3DCWEP'),
('1BM14CS002', '15CS3DCWEP'),
('1BM14CS003', '15CS3DCWEP'),
('1BM14CS004', '15CS3DCWEP'),
('1BM14CS005', '15CS3DCWEP'),
('1BM14CS006', '15CS3DCWEP'),
('1BM14CS007', '15CS3DCWEP'),
('1BM14CS009', '15CS3DCWEP'),
('1BM14CS010', '15CS3DCWEP'),
('1BM14CS012', '15CS3DCWEP'),
('1BM14CS013', '15CS3DCWEP'),
('1BM14CS014', '15CS3DCWEP'),
('1BM14CS015', '15CS3DCWEP'),
('1BM14CS016', '15CS3DCWEP'),
('1BM14CS017', '15CS3DCWEP'),
('1BM14CS018', '15CS3DCWEP'),
('1BM14CS019', '15CS3DCWEP'),
('1BM14CS020', '15CS3DCWEP'),
('1BM14CS021', '15CS3DCWEP'),
('1BM14CS022', '15CS3DCWEP'),
('1BM14CS023', '15CS3DCWEP'),
('1BM14CS024', '15CS3DCWEP'),
('1BM14CS025', '15CS3DCWEP'),
('1BM14CS026', '15CS3DCWEP'),
('1BM14CS028', '15CS3DCWEP'),
('1BM14CS029', '15CS3DCWEP'),
('1BM14CS030', '15CS3DCWEP'),
('1BM14CS031', '15CS3DCWEP'),
('1BM14CS032', '15CS3DCWEP'),
('1BM14CS033', '15CS3DCWEP'),
('1BM14CS034', '15CS3DCWEP'),
('1BM14CS035', '15CS3DCWEP'),
('1BM14CS036', '15CS3DCWEP'),
('1BM14CS037', '15CS3DCWEP'),
('1BM14CS038', '15CS3DCWEP'),
('1BM14CS039', '15CS3DCWEP'),
('1BM14CS041', '15CS3DCWEP'),
('1BM14CS042', '15CS3DCWEP'),
('1BM14CS043', '15CS3DCWEP'),
('1BM14CS044', '15CS3DCWEP'),
('1BM14CS045', '15CS3DCWEP'),
('1BM14CS046', '15CS3DCWEP'),
('1BM14CS047', '15CS3DCWEP'),
('1BM14CS048', '15CS3DCWEP'),
('1BM14CS050', '15CS3DCWEP'),
('1BM14CS051', '15CS3DCWEP'),
('1BM14CS053', '15CS3DCWEP'),
('1BM14CS054', '15CS3DCWEP'),
('1BM14CS057', '15CS3DCWEP'),
('1BM14CS058', '15CS3DCWEP'),
('1BM14CS059', '15CS3DCWEP'),
('1BM14CS060', '15CS3DCWEP'),
('1BM14CS061', '15CS3DCWEP'),
('1BM14CS062', '15CS3DCWEP'),
('1BM14CS063', '15CS3DCWEP'),
('1BM14CS064', '15CS3DCWEP'),
('1BM14CS065', '15CS3DCWEP'),
('1BM14CS066', '15CS3DCWEP'),
('1BM14CS067', '15CS3DCWEP'),
('1BM14CS068', '15CS3DCWEP'),
('1BM14CS069', '15CS3DCWEP'),
('1BM14CS070', '15CS3DCWEP'),
('1BM14CS071', '15CS3DCWEP'),
('1BM14CS073', '15CS3DCWEP'),
('1BM14CS075', '15CS3DCWEP'),
('1BM14CS076', '15CS3DCWEP'),
('1BM14CS077', '15CS3DCWEP'),
('1BM14CS078', '15CS3DCWEP'),
('1BM14CS079', '15CS3DCWEP'),
('1BM14CS080', '15CS3DCWEP'),
('1BM14CS081', '15CS3DCWEP'),
('1BM14CS082', '15CS3DCWEP'),
('1BM14CS083', '15CS3DCWEP'),
('1BM14CS084', '15CS3DCWEP'),
('1BM14CS085', '15CS3DCWEP'),
('1BM14CS086', '15CS3DCWEP'),
('1BM14CS087', '15CS3DCWEP'),
('1BM14CS089', '15CS3DCWEP'),
('1BM14CS090', '15CS3DCWEP'),
('1BM14CS091', '15CS3DCWEP'),
('1BM14CS092', '15CS3DCWEP'),
('1BM14CS093', '15CS3DCWEP'),
('1BM14CS094', '15CS3DCWEP'),
('1BM14CS095', '15CS3DCWEP'),
('1BM14CS096', '15CS3DCWEP'),
('1BM14CS097', '15CS3DCWEP'),
('1BM14CS099', '15CS3DCWEP'),
('1BM14CS100', '15CS3DCWEP'),
('1BM14CS101', '15CS3DCWEP'),
('1BM14CS102', '15CS3DCWEP'),
('1BM14CS103', '15CS3DCWEP'),
('1BM14CS104', '15CS3DCWEP'),
('1BM14CS105', '15CS3DCWEP'),
('1BM14CS106', '15CS3DCWEP'),
('1BM14CS108', '15CS3DCWEP'),
('1BM14CS110', '15CS3DCWEP'),
('1BM14CS111', '15CS3DCWEP'),
('1BM14CS112', '15CS3DCWEP'),
('1BM14CS113', '15CS3DCWEP'),
('1BM14CS114', '15CS3DCWEP'),
('1BM14CS115', '15CS3DCWEP'),
('1BM14CS116', '15CS3DCWEP'),
('1BM14CS118', '15CS3DCWEP'),
('1BM14CS121', '15CS3DCWEP'),
('1BM14CS122', '15CS3DCWEP'),
('1BM14CS123', '15CS3DCWEP'),
('1BM14CS126', '15CS3DCWEP'),
('1BM14CS127', '15CS3DCWEP'),
('1BM14CS128', '15CS3DCWEP'),
('1BM14CS130', '15CS3DCWEP'),
('1BM14CS131', '15CS3DCWEP'),
('1BM14CS132', '15CS3DCWEP'),
('1BM14CS133', '15CS3DCWEP'),
('1BM14CS135', '15CS3DCWEP'),
('1BM14CS136', '15CS3DCWEP'),
('1BM14CS138', '15CS3DCWEP'),
('1BM14CS139', '15CS3DCWEP'),
('1BM14CS140', '15CS3DCWEP'),
('1BM14CS143', '15CS3DCWEP'),
('1BM13CS005', '15CS3DCWEP'),
('1BM13CS025', '15CS3DCWEP'),
('1BM13CS050', '15CS3DCWEP'),
('1BM13CS060', '15CS3DCWEP'),
('1BM13CS099', '15CS3DCWEP'),
('1BM13CS115', '15CS3DCWEP'),
('1BM13CS116', '15CS3DCWEP'),
('1BM13CS125', '15CS3DCWEP'),
('1BM13CS130', '15CS3DCWEP'),
('1BM13CS135', '15CS3DCWEP'),
('1BM12CS100', '15CS3DCWEP'),
('1BM13CS011', '15CS3DCWEP'),
('1BM13CS044', '15CS3DCWEP'),
('1BM13CS065', '15CS3DCWEP'),
('1BM13CS096', '15CS3DCWEP'),
('1BM13CS143', '15CS3DCWEP'),
('1BM13CS419', '15CS3DCWEP'),
('1BM12CS405', '15CS3DCWEP'),
('1BM15CS400', '15CS3DCWEP'),
('1BM15CS401', '15CS3DCWEP'),
('1BM15CS402', '15CS3DCWEP'),
('1BM15CS403', '15CS3DCWEP'),
('1BM15CS404', '15CS3DCWEP'),
('1BM15CS405', '15CS3DCWEP'),
('1BM15CS406', '15CS3DCWEP'),
('1BM15CS407', '15CS3DCWEP'),
('1BM15CS408', '15CS3DCWEP'),
('1BM15CS409', '15CS3DCWEP'),
('1BM15CS410', '15CS3DCWEP'),
('1BM15CS411', '15CS3DCWEP'),
('1BM15CS412', '15CS3DCWEP'),
('1BM15CS413', '15CS3DCWEP'),
('1BM15CS414', '15CS3DCWEP'),
('1BM15CS415', '15CS3DCWEP'),
('1BM15CS416', '15CS3DCWEP'),
('1BM15CS417', '15CS3DCWEP'),
('1BM15CS418', '15CS3DCWEP'),
('1BM15CS419', '15CS3DCWEP'),
('1BM15CS420', '15CS3DCWEP'),
('1BM15CS421', '15CS3DCWEP'),
('1BM15CS422', '15CS3DCWEP'),
('1BM15CS423', '15CS3DCWEP'),
('1BM13ME001', '16ME5DCCMD'),
('1BM13ME003', '16ME5DCCMD'),
('1BM13ME004', '16ME5DCCMD'),
('1BM13ME005', '16ME5DCCMD'),
('1BM13ME006', '16ME5DCCMD'),
('1BM13ME007', '16ME5DCCMD'),
('1BM13ME008', '16ME5DCCMD'),
('1BM13ME009', '16ME5DCCMD'),
('1BM13ME010', '16ME5DCCMD'),
('1BM13ME011', '16ME5DCCMD'),
('1BM13ME012', '16ME5DCCMD'),
('1BM13ME013', '16ME5DCCMD'),
('1BM13ME014', '16ME5DCCMD'),
('1BM13ME015', '16ME5DCCMD'),
('1BM13ME016', '16ME5DCCMD'),
('1BM13ME017', '16ME5DCCMD'),
('1BM13ME018', '16ME5DCCMD'),
('1BM13ME021', '16ME5DCCMD'),
('1BM13ME022', '16ME5DCCMD'),
('1BM13ME023', '16ME5DCCMD'),
('1BM13ME024', '16ME5DCCMD'),
('1BM13ME025', '16ME5DCCMD'),
('1BM13ME026', '16ME5DCCMD'),
('1BM13ME027', '16ME5DCCMD'),
('1BM13ME028', '16ME5DCCMD'),
('1BM13ME030', '16ME5DCCMD'),
('1BM13ME031', '16ME5DCCMD'),
('1BM13ME032', '16ME5DCCMD'),
('1BM13ME033', '16ME5DCCMD'),
('1BM13ME034', '16ME5DCCMD'),
('1BM13ME035', '16ME5DCCMD'),
('1BM13ME036', '16ME5DCCMD'),
('1BM13ME037', '16ME5DCCMD'),
('1BM13ME038', '16ME5DCCMD'),
('1BM13ME039', '16ME5DCCMD'),
('1BM13ME041', '16ME5DCCMD'),
('1BM13ME042', '16ME5DCCMD'),
('1BM13ME044', '16ME5DCCMD'),
('1BM13ME045', '16ME5DCCMD'),
('1BM13ME046', '16ME5DCCMD'),
('1BM13ME047', '16ME5DCCMD'),
('1BM13ME048', '16ME5DCCMD'),
('1BM13ME049', '16ME5DCCMD'),
('1BM13ME050', '16ME5DCCMD'),
('1BM13ME051', '16ME5DCCMD'),
('1BM13ME053', '16ME5DCCMD'),
('1BM13ME054', '16ME5DCCMD'),
('1BM13ME055', '16ME5DCCMD'),
('1BM13ME056', '16ME5DCCMD'),
('1BM13ME057', '16ME5DCCMD'),
('1BM13ME058', '16ME5DCCMD'),
('1BM13ME059', '16ME5DCCMD'),
('1BM13ME060', '16ME5DCCMD'),
('1BM13ME062', '16ME5DCCMD'),
('1BM13ME063', '16ME5DCCMD'),
('1BM13ME064', '16ME5DCCMD'),
('1BM13ME065', '16ME5DCCMD'),
('1BM13ME066', '16ME5DCCMD'),
('1BM13ME067', '16ME5DCCMD'),
('1BM13ME068', '16ME5DCCMD'),
('1BM13ME069', '16ME5DCCMD'),
('1BM13ME070', '16ME5DCCMD'),
('1BM13ME071', '16ME5DCCMD'),
('1BM13ME073', '16ME5DCCMD'),
('1BM13ME074', '16ME5DCCMD'),
('1BM13ME075', '16ME5DCCMD'),
('1BM13ME076', '16ME5DCCMD'),
('1BM13ME077', '16ME5DCCMD'),
('1BM13ME078', '16ME5DCCMD'),
('1BM13ME079', '16ME5DCCMD'),
('1BM13ME080', '16ME5DCCMD'),
('1BM13ME081', '16ME5DCCMD'),
('1BM13ME082', '16ME5DCCMD'),
('1BM13ME083', '16ME5DCCMD'),
('1BM13ME084', '16ME5DCCMD'),
('1BM13ME085', '16ME5DCCMD'),
('1BM13ME086', '16ME5DCCMD'),
('1BM13ME087', '16ME5DCCMD'),
('1BM13ME088', '16ME5DCCMD'),
('1BM13ME091', '16ME5DCCMD'),
('1BM13ME092', '16ME5DCCMD'),
('1BM13ME093', '16ME5DCCMD'),
('1BM13ME094', '16ME5DCCMD'),
('1BM13ME095', '16ME5DCCMD'),
('1BM13ME096', '16ME5DCCMD'),
('1BM13ME097', '16ME5DCCMD'),
('1BM13ME098', '16ME5DCCMD'),
('1BM13ME099', '16ME5DCCMD'),
('1BM13ME100', '16ME5DCCMD'),
('1BM13ME101', '16ME5DCCMD'),
('1BM13ME102', '16ME5DCCMD'),
('1BM13ME103', '16ME5DCCMD'),
('1BM13ME104', '16ME5DCCMD'),
('1BM13ME106', '16ME5DCCMD'),
('1BM13ME107', '16ME5DCCMD'),
('1BM13ME108', '16ME5DCCMD'),
('1BM13ME109', '16ME5DCCMD'),
('1BM13ME110', '16ME5DCCMD'),
('1BM13ME111', '16ME5DCCMD'),
('1BM13ME112', '16ME5DCCMD'),
('1BM13ME115', '16ME5DCCMD'),
('1BM13ME116', '16ME5DCCMD'),
('1BM13ME117', '16ME5DCCMD'),
('1BM13ME118', '16ME5DCCMD'),
('1BM13ME119', '16ME5DCCMD'),
('1BM13ME120', '16ME5DCCMD'),
('1BM13ME121', '16ME5DCCMD'),
('1BM13ME122', '16ME5DCCMD'),
('1BM13ME123', '16ME5DCCMD'),
('1BM13ME124', '16ME5DCCMD'),
('1BM13ME125', '16ME5DCCMD'),
('1BM13ME126', '16ME5DCCMD'),
('1BM13ME127', '16ME5DCCMD'),
('1BM13ME128', '16ME5DCCMD'),
('1BM13ME129', '16ME5DCCMD'),
('1BM13ME130', '16ME5DCCMD'),
('1BM13ME133', '16ME5DCCMD'),
('1BM13ME137', '16ME5DCCMD'),
('1BM13ME139', '16ME5DCCMD'),
('1BM13ME141', '16ME5DCCMD'),
('1BM13ME142', '16ME5DCCMD'),
('1BM13ME143', '16ME5DCCMD'),
('1BM13ME146', '16ME5DCCMD'),
('1BM13ME151', '16ME5DCCMD'),
('1BM13ME152', '16ME5DCCMD'),
('1BM14ME400', '16ME5DCCMD'),
('1BM14ME401', '16ME5DCCMD'),
('1BM14ME402', '16ME5DCCMD'),
('1BM14ME403', '16ME5DCCMD'),
('1BM14ME404', '16ME5DCCMD'),
('1BM14ME405', '16ME5DCCMD'),
('1BM14ME406', '16ME5DCCMD'),
('1BM14ME407', '16ME5DCCMD'),
('1BM14ME408', '16ME5DCCMD'),
('1BM14ME409', '16ME5DCCMD'),
('1BM14ME410', '16ME5DCCMD'),
('1BM14ME411', '16ME5DCCMD'),
('1BM14ME412', '16ME5DCCMD'),
('1BM14ME413', '16ME5DCCMD'),
('1BM14ME414', '16ME5DCCMD'),
('1BM14ME415', '16ME5DCCMD'),
('1BM14ME416', '16ME5DCCMD'),
('1BM14ME417', '16ME5DCCMD'),
('1BM14ME418', '16ME5DCCMD'),
('1BM14ME420', '16ME5DCCMD'),
('1BM14ME421', '16ME5DCCMD'),
('1BM14ME422', '16ME5DCCMD'),
('1BM12ME006', '16ME5DCCMD'),
('1BM12ME044', '16ME5DCCMD'),
('1BM12ME062', '16ME5DCCMD'),
('1BM12ME064', '16ME5DCCMD'),
('1BM12ME068', '16ME5DCCMD'),
('1BM12ME121', '16ME5DCCMD'),
('1BM12ME151', '16ME5DCCMD'),
('1BM13ME405', '16ME5DCCMD'),
('1BM14IS001', '15IS3DCWEP'),
('1BM14IS002', '15IS3DCWEP'),
('1BM14IS003', '15IS3DCWEP'),
('1BM14IS004', '15IS3DCWEP'),
('1BM14IS005', '15IS3DCWEP'),
('1BM14IS006', '15IS3DCWEP'),
('1BM14IS008', '15IS3DCWEP'),
('1BM14IS009', '15IS3DCWEP'),
('1BM14IS010', '15IS3DCWEP'),
('1BM14IS011', '15IS3DCWEP'),
('1BM14IS012', '15IS3DCWEP'),
('1BM14IS013', '15IS3DCWEP'),
('1BM14IS014', '15IS3DCWEP'),
('1BM14IS015', '15IS3DCWEP'),
('1BM14IS016', '15IS3DCWEP'),
('1BM14IS018', '15IS3DCWEP'),
('1BM14IS019', '15IS3DCWEP'),
('1BM14IS020', '15IS3DCWEP'),
('1BM14IS021', '15IS3DCWEP'),
('1BM14IS022', '15IS3DCWEP'),
('1BM14IS023', '15IS3DCWEP'),
('1BM14IS024', '15IS3DCWEP'),
('1BM14IS025', '15IS3DCWEP'),
('1BM14IS026', '15IS3DCWEP'),
('1BM14IS028', '15IS3DCWEP'),
('1BM14IS029', '15IS3DCWEP'),
('1BM14IS030', '15IS3DCWEP'),
('1BM14IS031', '15IS3DCWEP'),
('1BM14IS032', '15IS3DCWEP'),
('1BM14IS034', '15IS3DCWEP'),
('1BM14IS035', '15IS3DCWEP'),
('1BM14IS037', '15IS3DCWEP'),
('1BM14IS038', '15IS3DCWEP'),
('1BM14IS039', '15IS3DCWEP'),
('1BM14IS040', '15IS3DCWEP'),
('1BM14IS041', '15IS3DCWEP'),
('1BM14IS042', '15IS3DCWEP'),
('1BM14IS043', '15IS3DCWEP'),
('1BM14IS044', '15IS3DCWEP'),
('1BM14IS045', '15IS3DCWEP'),
('1BM14IS046', '15IS3DCWEP'),
('1BM14IS047', '15IS3DCWEP'),
('1BM14IS048', '15IS3DCWEP'),
('1BM14IS049', '15IS3DCWEP'),
('1BM14IS050', '15IS3DCWEP'),
('1BM14IS051', '15IS3DCWEP'),
('1BM14IS052', '15IS3DCWEP'),
('1BM14IS054', '15IS3DCWEP'),
('1BM14IS055', '15IS3DCWEP'),
('1BM14IS056', '15IS3DCWEP'),
('1BM14IS057', '15IS3DCWEP'),
('1BM14IS058', '15IS3DCWEP'),
('1BM14IS059', '15IS3DCWEP'),
('1BM14IS060', '15IS3DCWEP'),
('1BM14IS061', '15IS3DCWEP'),
('1BM14IS062', '15IS3DCWEP'),
('1BM14IS063', '15IS3DCWEP'),
('1BM14IS064', '15IS3DCWEP'),
('1BM14IS065', '15IS3DCWEP'),
('1BM14IS067', '15IS3DCWEP'),
('1BM14IS068', '15IS3DCWEP'),
('1BM14IS069', '15IS3DCWEP'),
('1BM14IS070', '15IS3DCWEP'),
('1BM14IS071', '15IS3DCWEP'),
('1BM14IS072', '15IS3DCWEP'),
('1BM14IS073', '15IS3DCWEP'),
('1BM14IS074', '15IS3DCWEP'),
('1BM14IS076', '15IS3DCWEP'),
('1BM14IS078', '15IS3DCWEP'),
('1BM14IS079', '15IS3DCWEP'),
('1BM14IS080', '15IS3DCWEP'),
('1BM14IS081', '15IS3DCWEP'),
('1BM14IS082', '15IS3DCWEP'),
('1BM14IS083', '15IS3DCWEP'),
('1BM14IS084', '15IS3DCWEP'),
('1BM14IS085', '15IS3DCWEP'),
('1BM14IS086', '15IS3DCWEP'),
('1BM14IS087', '15IS3DCWEP'),
('1BM14IS088', '15IS3DCWEP'),
('1BM14IS089', '15IS3DCWEP'),
('1BM14IS090', '15IS3DCWEP'),
('1BM14IS091', '15IS3DCWEP'),
('1BM14IS092', '15IS3DCWEP'),
('1BM14IS093', '15IS3DCWEP'),
('1BM14IS094', '15IS3DCWEP'),
('1BM14IS095', '15IS3DCWEP'),
('1BM14IS096', '15IS3DCWEP'),
('1BM14IS097', '15IS3DCWEP'),
('1BM14IS098', '15IS3DCWEP'),
('1BM14IS099', '15IS3DCWEP'),
('1BM14IS100', '15IS3DCWEP'),
('1BM14IS101', '15IS3DCWEP'),
('1BM14IS102', '15IS3DCWEP'),
('1BM14IS103', '15IS3DCWEP'),
('1BM14IS104', '15IS3DCWEP'),
('1BM14IS106', '15IS3DCWEP'),
('1BM13IS093', '15IS3DCWEP'),
('1BM15IS400', '15IS3DCWEP'),
('1BM15IS401', '15IS3DCWEP'),
('1BM15IS402', '15IS3DCWEP'),
('1BM15IS403', '15IS3DCWEP'),
('1BM15IS405', '15IS3DCWEP'),
('1BM15IS406', '15IS3DCWEP'),
('1BM15IS407', '15IS3DCWEP'),
('1BM15IS408', '15IS3DCWEP'),
('1BM15IS409', '15IS3DCWEP'),
('1BM15IS410', '15IS3DCWEP'),
('1BM15IS411', '15IS3DCWEP'),
('1BM15IS413', '15IS3DCWEP'),
('1BM15IS414', '15IS3DCWEP'),
('1BM15IS415', '15IS3DCWEP'),
('1BM15IS416', '15IS3DCWEP'),
('1BM15IS417', '15IS3DCWEP'),
('1BM10IS063', '15IS3DCWEP'),
('1BM11IS055', '15IS3DCWEP'),
('1BM12IS059', '15IS3DCWEP'),
('1BM12IS097', '15IS3DCWEP'),
('1BM12IS099', '15IS3DCWEP'),
('1BM13IS041', '15IS3DCWEP'),
('1BM13IS056', '15IS3DCWEP'),
('1BM13IS077', '15IS3DCWEP'),
('1BM13IS101', '15IS3DCWEP'),
('1BM14IS415', '15IS3DCWEP');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `Subject` (
  `CourseCode` varchar(255) NOT NULL,
  `InstitutionalElective` tinyint(1) DEFAULT NULL,
  `DepartmentElective` tinyint(1) DEFAULT NULL,
  `ClusterElective` tinyint(1) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Dependency` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `Subject` (`CourseCode`, `InstitutionalElective`, `DepartmentElective`, `ClusterElective`, `Name`, `Dependency`) VALUES
('15AM1DCABC', 0, 0, 0, 'dhfhgk', -1),
('15CI3GCPCP', 0, 0, 0, 'Programming with C++', -1),
('15CS3DCCOA', 0, 0, 0, 'COMPUTER ORGANIZATION AND ARCHITECTURE', -1),
('15CS3DCDST', 0, 0, 0, 'DATA STRUCTURES', -1),
('15CS3DCWEP', 0, 0, 0, 'WEB PROGRAMMING', -1),
('15EC3DLSL1', 0, 0, 0, 'SIMULATION LABORATORY 1', -1),
('15EE3DCFTH', 0, 0, 0, 'FIELD THEORY', -1),
('15EE3DCSL1', 0, 0, 0, 'SIMULATION LABORATORY 1', -1),
('15ES3GCAME', 0, 0, 0, 'ANALOG MICROELECTRONICS', -1),
('15ES3GCDEC', 0, 0, 0, 'DIGITAL ELECTRONICS', -1),
('15ES3GCFAW', 0, 0, 0, 'FIELDS AND WAVES', -1),
('15ES3GCLCA', 0, 0, 0, 'LINEAR CIRCUIT ANALYSIS', -1),
('15IS3DCCOE', 0, 0, 0, 'Computer Organization and Embeded Systems', -1),
('15IS3DCDSC', 0, 0, 0, 'Data Structures with C', -1),
('15IS3DCTFC', 0, 0, 0, 'Theoritical Foundation of Computations', -1),
('15IS3DCWEP', 0, 0, 0, 'Web Proramming', -1),
('15IS5DCDAE', 0, 0, 0, 'data sciences', -1),
('15MA3CCDMS', 0, 0, 0, 'Discrete Mathematical Structures', -1),
('15MA3GCAEM', 0, 0, 0, 'ADVANCED ENGINEERING MATHEMATICS', -1),
('15MA3GCMAT', 0, 0, 0, 'MATHEMATICS 3', -1),
('15ME3DCBTD', 0, 0, 0, 'BASIC THERMODYNAMICS', -1),
('15ME3DCFME', 0, 0, 0, 'FLUID MECHANICS', -1),
('15ME3DCFWT', 0, 0, 0, 'FOUNDRY AND WELDING TECHNOLOGY', -1),
('15ME3DCMSM', 0, 0, 0, 'MATERIAL SCIENCE AND METALLURGY', -1),
('15ME3DCSOM', 0, 0, 0, 'STRENGTH OF MATERIALS', -1),
('16EC5DCCSM', 0, 0, 0, 'CONTROL SYSTEM', -1),
('16EC5DCCT1', 0, 0, 0, 'COMMUNICATION THEORY-1', -1),
('16EC5DCDSP', 0, 0, 0, 'DIGITAL SIGNAL PROCESSING', -1),
('16EC5DCFOV', 0, 0, 0, 'FUNDAMENTALS OF VLSI', -1),
('16EC5DCMWE', 0, 0, 0, 'MICROWAVE ENGINEERING', -1),
('16EC5DE1CA', 0, 1, 0, 'COMPUTER ARCHITECTURE', -1),
('16EC5DE1IP', 0, 1, 0, 'IMAGE PROCESSING', -1),
('16EC5DE1OP', 0, 1, 0, 'OOPs USING C++', -1),
('16IS5DCDBM', 0, 0, 0, 'DATABASE MANAGEMENT SYSTEMS', -1),
('16IS5DCDCN', 0, 0, 0, 'DATA COMMUNICATION AND NETWORKING', -1),
('16IS5DCJAV', 0, 0, 0, 'PROGRAMMING WITH JAVA', -1),
('16IS5DCWEP', 0, 0, 0, 'WEB PROGRAMMING', -1),
('16IS5DEAIN', 0, 1, 0, 'ARTIFICIAL INTELLIGENCE', -1),
('16IS5DEDMG', 0, 1, 0, 'DATA MINING', -1),
('16IS6DCCNS', 0, 0, 0, 'CNS', -1),
('16ME5DCCMD', 0, 0, 0, 'COMPUTER AIDED MACHINE DRAWING', 1),
('16ME5DCDM2', 0, 0, 0, 'DESIGN OF MACHINE ELEMENTS -II', -1),
('16ME5DCDOM', 0, 0, 0, 'DYNAMICS OF MACHINES', -1),
('16ME5DCFHT', 0, 0, 0, 'FUNDAMENTALS OF HEAT TRANSFER', -1),
('16ME5DCMAE', 0, 0, 0, 'MANAGEMENT & ENTREPRENEURSHIP', -1),
('16ME5DE1FD', 0, 1, 0, 'INCOMPRESSIBLE FLUID DYNAMICS', -1),
('16ME5DEICE', 0, 1, 0, 'I.C ENGINES', -1),
('16ME5DENTM', 0, 1, 0, 'NON-TRADITIONAL MACHINES', -1),
('16ME5DETOE', 0, 1, 0, 'THEORY OF ELASTICITY', -1),
('16TE5DCACM', 0, 0, 0, 'ANALOG COMMUNICATION', -1),
('16TE5DCCN1', 0, 0, 0, 'COMPUTER COMMUNICATION NETWORKS-1', -1),
('16TE5DCDTS', 0, 0, 0, 'DISCRETE TIME SIGNAL PROCESSING', -1),
('16TE5DCLCS', 0, 0, 0, 'LINEAR CONTROL SYSTEMS', -1),
('16TE5DCVLI', 0, 0, 0, 'FUNDAMENTALS OF VLSI', -1),
('16TE5DE1OS', 0, 1, 0, 'OPERATING SYSTEMS', -1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `departmentsubject`
--
ALTER TABLE `DepartmentSubject`
  ADD KEY `DepartmentID` (`DepartmentID`),
  ADD KEY `CourseCode` (`CourseCode`);

--
-- Indexes for table `dependency`
--
ALTER TABLE `Dependency`
  ADD PRIMARY KEY (`DependencyID`),
  ADD KEY `CourseCode` (`CourseCode`);

--
-- Indexes for table `dependencyroom`
--
ALTER TABLE `DependencyRoom`
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `DependencyID` (`DependencyID`);

--
-- Indexes for table `room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`RoomID`);

--
-- Indexes for table `student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`USN`),
  ADD KEY `DepartmentID` (`DepartmentID`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `Department`
  MODIFY `DepartmentID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `Room`
  MODIFY `RoomID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dependency`
--
ALTER TABLE `Dependency`
  ADD CONSTRAINT `dependency_ibfk_1` FOREIGN KEY (`CourseCode`) REFERENCES `Subject` (`CourseCode`);

--
-- Constraints for table `studentsubject`
--
ALTER TABLE `StudentSubject`
  ADD CONSTRAINT `studentsubject_ibfk_1` FOREIGN KEY (`USN`) REFERENCES `Student` (`USN`),
  ADD CONSTRAINT `studentsubject_ibfk_2` FOREIGN KEY (`CourseCode`) REFERENCES `Subject` (`CourseCode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
