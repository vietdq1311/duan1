<?php

session_start();
ob_start();
include("../model/pdo.php");
include("../model/taikhoan.php");
include("../model/binhluan.php");
include("../model/danhmuc.php");
include("../model/sanpham.php");
include("../model/sptheomua.php");
include("../model/giohang.php");
include("../model/donhang.php");
include("global.php");

include("header.php");

if (!isset($_SESSION['mycart'])) {
    $_SESSION['mycart'] = [];
}

if (isset($_GET['act']) && $_GET['act'] != "") {
    $act = $_GET['act'];
    switch ($act) {

        case "dangky":

            include "view/taikhoan/dangky.php";
            break;

        case 'dangnhap':

            include "dangnhap.php";
            break;

        case 'tkcanhan':
            $donhang = loadone_donhang_user($_SESSION['user']['id']);
            $giohang = load_cart_user();
            $taikhoan = loadone_taikhoan($id);
            include('view/tkcanhan.php');
            break;
        case "capnhattk":

            if (isset($_POST['capnhattk'])) {
                $id = $_POST['id'];
                $email = $_POST['email'];
                $diachi = $_POST['diachi'];
                $sdt = $_POST['sdt'];

                $img = $_FILES['img']['name'];
                $target_dir = "../upload_file/";
                $target_file = $target_dir . basename($_FILES["img"]["name"]);
                if (move_uploaded_file($_FILES["img"]["tmp_name"], $target_file)) {
                    //echo "Load ảnh thành công";
                } else {
                    //echo "Upload ảnh không thành công";
                }
                update_taikhoan_user($id, $email, $img, $diachi, $sdt);
                // $thongbao = "Cập nhật thành công";
                header("Location:index.php?act=tkcanhan");

            }
            $taikhoan = loadone_taikhoan($id);
            include "view/capnhattk.php";
            break;

        case "doimk":
            if (isset($_POST['doimk'])) {
                $id = $_POST['id'];
                $matkhau = $_POST['matkhau'];
                update_matkhau($id, $matkhau);
                header("Location:index.php?act=tkcanhan");

            }
            $taikhoan = loadone_taikhoan($id);
            include "view/doimk.php";
            break;

        case "chitietdonhang":
            if (isset($_GET['id']) && $_GET['id']) {
                $giohang = load_cart_byId($_GET['id']);
            }
            include "view/ct_donhang.php";
            break;

        case "huydonhang":
            if (isset($_GET['id']) && $_GET['id']) {
                huydonhang($_GET['id']);
                header("Location: index.php?act=tkcanhan");
            }
            $donhang = loadone_donhang_user($_SESSION['user']['id']);
            $giohang = load_cart_user();
            $taikhoan = loadone_taikhoan($id);
            include "view/tkcanhan.php";
            break;

        case "sanpham":
            if (isset($_POST['kyw']) && $_POST['kyw'] != "") {
                $kyw = $_POST['kyw'];
            } else {
                $kyw = "";
            }
            if (isset($_GET['iddm']) && ($_GET['iddm'] > 0)) {
                $iddm = $_GET['iddm'];
            } else {
                $iddm = 0;
            }
            $listsanpham = loadall_sanpham($kyw, $iddm);
            $listdanhmuc = loadall_danhmuc();
            include("view/sanpham.php");
            break;

        case "chitietsp":
            if (isset($_POST['addtocart']) && ($_POST['addtocart'])) {
                $id = $_POST['id'];
                $tensp = $_POST['tensp'];
                $img = $_POST['img'];
                $giasp = $_POST['giasp'];
                $soluong = $_POST['soluong'];
                $thanhtien = ((int)$soluong * (int)$giasp);
                $sanphamadd = [$id, $tensp, $img, $giasp, $soluong, $thanhtien];

                if (isset($_SESSION['mycart'])) {
                    $cartItems = $_SESSION['mycart'];
                    $existingItemKey = null;
                    foreach ($cartItems as $key => $item) {
                        if ($item[0] == $id) {
                            $existingItemKey = $key;
                            break;
                        }
                    }
                }
                if ($existingItemKey !== null) {
                    $cartItems[$existingItemKey][5] += $thanhtien;
                    $cartItems[$existingItemKey][4]++;
                } else {

                    array_push($cartItems, $sanphamadd);
                }
                $_SESSION['mycart'] = $cartItems;
            }

            if (isset($_GET['id']) && $_GET['id'] > 0) {
                $sanpham = loadone_sanpham($_GET['id']);
            }
            $sanphamtop6 = load_sanpham_top6();
            include("view/chitietsp.php");
            break;

        case "timkiemdm":
            if (isset($_GET['iddm']) && ($_GET['iddm']) > 0) {
                $iddm = $_GET['iddm'];
                $danhmuc = loadone_danhmuc($_GET['iddm']);
            } else {
                $iddm = 0;
            }
            $listsanpham = loadall_sanpham("", $iddm);
            include "view/timkiemdm.php";
            break;

        case "sptheomua":
            if (isset($_GET['id_sptheomua']) && ($_GET['id_sptheomua']) > 0) {
                $id_sptheomua = $_GET['id_sptheomua'];
                $sptheomua = loadone_sptheomua($_GET['id_sptheomua']);
            } else {
                $id_sptheomua = 0;
            }
            $listsptheomua = loadall_sptheomua();
            $listsp_theomua = loadall_sp_theomua("", $id_sptheomua);
            include "view/sphamtheomua.php";
            break;

        case "lienhe":
            include("view/menu/lienhe.php");
            break;

        case "about":
            include("view/menu/about.php");
            break;


        case 'addgiohang':
            if (isset($_POST['addtocart']) && ($_POST['addtocart'])) {
                $id = $_POST['id'];
                $tensp = $_POST['tensp'];
                $img = $_POST['img'];
                $giasp = $_POST['giasp'];
                $soluong = $_POST['soluong'];
                $thanhtien = ((int)$soluong * (int)$giasp);
                $sanphamadd = [$id, $tensp, $img, $giasp, $soluong, $thanhtien];
                if (isset($_SESSION['mycart'])) {
                    $cartItems = $_SESSION['mycart'];
                    $existingItemKey = null;
                    foreach ($cartItems as $key => $item) {
                        if ($item[0] == $id) {
                            $existingItemKey = $key;
                            break;
                        }
                    }
                }
                if ($existingItemKey !== null) {
                    $cartItems[$existingItemKey][5] += $thanhtien;
                    $cartItems[$existingItemKey][4]++;
                } else {
                    array_push($cartItems, $sanphamadd);
                }
                $_SESSION['mycart'] = $cartItems;
            }

            if (isset($_POST['tangsoluong']) && $_POST['tangsoluong']) {
                $id = $_POST['id'];
                $cartItems = $_SESSION['mycart'];

                // Tìm kiếm sản phẩm trong giỏ hàng
                foreach ($cartItems as $key => $item) {
                    if ($item[0] == $id) {
                        // Tăng số lượng và giá tiền của sản phẩm
                        $cartItems[$key][4]++;
                        $cartItems[$key][5] += (int)$item[3];
                        break;
                    }
                }
                //Lưu giỏ hàng SESSION
                $_SESSION['mycart'] = $cartItems;
            }

            if (isset($_POST['giamsoluong']) && $_POST['giamsoluong']) {
                $id = $_POST['id'];
                $cartItems = $_SESSION['mycart'];

                // Tìm kiếm sản phẩm trong giỏ hàng
                foreach ($cartItems as $key => $item) {
                    if ($item[0] == $id) {
                        // Giảm số lượng và giá tiền của sản phẩm
                        if ($item[4] > 1) {
                            $cartItems[$key][4]--;
                            $cartItems[$key][5] -= (int)$item[3];
                            break;
                        }
                    }
                }
                //Lưu giỏ hàng SESSION
                $_SESSION['mycart'] = $cartItems;

            }
            $sanphamtop6 = load_sanpham_top6();
            include('view/menu/giohang.php');
            break;

        case "thanhtoan":
            if (isset($_SESSION["user"]) === [] || !isset($_SESSION['user'])) {
                header("Location: index.php?act=dangnhap");
                die;
            }

            $donhang = null;
            $giohang = null;


            if (isset($_POST['dongythanhtoan']) && ($_POST['dongythanhtoan'])) {
                $nguoidung = $_POST['nguoidung'];
                $id = $_POST['id'];
                $diachi = $_POST['diachi'];
                $sdt = $_POST['sdt'];
                $email = $_POST['email'];
                date_default_timezone_set('Asia/Ho_Chi_Minh');
                $thoigian_mua = date('Y-m-d H:i:s'); // Lấy thời gian hiện tại

                $pt_thanhtoan = $_POST['pt_thanhtoan'];
                $data = loadone_donhang_by_id_khachang($id);

                if ($_SESSION['user']['id'] == $id && $data ) {
                    update_donhang_qty(count($_SESSION['mycart']) +1 , $id);

                    $id_dathang = $data['id'];
                } else {
                    $id_dathang = insert_donhang($nguoidung, $sdt, $email, $diachi, $thoigian_mua, $pt_thanhtoan, count($_SESSION['mycart']), $_SESSION['user']['id']);
                }

                $donhang = loadone_donhang($id_dathang);
                $giohang = load_cart($id_dathang);

                foreach ($_SESSION['mycart'] as $cart) {
                    insert_giohang($_SESSION['user']['id'], $cart[0], $cart[1], $cart[2], $cart[3], $cart[4], $id_dathang,$thoigian_mua);
                }


                header("Location: index.php?act=hoadon");
            }
            $donhang = load_hoadon_user($_SESSION['user']['id']);
            $giohang = load_cart($_SESSION['user']['id']);
            $sanphamtop5 = loadall_sanpham_top5();
            include("view/thanhtoan.php");
            break;

        case "hoadon":

            if (!isset($_SESSION["user"])) {
                header("Location: index.php");
            }

            $donhang = loadonedonang();
            include "view/hoadon.php";
            break;

        case "deletecart":
            if (isset($_GET['id'])) {
                array_splice($_SESSION['mycart'], $_GET['id'], 1);
            } else {
                $_SESSION['mycart'] = [];
            }
            header("Location: index.php?act=addgiohang");
            break;

        default:
            if (isset($_POST['listok']) && ($_POST['listok'])) {
                $kyw = $_POST['kyw'];
                $iddm = $_POST['iddm'];
            } else {
                $kyw = "";
                $iddm = 0;
            };
            $listsptheomua = loadall_sptheomua();
            $listdanhmuc = loadall_danhmuc();
            $listsanpham = loadall_sanpham($kyw, $iddm);
            include("home.php");
            break;

    }
} else {
    if (isset($_POST['listok']) && ($_POST['listok'])) {
        $kyw = $_POST['kyw'];
        $iddm = $_POST['iddm'];
    } else {
        $kyw = "";
        $iddm = 0;
    };
    $sanphamShop = loadall_shop();
    $sanphamtop5 = loadall_sanpham_top10();
    $listdanhmuc = loadall_danhmuc();
    $listsptheomua = loadall_sptheomua();
    $listsanpham = loadall_sanpham($kyw, $iddm);

    include("home.php");
}

include("footer.php");
ob_end_flush();
?>