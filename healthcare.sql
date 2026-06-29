-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2026 at 05:42 PM
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
-- Database: `healthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `Appointment_ID` int(11) NOT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Doctor_ID` int(11) DEFAULT NULL,
  `Appointment_Date` date DEFAULT NULL,
  `Appointment_Time` time DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`Appointment_ID`, `Patient_ID`, `Doctor_ID`, `Appointment_Date`, `Appointment_Time`, `Status`, `Notes`) VALUES
(1, 1, 1, '2026-06-01', '09:00:00', 'Completed', 'Routine Checkup'),
(2, 2, 2, '2026-06-02', '10:00:00', 'Pending', 'Child Fever'),
(3, 3, 3, '2026-06-03', '11:00:00', 'Completed', 'Heart Examination'),
(4, 4, 4, '2026-06-04', '12:00:00', 'Completed', 'Skin Infection'),
(5, 5, 5, '2026-06-05', '13:00:00', 'Pending', 'Leg Injury');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `Doctor_ID` int(11) NOT NULL,
  `Doctor_Name` varchar(100) NOT NULL,
  `Specialization` varchar(80) DEFAULT NULL,
  `Phone` varchar(80) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_ID`, `Doctor_Name`, `Specialization`, `Phone`, `Email`) VALUES
(1, 'Dr. Kamara', 'General Medicine', '077123111', 'kamara@gmail.com'),
(2, 'Dr. Sesay', 'Pediatrics', '077123222', 'sesay@gmail.com'),
(3, 'Dr. Koroma', 'Cardiology', '077123333', 'koroma@gmail.com'),
(4, 'Dr. Bangura', 'Dermatology', '077123444', 'bangura@gmail.com'),
(5, 'Dr. Kanu', 'Orthopedics', '077123555', 'kanu@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Registration_Date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_ID`, `First_Name`, `Last_Name`, `Gender`, `Date_Of_Birth`, `Phone`, `Address`, `Registration_Date`) VALUES
(1, 'Joshua', 'Bangura', 'Male', '2003-05-15', '077999888', 'Freetown', '2026-06-29'),
(2, 'Umaru', 'Sodor', 'Female', '2001-07-22', '078987654', 'Bo', '2026-06-29'),
(3, 'Joseph', 'Davies', 'Male', '1998-10-12', '079654321', 'Kenema', '2026-06-29'),
(4, 'Fatmata', 'Koroma', 'Female', '2000-08-17', '077111222', 'Makeni', '2026-06-29'),
(5, 'Alhaji', 'Turay', 'Male', '1995-02-11', '075333444', 'Port Loko', '2026-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Appointment_ID` int(11) DEFAULT NULL,
  `Diagnosis` varchar(100) DEFAULT NULL,
  `Treatment_Description` text DEFAULT NULL,
  `Medication_Prescribed` varchar(100) DEFAULT NULL,
  `Treatment_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`Treatment_ID`, `Appointment_ID`, `Diagnosis`, `Treatment_Description`, `Medication_Prescribed`, `Treatment_Date`) VALUES
(1, 1, 'Malaria', 'Malaria treatment administered', 'Coartem', '2026-06-01'),
(2, 2, 'Typhoid', 'Laboratory test requested', 'Ciprofloxacin', '2026-06-02'),
(3, 3, 'Hypertension', 'Blood pressure management', 'Amlodipine', '2026-06-03'),
(4, 4, 'Dermatitis', 'Skin cream prescribed', 'Hydrocortisone', '2026-06-04'),
(5, 5, 'Fracture', 'Leg cast applied', 'Pain Reliever', '2026-06-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`Appointment_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Doctor_ID` (`Doctor_ID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`Doctor_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Patient_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`),
  ADD KEY `Appointment_ID` (`Appointment_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `Appointment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `Doctor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `Patient_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `Treatment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`Doctor_ID`) REFERENCES `doctor` (`Doctor_ID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointments` (`Appointment_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
