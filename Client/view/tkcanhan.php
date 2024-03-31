<?php
if (is_array($taikhoan)) {
    extract($taikhoan);
}

if ($img) {
    $hinh = "../upload_file/" . $img;
} else {
    $hinh = "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
}


?>

<div class="container">
    <div class="breadcrumbs style2">
        <a href="index.php">Home</a> Tài khoản
    </div>
    <div class="row">
        <div class="main-content col-sm-12">
            <div class="row">
                <div class="col-sm-4">
                    <div class="product-detail-image style2">

                        <div class="main-image-wapper">
                            <img class="main-image" src="<?= $hinh ?>" alt="">
                        </div>

                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="product-details-right style2">
                        <h3 class="product-name">
                            Tên đăng nhập:
                            <?= $nguoidung ?>
                        </h3>
                        <br>
                        <h3 class="product-name">
                            Email:
                            <?= $email ?>
                        </h3>
                        <br>
                        <h3 class="product-name">
                            Số điện thoại:
                            <?= $sdt ?>
                        </h3>
                        <br>
                        <span class="product-name">
                            Địa chỉ:
                            <?= $diachi ?>
                        </span>
                        <br>
                        <a href="index.php?act=capnhattk"><input type="submit" style="margin-top:50px"
                                class="button button-add-cart" value="Cập nhật tài khoản"></a>
                        <a href="index.php?act=doimk"><input type="submit" style="margin-top:50px; margin-left: 10px;"
                                class="button button-add-cart" value="Đổi mật khẩu"></a>
                    </div>
                </div>
            </div>
        </div>



    </div>


    <div class="content-information">
        <div class="information">
            <h1>Lịch sử đặt hàng</h1>
        </div>
    </div>
    <div class="content">

        <div class="table">
            <table class="table-bordered" border="1">
                <tr>
                    <th class="text-center" style="padding: 10px; width: 10px;">STT</th>
                    <th class="text-center" style="padding: 10px; width: 150px;">Mã đơn hàng</th>
                    <th class="text-center" style="padding: 10px; width: 260px;">Tên sản phẩm</th>
                    <th class="text-center" style="padding: 10px; width: 250px;">Địa chỉ giao hàng</th>
                    <th class="text-center" style="padding: 10px; width: 200px;">Thời gian đặt hàng</th>
                    <th class="text-center" style="padding: 10px; width: 120px;">Giá tiền</th>
                    <th class="text-center" style="padding: 10px; width: 100px;">Số lượng</th>
                    <th class="text-center" style="padding: 10px; width: 130px;">Thành tiền</th>
                    <th class="text-center" style="padding: 10px; width: 200px;">Trạng thái</th>
                    <th class="text-center" style="padding: 10px; width: 150px;"></th>
                </tr>
                <?php
                // echo "<pre>";
                // print_r($giohang);
                // echo "<pre>";
                ?>

                <?php

                $tong_tien = 0;

                foreach ($donhang as $key => $value):
                    ?>

                    <tr>
                        <td class="text-center">
                            <?= $key + 1 ?>
                        </td>
                        <td style="padding: 10px;" class="text-center">
                            <?= $value['id_cart'] ?>
                        </td>
                        <td style="padding: 10px;" class="text-center 1">
                            <?php
                            foreach ($giohang as $gh) {

                                if ($value['id_cart'] === $gh['id']) {
                                    echo '- ', $gh['tensp'], '<br>';
                                }
                            }
                            ?>
                        </td>

                        <td style="padding: 10px;" class="text-center">
                            <?= $diachi ?>
                        </td>
                        <td style="padding: 10px;" class="text-center">
                            <?= $gh['thoigian_mua'] ?>
                        </td>
                        <td style="padding: 10px;" class="text-center">
                            <?= $gh['giasp'] ?> 
                        </td>
                        <td style="padding: 10px;" class="text-center">

                            <?= $value['cart_qty'] ?>
                        </td>
                        <td style="padding: 10px;" class="text-center">
                            <?= (int)$gh['giasp'] * $value['cart_qty'] ?>.000 ₫
                        </td>
                        <td style="padding: 10px;" class="text-center">
                            <?= $value['ten_trangthai'] ?>
                        </td>
                        <td style="padding: 10px;" class="text-center">

                           <a
                               <?php
                               $tong_tien += (int)$gh['giasp'] * $value['cart_qty'];
                              if ($value['id_trangthai'] > 3){
                                  echo 'style="display: none;"';
                              }
                               ?>
                                   href="index.php?act=huydonhang&id=<?=$value['id_cart'] ?>" name="huydonhang" onclick="return huyboDonHang()" style="padding-top:10px">Hủy đơn hàng</a>
                            <?php
                            if ($value['id_trangthai'] < 4){
                                echo '<hr>';
                            }
                            ?>
                            <a href="index.php?act=chitietdonhang&id=<?= $value['id_cart'] ?>" style="padding-top:10px">Chi tiết đơn hàng</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </table>
            <h3 style="margin: 15px 0px">Tổng số tiền:  <?= number_format($tong_tien, 3, ".", ".") ?>đ
            </h3>
        </div>
    </div>
</div>
<script>
function huyboDonHang() {
    if (confirm("Bạn có muốn hủy đơn hàng không ?")) {
        document.location = "index.php?act=tkcanhan";
        alert("Hủy đơn thành công");
    } else {
        return false;
    }
}
</script>



<?php include "menu/3hopcn.php" ?>
</div>