-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 04, 2021 at 12:34 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `VsORkEKAiX`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_balance`
--

CREATE TABLE `tb_balance` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_balance`
--

INSERT INTO `tb_balance` (`id`, `id_user`, `balance`) VALUES
(1, 2, 2000158),
(2, 4, 1412156),
(3, 5, 24686),
(4, 6, 0),
(5, 7, 0),
(6, 8, 0),
(7, 9, 0),
(8, 10, 0),
(9, 11, 0),
(10, 12, 0),
(11, 13, 0),
(12, 14, 0),
(13, 15, 0),
(14, 16, 0),
(15, 17, 0),
(16, 18, 0),
(17, 19, 0),
(18, 20, 0),
(19, 21, 0),
(20, 22, 0),
(21, 23, 0),
(22, 24, 0),
(23, 25, 0),
(24, 26, 0),
(25, 27, 968300);

-- --------------------------------------------------------

--
-- Table structure for table `tb_login_token`
--

CREATE TABLE `tb_login_token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_login_token`
--

INSERT INTO `tb_login_token` (`id`, `token`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJicm9ueWF6YXljaGlrOTZAZ21haWwuY29tIiwiaWF0IjoxNjEyMTQ5OTIyLCJleHAiOjE2MTIyMzYzMjJ9.um97kFUNJC0Lp-_r2lNNpmUsx87r_a-ffIthGJXwcOE'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJicm9ueWF6YXljaGlrOTZAZ21haWwuY29tIiwiaWF0IjoxNjEyMTY2Nzk2LCJleHAiOjE2MTIyNTMxOTZ9.otNhmcoLJOdRjRAi39NYj0nFddrPjDATtmlsArKpv10'),
(4, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiZW1haWwiOiJ2aXZvcmk4ODk4QDIwMGNhaS5jb20iLCJpYXQiOjE2MTIxNjgzMDksImV4cCI6MTYxMjI1NDcwOX0.FwIU-HUwrHx3wWZ-ABkegtQm5NANaigZTr1JCUkZdCk'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJicm9ueWF6YXljaGlrOTZAZ21haWwuY29tIiwiaWF0IjoxNjEyMTc0Nzg2LCJleHAiOjE2MTIyNjExODZ9.yGrl1s0e00xC3VpWNU4oD98PdgTaCApiO1NT7D9WUBA'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk3MDk0LCJleHAiOjE2MTIyODM0OTR9.WZMYp3_LAD7j05dpZlVCt3VGMDaF5BPt4CJ2mir6Xr0'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk3OTQ0LCJleHAiOjE2MTIyODQzNDR9.g_mtfMznID5CH5qSUlvJSmAAbCcregXdKuqYGrsL0Ro'),
(8, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk4MDMyLCJleHAiOjE2MTIyODQ0MzJ9.oUeFSw3tr8ycAopTWxQYzQKtCpVfWHGo6n0ZTqFltto'),
(9, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk4MTE4LCJleHAiOjE2MTIyODQ1MTh9.F4Rx_hwmU1E7UWKEyzdIgIKKObAumwXzXs9c-b8J-i8'),
(10, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk4NTUyLCJleHAiOjE2MTIyODQ5NTJ9.SeLxdRFXo_UWRXuwFSX7HvTQ0Vr_eIxxTqd9Hh7DjVQ'),
(11, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk4NzQwLCJleHAiOjE2MTIyODUxNDB9.-Q1WyD8A53Kpnc21aTuXZXvSUhjWXDBFISBoIDkhOuY'),
(12, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMTk5MTcxLCJleHAiOjE2MTIyODU1NzF9.ZzUBkTWD18CDwZDUV_rnqXobOk68Q6nzte2Rx8cCe-A'),
(13, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjAwMzU5LCJleHAiOjE2MTIyODY3NTl9.Oqa2gqe9XyVBGVHrp1ugYjVSk5wxGHdWsDsv0qL7WPM'),
(14, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2MzAwLCJleHAiOjE2MTIyOTI3MDB9.rlAkxUtGnTyThiDZto-ayIkeZ8QzLPSwpkpH_5PKFvk'),
(15, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2MzAzLCJleHAiOjE2MTIyOTI3MDN9.i_o1HMOM27oDW7FlVjf4gEEzl7Bc5i-8SUXRWGcz7Js'),
(16, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2MzA3LCJleHAiOjE2MTIyOTI3MDd9.2MW_HuOG9jRU3Dag_xkoNlrGNgYJXIxx1vInhT0h0KA'),
(17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2MzMxLCJleHAiOjE2MTIyOTI3MzF9.yAm1CmuOFXK28KXFDu0QGLuvIRYA0zqQJ7Nq1qec-_U'),
(18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2MzQyLCJleHAiOjE2MTIyOTI3NDJ9.6cnKn1nyaGulkC3REMAfApGrsSpxDN8XKYOOKVu8UEs'),
(19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2MzQ0LCJleHAiOjE2MTIyOTI3NDR9.b3xFjcxzeyFykuvqxrYpXV0-LUWsTXUroQBN6qoi_ts'),
(20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NDI5LCJleHAiOjE2MTIyOTI4Mjl9.4wovCBlQC_jQDn0d_YSvHFcQoMM3oYcOWbhnTfe0Fgs'),
(21, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NTA4LCJleHAiOjE2MTIyOTI5MDh9.6CPhhPESTWX62vb3pZIJI_JSz-E3KIlKbOX-YHmnPZY'),
(22, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NTY2LCJleHAiOjE2MTIyOTI5NjZ9.IxPaD5uJEjUrZucnG1-NsykIhet0ZyEm9zSe6kXrgGs'),
(23, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NjY4LCJleHAiOjE2MTIyOTMwNjh9.WUKW-fBHvDPmiRIQNy92Tn-pX2Z1G5AjpEYCWy4wIH4'),
(24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NjY5LCJleHAiOjE2MTIyOTMwNjl9.x5zFOYBvsDtaEifI_H7LIQieq0xA9qxwTUw7ZTEPPuU'),
(25, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NjcwLCJleHAiOjE2MTIyOTMwNzB9.3lOeJ9_5WjZN5cxO8igtB8ELHD_K3HWyNc4v98Jek2U'),
(26, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NjkyLCJleHAiOjE2MTIyOTMwOTJ9.EubP-KRfkF3XjxB-BSJSeZ6EaoO4EkLo7UUNRUvp8z4'),
(27, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2Njk4LCJleHAiOjE2MTIyOTMwOTh9.AvHqqGlBbkxwDEXk7_JmCYhDI2r-jNVuCdSk5C5ko9g'),
(28, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NzAwLCJleHAiOjE2MTIyOTMxMDB9.AcE3WXeXAA7s9bbShHst8lAuiDh8Gy-OG9By1Cz4CXg'),
(29, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NzA0LCJleHAiOjE2MTIyOTMxMDR9.n0xuixJUUgdouBykiYcjqaNnWkj63667HG4nKgF8dEU'),
(30, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjA2NzI1LCJleHAiOjE2MTIyOTMxMjV9.Cvc9Uj6E75xyrSwx4UiXKJwGlqipd8a1I_-o5xuuj7g'),
(31, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjEwNDEzLCJleHAiOjE2MTIyOTY4MTN9.MnGt8IlOSgHmojDK5rVV9Ix1wJl32F2ghaJMp-n3-Us'),
(32, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMjExMDUzLCJleHAiOjE2MTIyOTc0NTN9.WCn4aEKlFE1duyZ2ROAAWxiiO4CQ2KcjbccJE7nFxJg'),
(33, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJicm9ueWF6YXljaGlrOTZAZ21haWwuY29tIiwiaWF0IjoxNjEyMjI1MDkxLCJleHAiOjE2MTIzMTE0OTF9.ZuuQSFvJvn5XD5JjcnmSGJ-8ZU_Tomq-59uvfdPp4M0'),
(34, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJicm9ueWF6YXljaGlrOTZAZ21haWwuY29tIiwiaWF0IjoxNjEyMjI1MTQ4LCJleHAiOjE2MTIzMTE1NDh9.VVy-cTaVJpoWzZzau47eQaHpEVxnK1knF9yc_NGZ1LU'),
(35, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMjI3ODI2LCJleHAiOjE2MTIzMTQyMjZ9.CaQyD73voAS9skJSE2QuL3voBRkg2e--UG9lPMctvB4'),
(36, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsImVtYWlsIjoiYWJkaXByaXlhbmdnYUBnbWFpbC5jb20iLCJpYXQiOjE2MTIyNDMyNDQsImV4cCI6MTYxMjMyOTY0NH0.leuqtaGlmRhnIJP2nehqy-ZTp1ewsql_LzjKFiCx660'),
(38, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImVtYWlsIjoiYmFzYWppMTkwNkBhbGljZGguY29tIiwiaWF0IjoxNjEyMjcyNzAzLCJleHAiOjE2MTIzNTkxMDN9.fwKSESoVWaXhEz986kiGEXx7zlU6VMBYSkM1as2ftGg'),
(39, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsImVtYWlsIjoiYWJkaXByaXlhbmdnYUBnbWFpbC5jb20iLCJpYXQiOjE2MTIyODA4MjYsImV4cCI6MTYxMjM2NzIyNn0.fcym9ocpCVABjITFKWH_TSHaw_8pwtlFbVSe7Bp62gk'),
(40, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImVtYWlsIjoiYmFzYWppMTkwNkBhbGljZGguY29tIiwiaWF0IjoxNjEyMjg3MDEyLCJleHAiOjE2MTIzNzM0MTJ9.6Rmo13CQ2endRCtE6xLCZjHdKz_b_zMnA6gGmmmaEDA'),
(41, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMzExODkwLCJleHAiOjE2MTIzOTgyOTB9.MlwmA39fWz5z-v-XpuwOxGxhts8-m89Wf6ru1HdMieo'),
(42, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzE0Nzc5LCJleHAiOjE2MTI0MDExNzl9.7w10LVr6cx4oVxqAUz00munjHR2B8hvvadn-4Z83BeY'),
(43, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzE1MDMwLCJleHAiOjE2MTI0MDE0MzB9.49D5UtVnGKp1n4kOr6xjJLeG1KgbtFWnU6gMsZYIKsk'),
(44, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzE1MDI3LCJleHAiOjE2MTI0MDE0Mjd9.yvSWCGOiGsqDix9OoRA0AcZuzBFDijcAYFfzrRda08k'),
(46, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzE3MjA1LCJleHAiOjE2MTI0MDM2MDV9.d-LHbzPvlJZukm9pvN9okGZohoudbi_rrHWORV-55EU'),
(47, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzIyOTk3LCJleHAiOjE2MTI0MDkzOTd9.U2XDuVd0BKYT4wyBZtPkwuIf9IFnXECiLg3Cm2TO1xQ'),
(50, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzM4NDA2LCJleHAiOjE2MTI0MjQ4MDZ9.F_2jXn9nyvvruhs1d4pe6arNVVptgU8d5wtVtbwkas4'),
(51, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzM5MzI3LCJleHAiOjE2MTI0MjU3Mjd9.p96jLGwuMl4ILh4KaznyMU73pt_0p44wpiLX6pj4hec'),
(52, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoiaGFlbWFoZTNAZ21haWwuY29tIiwiaWF0IjoxNjEyMzQ2MjA3LCJleHAiOjE2MTI0MzI2MDd9._dNCzYy6Gp_3SgtAnmIme8mY4mYum16elKNA_bLEnJg'),
(53, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzUyMDU5LCJleHAiOjE2MTI0Mzg0NTl9.iMyOx52kSkZQA0foxPr-ZcN5ImDBu69IBnmPJLUPnU4'),
(54, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiZW1haWwiOiJicm9ueWF6YXljaGlrOTZAZ21haWwuY29tIiwiaWF0IjoxNjEyMzUyMTE2LCJleHAiOjE2MTI0Mzg1MTZ9.sTB-WQoX-6EIx-J6n_u1lamHqJ8oypI5Fq3cVixuqXM'),
(56, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzYwNjMyLCJleHAiOjE2MTI0NDcwMzJ9.g8z6O73y50koA2aQm9N0aRjFsnsAQm9nXCduGFsEB70'),
(65, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjUsImVtYWlsIjoiYmFzYWppMTkwNkBhbGljZGguY29tIiwiaWF0IjoxNjEyMzc4NjQwLCJleHAiOjE2MTI0NjUwNDB9.tbSosnav38Woe34h9tyFca45DPq8l-MdWrEYNEozj3A'),
(67, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZGhpeW9yZWtzYTEyMDI5OEBnbWFpbC5jb20iLCJpYXQiOjE2MTIzODU0NTQsImV4cCI6MTYxMjQ3MTg1NH0.cgrmk4VAEBE_-n8gZfQi7pGpA4p5takn5UAvJyzbpKQ'),
(68, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZGhpeW9yZWtzYTEyMDI5OEBnbWFpbC5jb20iLCJpYXQiOjE2MTIzODU2NDUsImV4cCI6MTYxMjQ3MjA0NX0.AGY0jTXr_-zvOZ_4FyxcnILaST9MBnQSUrKw9cPDIwc'),
(69, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjcsImVtYWlsIjoiZGhpeW9yZWtzYTEyMDI5OEBnbWFpbC5jb20iLCJpYXQiOjE2MTIzOTAwODEsImV4cCI6MTYxMjQ3NjQ4MX0.ntqm0a-6G-DwSIQEQfDZP_uPhsO5DNsPecJH3z_NmiY'),
(71, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJhcmllZndpZGl5YXRtb2tvMzhAZ21haWwuY29tIiwiaWF0IjoxNjEyMzk4NzU4LCJleHAiOjE2MTI0ODUxNTh9.1gux_RwuubhUYlbSXxZC845C3zica_T6kYu7T-SY3-k');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notif`
--

CREATE TABLE `tb_notif` (
  `id` int(11) NOT NULL,
  `user1` int(11) NOT NULL,
  `user2` int(11) NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_notif`
--

INSERT INTO `tb_notif` (`id`, `user1`, `user2`, `notes`, `amount`, `type`) VALUES
(3, 4, 5, 'Untuk gacha', 1, 1),
(4, 5, 4, 'Untuk gacha', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_otp_activation`
--

CREATE TABLE `tb_otp_activation` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_otp_activation`
--

INSERT INTO `tb_otp_activation` (`id`, `email`, `otp`) VALUES
(4, 'anandamtq@gmail.com', '2pByS2'),
(5, 'anandamuhammadmtq@gmail.com', 'HCEPw9'),
(6, 'sebako9512@poetred.com', 'HpgOVl'),
(7, 'akbar.zul73@gmail.com', 'H053tW'),
(8, 'akbrzulfikar98@gmail.com', 'w9TbCq'),
(9, 'zwallet.arkademy@gmail.com', '5oy76c'),
(10, 'zordegispi@nedoz.com', 'QDNyG5'),
(12, 'dhiyodev7@gmail.com', '1pqKsU'),
(13, 'mabdipme@gmail.com', 'nafHYj'),
(15, 'anandamuhammad89@gmail.com', '5QNgq2'),
(16, 'handa260@gmail.com', 'B5k3sl'),
(17, 'handa@gmail.com', 'iP8l9l'),
(18, 'handa69@gmail.com', 'ipF5pb'),
(19, 'handa70@gmail.com', 'bSluu4'),
(20, 'handa71@gmail.com', '7scNfp'),
(21, 'handa80@gmail.com', '7Bcvgn'),
(22, 'handa90@gmail.com', 'EI6cqq'),
(24, 'fakhrighiffary@mail.com', 'HH2n5X');

-- --------------------------------------------------------

--
-- Table structure for table `tb_otp_reset`
--

CREATE TABLE `tb_otp_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_otp_reset`
--

INSERT INTO `tb_otp_reset` (`id`, `email`, `otp`) VALUES
(11, 'bronyazaychik96@gmail.com', '7kfUAL');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tranfer`
--

CREATE TABLE `tb_tranfer` (
  `id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tranfer`
--

INSERT INTO `tb_tranfer` (`id`, `sender`, `receiver`, `amount`, `notes`, `type`, `created_at`) VALUES
(1, 1, 2, 10000, 'Topup Balance', 2, '2021-02-01 03:28:02'),
(2, 2, 3, 2000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:30:49'),
(3, 2, 3, 2000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:30:49'),
(4, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:32:01'),
(5, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:32:01'),
(6, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:34:25'),
(7, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:34:25'),
(8, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:37:32'),
(9, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:37:32'),
(10, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:39:23'),
(11, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:39:23'),
(12, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:39:38'),
(13, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:39:38'),
(14, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:40:07'),
(15, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:40:07'),
(16, 2, 3, 5000, 'Pembayaran Spotify Premium', 1, '2021-02-01 10:48:10'),
(17, 2, 3, 5000, 'Pembayaran Spotify Premium', 2, '2021-02-01 10:48:10'),
(18, 2, 4, 5000, 'Sedekah', 1, '2021-02-01 11:37:59'),
(19, 2, 4, 5000, 'Sedekah', 2, '2021-02-01 11:37:59'),
(20, 1, 2, 1000000, 'Topup Balance', 2, '2021-02-01 04:41:29'),
(21, 1, 2, 1000000, 'Topup Balance', 2, '2021-02-01 05:02:21'),
(22, 1, 2, 13650, 'Topup Balance', 2, '2021-02-01 12:08:59'),
(23, 1, 5, 15000, 'Topup Balance', 2, '2021-02-01 15:47:15'),
(24, 5, 4, 5000, 'Sedekah', 1, '2021-02-01 15:52:47'),
(25, 5, 4, 5000, 'Sedekah', 2, '2021-02-01 15:52:47'),
(26, 5, 4, 500, 'Sedekah', 1, '2021-02-01 15:58:12'),
(27, 5, 4, 500, 'Sedekah', 2, '2021-02-01 15:58:12'),
(28, 4, 5, 5000, 'Bayar Hutang', 1, '2021-02-03 08:14:14'),
(29, 4, 5, 5000, 'Bayar Hutang', 2, '2021-02-03 08:14:14'),
(30, 4, 5, 500, 'Beli Permen', 1, '2021-02-03 08:15:21'),
(31, 4, 5, 500, 'Beli Permen', 2, '2021-02-03 08:15:21'),
(32, 4, 5, 500, 'Beli Permen', 1, '2021-02-03 10:10:01'),
(33, 4, 5, 500, 'Beli Permen', 2, '2021-02-03 10:10:01'),
(34, 4, 5, 500, 'Beli Permen', 1, '2021-02-03 10:12:42'),
(35, 4, 5, 500, 'Beli Permen', 2, '2021-02-03 10:12:42'),
(36, 4, 5, 1, 'Untuk gacha', 1, '2021-02-03 10:14:16'),
(37, 4, 5, 1, 'Untuk gacha', 2, '2021-02-03 10:14:16'),
(38, 4, 5, 500, 'hehe', 1, '2021-02-03 17:06:54'),
(39, 4, 5, 500, 'hehe', 2, '2021-02-03 17:06:54'),
(40, 4, 2, 499, 'Saya bayar hutang', 1, '2021-02-03 17:33:04'),
(41, 4, 2, 499, 'Saya bayar hutang', 2, '2021-02-03 17:33:04'),
(42, 1, 4, 13650, 'Topup Balance', 2, '2021-02-03 17:55:31.385'),
(43, 4, 2, 150, 'Coba', 1, '2021-02-03 22:47:23.225'),
(44, 4, 2, 150, 'Coba', 2, '2021-02-03 22:47:23.225'),
(45, 4, 5, 2000, 'bismillah notif', 1, '2021-02-03 22:50:58.180'),
(46, 4, 5, 2000, 'bismillah notif', 2, '2021-02-03 22:50:58.180'),
(47, 4, 5, 1000, 'ayo keluar notif', 1, '2021-02-03 22:53:34.680'),
(48, 4, 5, 1000, 'ayo keluar notif', 2, '2021-02-03 22:53:34.680'),
(49, 4, 2, 10, 'Test Socket', 1, '2021-02-03 23:20:56.825'),
(50, 4, 2, 10, 'Test Socket', 2, '2021-02-03 23:20:56.825'),
(51, 4, 2, 10, 'Test Socket', 1, '2021-02-03 23:22:47.891'),
(52, 4, 2, 10, 'Test Socket', 2, '2021-02-03 23:22:47.891'),
(53, 4, 2, 10, 'Test Socket', 1, '2021-02-03 23:24:44.890'),
(54, 4, 2, 10, 'Test Socket', 2, '2021-02-03 23:24:44.890'),
(55, 4, 2, 10, 'Test Socket', 1, '2021-02-03 23:28:11.215'),
(56, 4, 2, 10, 'Test Socket', 2, '2021-02-03 23:28:11.215'),
(57, 4, 2, 10, 'Test Socket', 1, '2021-02-03 23:28:32.800'),
(58, 4, 2, 10, 'Test Socket', 2, '2021-02-03 23:28:32.800'),
(59, 1, 4, 1365000, 'Topup Balance', 2, '2021-02-03 23:34:54.823'),
(60, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:12:21.050'),
(61, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:12:21.050'),
(62, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:14:34.383'),
(63, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:14:34.383'),
(64, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:16:31.282'),
(65, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:16:31.282'),
(66, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:17:45.297'),
(67, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:17:45.297'),
(68, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:18:43.582'),
(69, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:18:43.582'),
(70, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:20:15.626'),
(71, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:20:15.626'),
(72, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:20:52.551'),
(73, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:20:52.551'),
(74, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:22:16.692'),
(75, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:22:16.692'),
(76, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:22:58.081'),
(77, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:22:58.081'),
(78, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:23:43.721'),
(79, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:23:43.721'),
(80, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:25:10.344'),
(81, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:25:10.344'),
(82, 4, 2, 101, 'tes sikrt', 1, '2021-02-04 02:25:37.307'),
(83, 4, 2, 101, 'tes sikrt', 2, '2021-02-04 02:25:37.307'),
(84, 4, 2, 199, 'plis nongol', 1, '2021-02-04 02:26:51.137'),
(85, 4, 2, 199, 'plis nongol', 2, '2021-02-04 02:26:51.137'),
(86, 4, 2, 199, 'plis nongol', 1, '2021-02-04 02:30:46.903'),
(87, 4, 2, 199, 'plis nongol', 2, '2021-02-04 02:30:46.903'),
(88, 4, 2, 199, 'plis nongol', 1, '2021-02-04 02:32:32.240'),
(89, 4, 2, 199, 'plis nongol', 2, '2021-02-04 02:32:32.240'),
(90, 4, 5, 2000, 'Notif nongol ya..', 1, '2021-02-04 03:24:50.824'),
(91, 4, 5, 2000, 'Notif nongol ya..', 2, '2021-02-04 03:24:50.824'),
(92, 4, 5, 185, 'Sedekah', 1, '2021-02-04 03:35:35.695'),
(93, 4, 5, 185, 'Sedekah', 2, '2021-02-04 03:35:35.695'),
(94, 4, 5, 1000, 'Buat Jajan', 1, '2021-02-04 03:43:38.388'),
(95, 4, 5, 1000, 'Buat Jajan', 2, '2021-02-04 03:43:38.388'),
(96, 4, 5, 1000, 'Buat Jajan', 1, '2021-02-04 03:44:20.324'),
(97, 4, 5, 1000, 'Buat Jajan', 2, '2021-02-04 03:44:20.324'),
(98, 1, 4, 15000, 'Topup Balance', 2, '2021-02-04 03:46:55.433'),
(99, 4, 5, 1000, 'bisa navigate', 1, '2021-02-04 03:47:42.728'),
(100, 4, 5, 1000, 'bisa navigate', 2, '2021-02-04 03:47:42.728'),
(101, 1, 4, 2500, 'Topup Balance', 2, '2021-02-04 03:49:03.930'),
(102, 1, 4, 2500, 'Topup Balance', 2, '2021-02-04 03:50:14.988'),
(103, 1, 4, 2500, 'Topup Balance', 2, '2021-02-04 04:20:51.611'),
(104, 1, 27, 1000000, 'Topup Balance', 2, '2021-02-04 04:21:12.852'),
(105, 27, 2, 15000, 'Bayar pulsa', 1, '2021-02-04 04:26:16.765'),
(106, 27, 2, 15000, 'Bayar pulsa', 2, '2021-02-04 04:26:16.765'),
(107, 27, 4, 25000, 'Bayar Hutang Bos', 1, '2021-02-04 04:40:48.090'),
(108, 27, 4, 25000, 'Bayar Hutang Bos', 2, '2021-02-04 04:40:48.090'),
(109, 4, 27, 2000, 'Tf bos', 1, '2021-02-04 04:56:26.053'),
(110, 4, 27, 2000, 'Tf bos', 2, '2021-02-04 04:56:26.053'),
(111, 4, 27, 2000, 'Tf bos', 1, '2021-02-04 04:57:52.051'),
(112, 4, 27, 2000, 'Tf bos', 2, '2021-02-04 04:57:52.051'),
(113, 27, 2, 1000, 'cek heroku', 1, '2021-02-03 22:08:41.107'),
(114, 27, 2, 1000, 'cek heroku', 2, '2021-02-03 22:08:41.107'),
(115, 1, 27, 2500, 'Topup Balance', 2, '2021-02-03 22:10:53.445'),
(116, 4, 27, 2800, 'Bayar ISA', 1, '2021-02-04 00:31:24.110'),
(117, 4, 27, 2800, 'Bayar ISA', 2, '2021-02-04 00:31:24.110');

-- --------------------------------------------------------

--
-- Table structure for table `tb_type_transfer`
--

CREATE TABLE `tb_type_transfer` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_type_transfer`
--

INSERT INTO `tb_type_transfer` (`id`, `type`) VALUES
(1, 'out'),
(2, 'in');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL DEFAULT '',
  `pin` int(6) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '/images/default.jpg',
  `is_active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `firstname`, `lastname`, `email`, `password`, `phone`, `pin`, `image`, `is_active`) VALUES
(1, 'admin', 'Topup', 'Center', 'zwallet@admin.mail.com', 'no_password', '+628xxxxxxxxxx', 0, '/images/linkaja.png', 0),
(2, 'bronya96', 'Arief', 'Widiyatmoko', 'bronyazaychik96@gmail.com', '$2b$06$lE4Ipscqc9ySDlIHp4caPelU7NaCeOcxU6Wx63D0A60E3yWN6BQLq', '+6285755278932', 301296, '/images/img-1612352195893.jpg', 1),
(3, 'spotify', 'Spotify', 'Premium', 'admin@spotify.mail.com', 'no password', '+628xxxxxxxxxxxxx', 0, '/images/default.jpg', 0),
(4, 'arieff098', 'Seele', 'Vollerei', 'ariefwidiyatmoko38@gmail.com', '$2b$04$xNIh7b9idkuCP4Tb5.2x0etSQLjWWr.KOePffULMD9aL28aFxyjnK', '+6285755278832', 180820, '/images/img-1612354293642.jpg', 1),
(5, 'temp01', 'Robert', 'Akbar', 'vivori8898@200cai.com', '$2b$09$p3EQMPM11765BR4HN0fibONE6xFjG1z3V.VZOXZBXziQjyxXd4jXm', '+6285755278934', 696969, '/images/default.jpg', 1),
(6, 'handa26', '', '', 'anandamtq@gmail.com', '$2b$04$BceEboPt0wIAqk3YTN7F6ueLjyjaV3oFk5jmwi4/2zojnkum1hwEW', '', 0, '/images/default.jpg', 0),
(7, 'handa26', '', '', 'anandamuhammadmtq@gmail.com', '$2b$04$5RDhdmySopbmOVVHg/U6ouByDl.cwVxLhoSQEzH8ffET8eMoKLap6', '', 0, '/images/default.jpg', 0),
(8, 'akbarzul', '', '', 'sebako9512@poetred.com', '$2b$07$O84zosVD0B3dBMnBnWgUre4Wpe8rDkvNhYd2e3nTMI0CGQrxBXpvu', '', 0, '/images/default.jpg', 0),
(9, 'akbar', '', '', 'akbar.zul73@gmail.com', '$2b$07$EDwwQs9HhVhJiLS3EjW84uaGb403G91D2krAzBNWqKELI70fQXtqi', '', 0, '/images/default.jpg', 0),
(10, 'akbarzul', '', '', 'akbrzulfikar98@gmail.com', '$2b$07$IG45WOCZfwP976PDVSIhRu4gM9awcJIfGtUb5ZyQ3c9BsbSse7BO2', '', 0, '/images/default.jpg', 0),
(11, 'temp01', '', '', 'zwallet.arkademy@gmail.com', '$2b$04$wQcBw5zA2ddwybP9ATV25eKi1r4tZW3dgFniXok0wmPLjDo4WV8By', '', 0, '/images/default.jpg', 0),
(12, 'akbar', '', '', 'zordegispi@nedoz.com', '$2b$04$.v.usibW3exBPuHAQUFgQu5o4MXz123GvHgj8L2MhCei647jNZ86O', '', 0, '/images/default.jpg', 0),
(13, 'test', 'Akbar', 'Zulfikar', 'haemahe3@gmail.com', '$2b$04$J.FZRSgnBxyAJZ/row7I/.MMSaJdpuroA52uF3AOxDa3sp1MzsYty', '', 123456, '/images/default.jpg', 1),
(14, 'Dhiyo7', '', '', 'dhiyodev7@gmail.com', '$2b$08$IIyQwCMiyRZnKm1vImYYNe3pvnWKumlCaAwR0BCDNN7x7AWIDb9bi', '', 0, '/images/default.jpg', 0),
(15, 'Angga', '', '', 'mabdipme@gmail.com', '$2b$05$Vq..Xpb3SwXoyNPzoSWHYueUJXipASO1fLgKOZn1QFNGo5HQavWky', '', 0, '/images/default.jpg', 0),
(16, 'Angga', 'Abdi', 'Priyangga', 'abdipriyangga@gmail.com', '$2b$07$6wFMEZbUhzfI31I22e0LwOEdbTGgTNT.xjAAzdf4JrmxtVPFM1B7i', '', 123456, '/images/default.jpg', 1),
(17, 'Ananda Muhammad', '', '', 'anandamuhammad89@gmail.com', '$2b$04$3YuT2r2a4JWwmQ6ET4I8P.ujozw9nO8pg4tROWfJ0ggKwdp1D2cg2', '', 0, '/images/default.jpg', 0),
(18, 'Handa', '', '', 'handa260@gmail.com', '$2b$04$J3uuyihluA7hIE2z1E/4GeaVwtSe0K.aQrNkhOXqEag9H6ezTr/CC', '', 0, '/images/default.jpg', 0),
(19, 'Handa', '', '', 'handa@gmail.com', '$2b$09$i0.gaB7SR3AZ9VyFt5nBmOP47jD8IDTtGl0WX9DvDRXrOxkF4PXrG', '', 0, '/images/default.jpg', 0),
(20, 'Handa', '', '', 'handa69@gmail.com', '$2b$05$DVJGkj/yNGfF37tGQGD1G.e0xAs6PbftyDmzyb8Ingc11w4wEjosm', '', 0, '/images/default.jpg', 0),
(21, 'Handa', '', '', 'handa70@gmail.com', '$2b$09$/BE1sPY6VvbdGXjANPD9Cuirbiyj5e677/2BPAOxNzHeRaFJiuik6', '', 0, '/images/default.jpg', 0),
(22, 'Handa', '', '', 'handa71@gmail.com', '$2b$04$9jVz4V1GYTv7oXWs0g.dsOfLbp6NjSlSuHYMYq/Y4BvEFCLGKC4.W', '', 0, '/images/default.jpg', 0),
(23, 'Handa', '', '', 'handa80@gmail.com', '$2b$08$K2tPYX.IXXzv/mqCwK9ycOo3VGgOZXldmlHya2VUYicPvz3fz/i8G', '', 0, '/images/default.jpg', 0),
(24, 'Handa', '', '', 'handa90@gmail.com', '$2b$04$UdT2hJ8Avq/LB.TGvesmN.8V1lQaDvHseKXFXfhs1bqWT0wapS/7G', '', 0, '/images/default.jpg', 0),
(25, 'Handa', '', '', 'basaji1906@alicdh.com', '$2b$09$4uooIoDGVCag6NEnGoLWWOomjPOCsnqyuBVdYIL1gXblP5eUINyNy', '', 123456, '/images/default.jpg', 1),
(26, 'fakhri088', 'fakhri088', 'fakhri088', 'fakhrighiffary@mail.com', '$2b$04$fejR9IBW8u8otHFtuyAVhOPFXBEAFST8jdP5owFCJcV2JCHZ8AQKa', '', 0, '/images/default.jpg', 0),
(27, 'dhiyo007', 'dhiyo007', 'dhiyo007', 'dhiyoreksa120298@gmail.com', '$2b$06$OfLKtMLady8gGu40A/4kGuJfut.LeRbwQpRgqw/nlxS1NcdLaFfDK', '+6282327337007', 7007, '/images/default.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_balance`
--
ALTER TABLE `tb_balance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_login_token`
--
ALTER TABLE `tb_login_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_notif`
--
ALTER TABLE `tb_notif`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_otp_activation`
--
ALTER TABLE `tb_otp_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_otp_reset`
--
ALTER TABLE `tb_otp_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tranfer`
--
ALTER TABLE `tb_tranfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_tranfer_ibfk_1` (`sender`),
  ADD KEY `tb_tranfer_ibfk_2` (`receiver`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `tb_type_transfer`
--
ALTER TABLE `tb_type_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_balance`
--
ALTER TABLE `tb_balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_login_token`
--
ALTER TABLE `tb_login_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `tb_notif`
--
ALTER TABLE `tb_notif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_otp_activation`
--
ALTER TABLE `tb_otp_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tb_otp_reset`
--
ALTER TABLE `tb_otp_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_tranfer`
--
ALTER TABLE `tb_tranfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `tb_type_transfer`
--
ALTER TABLE `tb_type_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_balance`
--
ALTER TABLE `tb_balance`
  ADD CONSTRAINT `tb_balance_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`);

--
-- Constraints for table `tb_tranfer`
--
ALTER TABLE `tb_tranfer`
  ADD CONSTRAINT `tb_tranfer_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_tranfer_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `tb_user` (`id`),
  ADD CONSTRAINT `tb_tranfer_ibfk_3` FOREIGN KEY (`type`) REFERENCES `tb_type_transfer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
