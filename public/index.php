<?php 

require_once __DIR__ . '/../includes/app.php';

use Controllers\CitaController;
use Controllers\loginController;
use MVC\Router;

$router = new Router();

//iniciar seison
$router->get('/',[loginController::class, 'login']);
$router->post('/',[loginController::class, 'login']); //iniciar sesion
$router->get('/logout',[loginController::class, 'logout']); //cerrar sesion

//Recuperar password
$router->get('/olvide',[loginController::class, 'olvide']);
$router->post('/olvide',[loginController::class, 'olvide']);
$router->get('/recuperar',[loginController::class, 'recuperar']);
$router->post('/recuperar',[loginController::class, 'recuperar']);

//phpCrear Cuenta
$router->get('/crear-cuenta',[loginController::class, 'crear']);
$router->post('/crear-cuenta',[loginController::class, 'crear']);

// Confirmar cuenta
$router->get('/confirmar-cuenta', [loginController::class, 'confirmar']);
$router->get('/mensaje', [loginController::class, 'mensaje']);

//-----------PRIVADO
$router->get('/cita', [CitaController::class,'index']);

// Comprueba y valida las rutas, que existan y les asigna las funciones del Controlador
$router->comprobarRutas();