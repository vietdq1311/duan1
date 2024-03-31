-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 03, 2024 lúc 12:38 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1_2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `noidung` varchar(255) NOT NULL,
  `id_nguoidung` int(11) NOT NULL,
  `id_sp` int(11) DEFAULT NULL,
  `ngaybinhluan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id`, `noidung`, `id_nguoidung`, `id_sp`, `ngaybinhluan`) VALUES
(47, 'Áo đẹp', 1, 50, '02/03/2024');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `id` int(11) NOT NULL,
  `tendm` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`id`, `tendm`, `img`) VALUES
(32, 'Quần âu', 'quanau3.avif'),
(33, 'Áo phông', 'aophong1.avif'),
(34, 'Quần bò', 'quanbo2.avif'),
(35, 'Quần đùi', 'quandui2.avif'),
(36, 'Áo gió', 'aogio1.avif'),
(38, 'Áo khoác', 'aokhoac1.png'),
(40, 'Sơ mi', 'somi1.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `nguoidung` varchar(255) NOT NULL,
  `sdt` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `thoigian_mua` varchar(255) DEFAULT NULL,
  `pt_thanhtoan` int(11) NOT NULL,
  `soluong` int(11) NOT NULL,
  `id_trangthai_donhang` int(11) NOT NULL DEFAULT 1,
  `id_taikhoan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `nguoidung`, `sdt`, `email`, `diachi`, `thoigian_mua`, `pt_thanhtoan`, `soluong`, `id_trangthai_donhang`, `id_taikhoan`) VALUES
(34, 'test', '0963588932', 'vietdq1311@gmail.com', 'Hà Nội', '21/02/2024', 0, 2, 1, 9),
(38, 'ok', '0912345678', 'ronaldo@gmail.com', 'Bồ - Đào - Nha', '21/02/2024', 0, 3, 4, 1),
(40, 'ok', '0912345678', 'ronaldo@gmail.com', 'Bồ - Đào - Nha', '2024-02-23 14:33:46', 0, 3, 7, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` int(11) NOT NULL,
  `id_tk` int(11) NOT NULL,
  `id_sp` int(11) NOT NULL,
  `tensp` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `giasp` varchar(255) NOT NULL,
  `soluong` int(11) NOT NULL,
  `id_donhang` int(11) NOT NULL,
  `id_trangthai_donhang` int(11) NOT NULL DEFAULT 1,
  `thoigian_mua` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giohang`
--

INSERT INTO `giohang` (`id`, `id_tk`, `id_sp`, `tensp`, `img`, `giasp`, `soluong`, `id_donhang`, `id_trangthai_donhang`, `thoigian_mua`) VALUES
(76, 1, 59, 'Quần Short Chino', 'quandui2.avif', '588.000', 1, 38, 1, '2024-03-03 06:33:52'),
(77, 1, 69, 'Miracle Air Quần Dài (AirSense Quần Dài) (Vải Lai Cotton)', 'quanau3.avif', '980.000', 1, 38, 1, '2024-03-03 06:33:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `name_role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id_role`, `name_role`) VALUES
(1, 'Admin'),
(2, 'Nhân viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `id` int(11) NOT NULL,
  `tensp` varchar(255) NOT NULL,
  `giasp` decimal(10,3) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `mota` text NOT NULL,
  `iddm` int(11) NOT NULL,
  `id_sptheomua` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL,
  `luotxem` int(11) DEFAULT NULL,
  `trangthai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`id`, `tensp`, `giasp`, `img`, `mota`, `iddm`, `id_sptheomua`, `soluong`, `luotxem`, `trangthai`) VALUES
(50, 'Sơ mi vải cotton linen cổ mở ngắn tay', 588.000, 'somi1.png', '- Được cập nhật với hàm lượng cotton cao hơn để có kết cấu mềm mại hơn mà không ảnh hưởng đến cảm giác mát mẻ của vải lanh.\r\n- Cổ mở giúp bạn linh hoạt tạo kiểu.\r\n- Thoải mái vừa vặn.', 40, 1, 1000, 51395, 0),
(51, 'Áo Sơ Mi Extra Fine Cotton Ngắn Tay', 588.000, 'somi2.png', '- Được làm từ 100% sợi cotton siêu dài.\r\n- Được giặt trước một lần nước để mang lại cảm giác mềm mại sang trọng và vẻ ngoài hoàn toàn giản dị.\r\n- Màu trơn đa năng.\r\n- Cổ áo cải tiến vẫn giữ nguyên hình dạng sau khi giặt.\r\n- Lớp lót được cải tiến giúp giảm nếp nhăn ở cổ áo, vạt áo và cổ tay áo sau khi giặt.\r\n- Đường cắt đều đặn, thoải mái theo xu hướng.\r\n- Cổ áo cài cúc đa năng.\r\n- Rộng rãi ở phần vai và phần cơ thể, với những đường cắt bóng mượt ở phần cánh tay và trước ngực.\r\n- Được thiết kế để cánh tay dễ dàng cử động, có viền dài hơn ở phía sau.\r\n- Đường chỉ khâu tạo thêm cảm giác giản dị.\r\n- Hoàn hảo để phối lớp bên ngoài áo phông.', 40, 1, 1000, 76578, 0),
(52, 'Áo Sơ Mi Vải Cotton Modal In Họa Tiết Cổ Mở Ngắn Tay', 588.000, 'somi3.png', '- Xử lý chống nhăn đặc biệt.\r\n- Vải pha cotton và rayon có cảm giác mịn màng và độ rủ vừa phải.\r\n- Kiểu dáng thoải mái với phần vai hơi rũ nhẹ.\r\n- Kiểu dáng rộng rãi giúp bạn có thể mặc như một lớp layer bên ngoài hoặc chiếc áo thông thường.\r\n- Họa tiết trừu tượng với hình in năng động.', 40, 1, 1000, 86788, 0),
(53, 'Áo Khoác Giả Lông Cừu Kéo Khóa Dài Tay', 685.000, 'aokhoac1.png', '- Lông cừu nhẹ, ấm.\r\n- Được làm bằng lông cừu với độ dày vừa đủ, ấm áp.\r\n- Có thể giặt bằng máy giúp bạn dễ chăm sóc.\r\n- Tay áo cài sẵn mang lại vẻ ngoài gọn gàng.\r\n- Chốt dễ dàng thao tác khi đeo găng tay.\r\n- Cổ áo cao và ngăn cản gió lạnh ở viền và cổ tay áo giúp bạn giữ ấm.\r\n- Thiết kế màu khối.\r\n- Chúng tôi hướng đến góp phần giảm thiểu chất thải và tiêu thụ dầu. Trang phục được làm bằng chất liệu polyester tái chế là một phần của nỗ lực này.\r\nTỷ lệ chất liệu polyester tái chế được sử dụng là khác nhau tùy theo từng sản phẩm. Vui lòng kiểm tra thông tin tại phần \"Chất Liệu\" để biết thêm chi tiết.', 38, 4, 1000, 52424, 0),
(54, 'Ultra Light Down Áo Khoác Siêu Nhẹ (3D Cut)', 1.471, 'aokhoac2.avif', '- Vải taffeta xoắn mềm mại làm từ nylon nhẹ.\r\n- Lớp lót chống tĩnh điện.\r\n- Lớp phủ bền, không thấm nước.\r\n-750+ Fill Power * theo phương pháp đo lường IDFB\r\n-Trọng lượng siêu nhẹ.\r\n-Thiết kế có thể tháo rời. Bao gồm túi đựng riêng.\r\n- Thiết kế vừa vặn thoải mái để tạo kiểu đơn giản.\r\n- Kiểu dáng thời trang với lớp lót màu ton-sur-ton.\r\n- Túi áo có dây kéo và dễ sử dụng.\r\n- Khóa kéo phía trước để giữ ấm.\r\n- Đường cắt 3D giúp chuyển động ở phần vai dễ dàng, thiết kế tay áo raglan tạo vẻ ngoài đẹp mắt.\r\n- Lớp lót trên cổ áo phía trong tạo cảm giác mềm mại.\r\n- Một lớp áo khoác nhẹ và ấm áp để tạo kiểu hàng ngày.\r\n- Được cập nhật với thiết kế vừa vặn thoải mái làm cho sản phẩm có thể kết hợp với nhiều lớp áo hoặc là áo khoác ngoài.', 38, 4, 1000, 52331, 0),
(55, 'Áo Khoác Giả Lông Cừu Kéo Khóa Dài Tay', 686.000, 'aokhoac3.avif', '- Chất len nhẹ, ấm.\r\n- Được làm bằng lông cừu dày, ấm cúng.\r\n- Có thể giặt bằng máy, dễ chăm sóc.\r\n- Các mấu kéo dễ vận hành khi đeo găng tay.\r\n- Cổ áo cao và ống chống gió ở gấu áo và cổ tay áo giúp giữ ấm cho bạn.\r\n- Chúng tôi hướng đến góp phần giảm thiểu chất thải và tiêu thụ dầu. Trang phục được làm bằng chất liệu polyester tái chế là một phần của nỗ lực này.\r\nTỷ lệ chất liệu polyester tái chế được sử dụng là khác nhau tùy theo từng sản phẩm. Vui lòng kiểm tra thông tin tại phần \"Chất Liệu\" để biết thêm chi tiết.', 38, 4, 1000, 9807, 0),
(56, 'Áo Parka Chống UV Bỏ Túi (Dáng 3D) (Chống Nắng)', 980.000, 'aogio1.avif', '- Chất vải sắc nét, kết cấu phù hợp với phong cách giản dị.\r\n- Bảo vệ bạn khỏi tia UV (UPF40) ngăn chặn các tia nắng có hại.\r\n- Lớp hoàn thiện bề mặt chống thấm nước. *Vải được phủ một chất chống thấm nước nên hiệu quả kéo dài lâu hơn. Tuy nhiên bề mặt này không chống thấm vĩnh viễn.\r\n- Thiết kế có thể bỏ túi.\r\n- Đường cắt 3D hình hộp vừa vặn thoải mái ở thân, vai và tay áo.\r\n- Túi đựng được gắn vào một vòng ở mặt trong bên trái.\r\n- Hoàn hảo cho trang phục thường ngày và các hoạt động ngoài trời nhẹ nhàng như cắm trại. * Sản phẩm không chống cháy hoặc chống lửa. Hãy thận trọng nếu có ngọn lửa gần đó.\r\n- Chúng tôi hướng đến góp phần giảm thiểu chất thải và tiêu thụ dầu. Trang phục được làm bằng chất liệu nylon tái chế là một phần của nỗ lực này.\r\nTỷ lệ chất liệu tái chế được sử dụng là khác nhau tùy theo từng sản phẩm. Vui lòng kiểm tra thông tin tại phần \"Chất Liệu\" để biết thêm chi tiết.', 36, 3, 1000, 54232, 0),
(57, 'Áo Parka Chống UV Bỏ Túi (3D Cut) (Chống Nắng)', 980.000, 'aogio2.avif', '- Chất liệu vải thô, đẹp mắt.\r\n- Công nghệ chống tia cực tím.\r\n- Thiết kế có thể bỏ túi.\r\n- Áo chống thấm nước bền bỉ. * Vải được phủ một chất chống thấm nước nên hiệu quả kéo dài lâu hơn. Nhưng không phải là vĩnh viễn.\r\n- Đường cắt 3D ở thân áo, vai và tay áo tạo form dáng hình hộp, thoải mái rõ rệt.\r\n- Túi được gắn vào một vòng ở mặt trong bên trái.\r\n- Hoàn hảo cho các hoạt động ngoài trời hoặc phong cách giản dị với phong cách ngoài trời. *Sản phẩm không có tính năng chống cháy hoặc chống cháy. Thận trọng khi ở gần ngọn lửa.\r\n- Chúng tôi hướng đến góp phần giảm thiểu chất thải và tiêu thụ dầu. Trang phục được làm bằng chất liệu nylon tái chế là một phần của nỗ lực này.\r\nTỷ lệ chất liệu tái chế được sử dụng là khác nhau tùy theo từng sản phẩm. Vui lòng kiểm tra thông tin tại phần \"Chất Liệu\" để biết thêm chi tiết.', 36, 3, 1000, 76573, 0),
(58, 'Quần Shorts Co Giãn Dáng Slim Fit', 588.000, 'quandui1.avif', '- Chất liệu vải cotton twill co giãn với kết cấu mềm mại và vẻ ngoài thanh lịch.\r\n- Ôm vừa vặn với đường khâu mảnh.\r\n- Eo co giãn thoải mái.', 35, 2, 1000, 63453, 0),
(59, 'Quần Short Chino', 588.000, 'quandui2.avif', '- Cải tiến chiếc quần chino cho trang phục thường ngày của bạn.\r\n- Vải twill đích thực với trọng lượng nặng hơn.\r\n- Kiểu dáng đẹp mắt, sắc nét nhưng không làm mất đi tính cổ điển vốn có.\r\n-Thiết kế tỉ mỉ với đường may ở phần eo, thắt lưng dày dặn, có túi nhỏ đựng tiền xu và dây rút.', 35, 2, 1000, 54321, 0),
(60, 'Quần Short Dry Siêu Co Giãn', 391.000, 'quandui3.avif', '- Chất vải thun co giãn, thoải mái.\r\n- Được giặt qua một lần nước để mang lại cảm giác mềm mại, giản dị.\r\n- Với công nghệ DRY khô nhanh.\r\n- Thiết kế mở phía trước có khóa kéo.\r\n- Cạp quần co giãn có dây rút điều chỉnh kích thước.\r\n- Thiết kế đa năng thích hợp mặc trong nhà hoặc dạo phố.', 35, 2, 1000, 75644, 0),
(61, 'Quần Jeans Siêu Co Giãn', 980.000, 'quanbo1.avif', '- Quần jean co giãn nhất từ trước đến nay của UNIQLO, được làm bằng vải siêu co giãn.\r\n- Skinny fit với phần côn đến mắt cá chân.\r\n- Túi sau cao giúp tôn dáng đôi chân.\r\n- Nút phẳng, mờ.\r\n- Màu sắc đường may tinh tế, nhẹ nhàng.\r\n- Lớp hoàn thiện nguyên bản, đích thực được tạo ra tại Trung tâm Đổi mới Quần jean của chúng tôi.\r\n- Các đường may bên hông được làm bằng sợi mềm tạo cảm giác ôm sát vào da.\r\n- Ôm sát nhưng vẫn thoải mái, không gò bó.\r\n- Độ dày sợi dọc, số lượng sợi và quá trình xử lý đã được lựa chọn cẩn thận để có độ hoàn thiện chân thực.', 34, 3, 1000, 53451, 0),
(62, 'Quần Jeans Siêu Co Giãn', 980.000, 'quanbo2.avif', '- Chất liệu vải Siêu Co Giãn với khả năng co giãn và đàn hồi đáng kinh ngạc.\r\n- Độ co giãn tuyệt vời đảm bảo quần skinny vừa vặn thoải mái, không bó sát xuống mắt cá chân.\r\n- Vị trí túi sau cao tạo hiệu ứng tôn dáng cho đôi chân.\r\n- Độ dày của đường chỉ dọc, số lượng chỉ và quá trình xử lý đã được lựa chọn cẩn thận để có lớp hoàn thiện đẹp mắt nhất.\r\n- Các nút có kết cấu mờ và đường chỉ khâu có tông màu dịu mang lại ấn tượng tinh tế.\r\n- Đường may bên hông bằng chỉ mềm tạo cảm giác tuyệt vời cho da.\r\n- Công nghệ BLUE CYCLE JEANS giúp giảm lượng nước* sử dụng trong quá trình sản xuất. Mức độ tiết kiệm nước sẽ có sự chênh lệch giữa các sản phẩm.\r\n\r\n*Lên đến 99%. Dữ liệu dựa trên sự so sánh giữa Quần Jeans Nam Regular Fit năm 2017 và năm 2018 với công nghệ do Trung Tâm Cải Tiến Quần Jeans của UNIQLO phát triển vào năm 2018.', 34, 3, 1000, 87686, 0),
(63, 'EZY Quần Jean Siêu Co Giãn', 980.000, 'quanbo3.avif', '- Chất liệu denim cổ điển với thiêt kế bên ngoài có lớp lót nhung thoải mái như quần thể thao.\r\n- Chất vải siêu co dãn.\r\n- Kiểu dáng ống ôm dần thon gọn cho kiểu dáng đẹp mắt.\r\n- Thắt lưng có gân và dây rút giúp vừa vặn thoải mái.\r\n- Công nghệ laser tiên tiến và quy trình giặt trước tạo nên vẻ ngoài cổ điển.\r\n- Màu sắc đường khâu, nút cài phía trước và đinh tán tinh tế.\r\n- Các nút và đinh tán được thiết kế để giảm thiểu tiếp xúc với da.\r\n- Dây rút có thể tháo rời để vừa vặn thoải mái mà không cần thắt lưng.', 34, 3, 1000, 42142, 0),
(64, 'AIRism Cotton Áo Thun Dáng Rộng Kẻ Sọc Cổ Tròn', 391.000, 'aophong1.avif', 'Bộ sưu tập Uniqlo U là sự hiện thực hóa của một nhóm các nhà thiết kế quốc tế tận tâm và lành nghề có trụ sở tại Trung tâm Nghiên cứu và Phát triển Paris do Giám đốc Nghệ thuật Christophe Lemaire chỉ đạo.\r\n\r\n- Thiết kế cổ thuyền hẹp mang đến phong cách bóng bẩy.\r\n- Tay áo thiết kế lỡ.\r\n- Rộng vừa vặn với phần vai suông thẳng.\r\n- Cấu trúc hai mặt của chất liệu, vai suông thẳng và độ rộng vừa vặn tạo nên kiểu dáng đẹp mắt.\r\n- Tạo điểm nhấn với họa tiết kẻ sọc bản nhỏ đầy phong cách.\r\n- Rất phù hợp khi kết hợp với quần short hoặc đi cùng với quần ống rộng.', 33, 1, 1000, 87851, 0),
(65, 'Áo Thun Vải Slub Cotton Cổ Tròn Ngắn Tay (Họa Tiết Kẻ Sọc)', 391.000, 'aophong2.avif', '-100% cotton fabric made with textured slub yarn.\r\n- Garment washed for a perfectly casual style.\r\n- Versatile regular fit.\r\n- Simple striped design is easy to mix and match.', 33, 1, 1000, 43241, 0),
(66, 'Áo Thun Supima Cotton Cổ Tròn Ngắn Tay', 391.000, 'aophong3.avif', '- 100% cotton SUPIMA® cao cấp, mịn màng.\r\n- Thiết kế cơ bản phù hợp tạo kiểu với nhiều phong cách khác nhau từ đơn giản đến layer.\r\n- Được thiết kế tỉ mỉ đến từng chi tiết, từ chiều rộng cổ áo đến đường may.', 33, 1, 1000, 54353, 0),
(67, 'Miracle Air Quần Dài Dáng Relax (AirSense Quần Dài Dáng Relaxed) (Vải Lai Cotton)', 980.000, 'quanau1.avif', '- Chiếc quần hiệu suất cao này nhẹ, co giãn và nhanh khô nhờ chất liệu vải độc đáo do Toray và UNIQLO cùng phát triển.\r\n- Chống nhăn, dễ chăm sóc. * Định hình sau khi giặt.\r\n- Vải thoáng khí bên trong túi và lót eo.\r\n- Kết hợp kiểu dáng đẹp và phần eo co giãn thoải mái.', 32, 3, 1000, 76511, 0),
(68, 'Miracle Air Quần Dài Dáng Relax (AirSense Quần Dài Dáng Relaxed) (Vải Sọc Nhăn)', 980.000, 'quanau2.avif', '- These high-performance pants are lightweight, stretchy, and quick-drying, thanks to the unique fabric jointly developed by Toray and UNIQLO.\r\n- Wrinkle-resistant for easy care. *Shape to dry after washing.\r\n- Breathable fabric inside the pockets and waist lining.\r\n- Comfortable elastic waistband.\r\n- Relaxed cut suitable for casual wear.\r\n- Versatile design for sports, business, and everyday wear.', 32, 3, 1000, 65461, 0),
(69, 'Miracle Air Quần Dài (AirSense Quần Dài) (Vải Lai Cotton)', 980.000, 'quanau3.avif', '- Chất liệu vải nhẹ, co giãn, hút ẩm và nhanh khô được đồng phát triển với Toray.\r\n- Chống nhăn, dễ chăm sóc. * Định hình sản phẩm sau khi giặt.\r\n- Vải thoáng khí bên trong túi và lót eo.\r\n- Quần đa năng để mặc hàng ngày, từ công sở đến sân golf.', 32, 3, 1000, 9782, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sptheomua`
--

CREATE TABLE `sptheomua` (
  `id_mua` int(11) NOT NULL,
  `ten_mua` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sptheomua`
--

INSERT INTO `sptheomua` (`id_mua`, `ten_mua`) VALUES
(1, 'Xuân'),
(2, 'Hạ'),
(3, ' Thu'),
(4, 'Đông');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id` int(11) NOT NULL,
  `nguoidung` varchar(100) NOT NULL,
  `matkhau` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) NOT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `id_role` int(11) NOT NULL DEFAULT 3 COMMENT '1- Admin\r\n2-Nhân viên,\r\n3-Khách hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`id`, `nguoidung`, `matkhau`, `email`, `img`, `diachi`, `sdt`, `id_role`) VALUES
(1, 'ok  ', '11111111', 'ronaldo@gmail.com', 'ronaldo_7.jpg', 'Bồ - Đào - Nha', '0912345678', 1),
(9, 'khachhang', '11111111', 'vietdq1311@gmail.com', '', 'Hà Nội', '0963588932', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangthai_donhang`
--

CREATE TABLE `trangthai_donhang` (
  `id_trangthai` int(11) NOT NULL,
  `ten_trangthai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `trangthai_donhang`
--

INSERT INTO `trangthai_donhang` (`id_trangthai`, `ten_trangthai`) VALUES
(1, 'Chờ xác nhận'),
(2, 'Đã xác nhận'),
(3, 'Đang xử lý'),
(4, 'Đang vận chuyển'),
(5, 'Giao hàng thành công'),
(6, 'Đã thanh toán'),
(7, 'Đã hủy');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_binhluan_sanpham` (`id_sp`),
  ADD KEY `lk_binhluan_taikhoan` (`id_nguoidung`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_donhang_trangthai_donhang` (`id_trangthai_donhang`);

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_trangthai_donhang` (`id_trangthai_donhang`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_sanpham_danhmuc` (`iddm`),
  ADD KEY `lk_sanpham_sptheomua` (`id_sptheomua`);

--
-- Chỉ mục cho bảng `sptheomua`
--
ALTER TABLE `sptheomua`
  ADD PRIMARY KEY (`id_mua`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lk_taikhoan_role` (`id_role`);

--
-- Chỉ mục cho bảng `trangthai_donhang`
--
ALTER TABLE `trangthai_donhang`
  ADD PRIMARY KEY (`id_trangthai`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `giohang`
--
ALTER TABLE `giohang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `sptheomua`
--
ALTER TABLE `sptheomua`
  MODIFY `id_mua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `trangthai_donhang`
--
ALTER TABLE `trangthai_donhang`
  MODIFY `id_trangthai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `lk_binhluan_sanpham` FOREIGN KEY (`id_sp`) REFERENCES `sanpham` (`id`),
  ADD CONSTRAINT `lk_binhluan_taikhoan` FOREIGN KEY (`id_nguoidung`) REFERENCES `taikhoan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `lk_donhang_trangthai_donhang` FOREIGN KEY (`id_trangthai_donhang`) REFERENCES `trangthai_donhang` (`id_trangthai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD CONSTRAINT `fk_id_trangthai_donhang` FOREIGN KEY (`id_trangthai_donhang`) REFERENCES `trangthai_donhang` (`id_trangthai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `lk_sanpham_danhmuc` FOREIGN KEY (`iddm`) REFERENCES `danhmuc` (`id`),
  ADD CONSTRAINT `lk_sanpham_sptheomua` FOREIGN KEY (`id_sptheomua`) REFERENCES `sptheomua` (`id_mua`);

--
-- Các ràng buộc cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `lk_taikhoan_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
