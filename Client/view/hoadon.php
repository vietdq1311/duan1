<?php
// echo "<pre>";
// print_r($donhang);
// echo "<pre>";
if (isset($donhang) && is_array($donhang)) {
    extract($donhang);
}
if (isset($_SESSION['user'])) {
    $nguoidung = $_SESSION['user']['nguoidung'];
    $diachi = $_SESSION['user']['diachi'];
    $email = $_SESSION['user']['email'];
    $sdt = $_SESSION['user']['sdt'];
} else {
    $name = "";
    $diachi = "";
    $email = "";
    $sdt = "";
}
?>
<main class="wrapper-bill">
    <h1 class="box_title" style="text-align: center;">Hoá đơn</h1>
    <div class="bills">
        <div class="bill-information">
            <h3 class="box_title text-center">Thông tin đơn hàng</h3>
            <div class="box-bill " style="min-height: 20px;">
                <p>Mã đơn hàng: N4 -
                    <?= $donhang['id'] ?>
                </p>
                <p>Phương thức thanh toán:
                    <?= $pt_thanhtoan === 0 ? "Thanh toán khi giao hàng" : "Chuyển khoản trực tiếp" ?>
                </p>
            </div>
            <h3 class="box_title text-center">Thông tin đặt hàng</h3>
            <div class="box-bill " style="min-height: 20px;">
                <p>Người dùng:
                    <?= $nguoidung ?>
                </p>
                <p>Địa chỉ:
                    <?= $diachi ?>
                </p>
                <p>Email:
                    <?= $email ?>
                </p>
                <p>Số điện thoại:
                    <?= $sdt ?>
                </p>
            </div>

        </div>
        <div class="bill-table">
            <h3 class="box_title text-center">Chi tiết đơn hàng</h3>
            <br>
            <table style="background-color: #fff;" border=" 1px">
                <tr>
                    <th width="200px" class="text-center">Ảnh</th>
                    <th width="250px" class="text-center">Tên sản phẩm</th>
                    <th width="150px" class="text-center">Đơn giá</th>
                    <th width="100px" class="text-center">Số lượng</th>

                </tr>
                <?php
                // echo"<pre>";
                // print_r($giohang);
                // echo"<pre>";
                
                foreach ($_SESSION['mycart'] as $value):
                    ?>
                    <tr>
                        <td style="padding: 10px;" class="text-center"><img  src="../upload_file/<?= $value[2] ?>" width="120px" />
                        </td>
                        <td style="padding: 10px" class="text-center">
                            <?= $value[1] ?>
                        </td>
                        <td style="padding: 10px" class="text-center">
                            <?= $value[3] ?>
                        </td>
                        <td style="padding: 10px" class="text-center">
                            <?= $value[4] ?>
                        </td>
                    </tr>
                <?php endforeach; ?>


            </table>
            <?php
            $tong = 0;
            foreach ($_SESSION['mycart'] as $value) {
                $tong += (int)$value[3] * $value[4];
            }
            echo "<h3 style='margin: 15px 0px'>Tổng số tiền: " . $tong . ".000 ₫</h3>";

            $_SESSION['mycart'] = [];
            ?>
        </div>
    </div>
</main>

<?php include 'menu/3hopcn.php'; ?>