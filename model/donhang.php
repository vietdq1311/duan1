<?php

function insert_donhang($nguoidung, $sdt, $email, $diachi, $thoigian_mua, $pt_thanhtoan, $soluong, $id_taikhoan)
{
    $sql = "insert into donhang values (null,'$nguoidung' ,'$sdt','$email','$diachi','$thoigian_mua','$pt_thanhtoan','$soluong',1, '$id_taikhoan')";
//   echo $sql;
//   die();
    return pdo_execute_return_lastInsertId($sql);
}


function delete_donhang($id)
{
    $sql = "delete from donhang where id=" . $id;
    pdo_execute($sql);
}

function loadall_trangthai()
{
    $sql = "select * from trangthai_donhang ";
    $listtrangthai = pdo_query($sql);
    return $listtrangthai;
}

function loadone_donhang_user($id)
{
    $sql = "SELECT 
                donhang.id, 
                donhang.nguoidung, 
                donhang.diachi,
                donhang.sdt, 
                donhang.email, 
                donhang.thoigian_mua, 
                donhang.pt_thanhtoan,
                donhang.soluong,
                trangthai_donhang.ten_trangthai,
                trangthai_donhang.id_trangthai,
                donhang.id_taikhoan,
                giohang.id_donhang,
                giohang.id_tk,
                giohang.id_trangthai_donhang as cart_status,
                giohang.id as id_cart,
                giohang.tensp as name_cart,
                giohang.soluong as cart_qty,
                giohang.giasp 
        FROM donhang
        INNER JOIN taikhoan ON taikhoan.id = donhang.id_taikhoan
        INNER JOIN giohang ON taikhoan.id = giohang.id_tk
        INNER JOIN trangthai_donhang ON trangthai_donhang.id_trangthai = giohang.id_trangthai_donhang

        WHERE giohang.id_tk = $id";
    $donhang = pdo_query($sql);
    return $donhang;
}

function loadall_donhang()
{
    $sql = "SELECT 
        donhang.id,
        donhang.nguoidung,
        donhang.sdt,
        donhang.email,
        donhang.diachi,
        donhang.thoigian_mua,
        donhang.pt_thanhtoan,
        donhang.soluong,
        trangthai_donhang.ten_trangthai,
        trangthai_donhang.id_trangthai,
        giohang.*
        from donhang 
        inner join giohang
        on giohang.id_donhang = donhang.id
        inner join trangthai_donhang
        on trangthai_donhang.id_trangthai = giohang.id_trangthai_donhang";
    $listdonhang = pdo_query($sql);
    return $listdonhang;
}

function loadonedonang(){
    $sql = "SELECT * FROM donhang ORDER BY id desc";
    $donhang = pdo_query_one($sql);
    return $donhang;
}

function loadone_donhang($id) {
    $sql = "SELECT giohang.*
            FROM giohang
            WHERE giohang.id = $id";

    $donhang = pdo_query_one($sql);

    return $donhang;
}

function loadone_donhang_by_id_khachang($id)
{
    $sql = "select * from donhang where id_taikhoan= " .$id;
    $donhang = pdo_query_one($sql);

    return $donhang;
}

function loadone_donhang_by_id($id)
{
    $sql = "select * from donhang where id= " .$id;
    $donhang = pdo_query_one($sql);

    return $donhang;
}

function huydonhang($id){
    $sql = "update giohang set  id_trangthai_donhang = 7  where id= " . $id;
    pdo_execute($sql);
    header("Location: index.php?act=listdh");
}


function update_donhang($id, $nguoidung, $sdt, $email, $diachi, $thoigian_mua, $soluong, $id_trangthai_donhang)
{
    $sql = "update donhang set nguoidung = '" . $nguoidung . "', sdt = '" . $sdt . "', email = '" . $email . "', diachi = '" . $diachi . "', thoigian_mua= '" . $thoigian_mua . "', soluong='" . $soluong . "' , id_trangthai_donhang = '" . $id_trangthai_donhang . "'  where id= " . $id;
    pdo_execute($sql);
}
function update_status($id, $id_trangthai_donhang)
{
    $sql = "update giohang set  id_trangthai_donhang = '" . $id_trangthai_donhang . "'  where id= " . $id;
    pdo_execute($sql);
}

function update_donhang_qty($qty,$id)
{
    $sql = "update donhang set soluong='" . $qty . "'  where id_taikhoan= " . $id;
    pdo_execute($sql);
}
?>