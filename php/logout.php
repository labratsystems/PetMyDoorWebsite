<?php
    if(!isset($_SESSION['cpf_cnpj_cliente'])){
        header('Location: index.php');
    }

    session_start();
    session_unset();
    session_destroy();
    header('Location: ../index.php');