<?php
    $servername = "127.0.0.1:3307";
    $username = "root";
    $password = "Wesley20082000";
    $db_name = "petmydoor";

    $connect = mysqli_connect($servername, $username, $password, $db_name);
    mysqli_set_charset($connect, "utf8");
    if(mysqli_connect_error()){
        echo "Falha na conexão: ".mysqli_connect_error();
    }
?>