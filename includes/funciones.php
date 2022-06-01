<?php

function iniciarSession() {
    if(!isset($_SESSION)){
        session_start();
    }  
}

function debuguear($variable) : string {
    echo "<pre>";
    var_dump($variable);
    echo "</pre>";
    exit;
}

// Escapa / Sanitizar el HTML
function s($html) : string {
    $s = htmlspecialchars($html);
    return $s;
}

function esUltimo(string $actual, string $proximo): bool {
    if($actual !== $proximo) { //si el id es diferente significa que es otro
        return true;
    }
    return false;
}

//Funcion que revisa que el usuario este autenticado
function isAuth() : void //no retorna nada 
{
    if(!isset($_SESSION['login'])){
        header('Location: /');
    }
}

function isAdmin() : void {
    if(!isset($_SESSION['admin'])) {
        header('Location: /');
    }
}
