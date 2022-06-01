<?php

namespace Classes;

use PHPMailer\PHPMailer\PHPMailer;

class Email{

    public $email;
    public $nombre;
    public $token;
    public function __construct($email, $nombre, $token){
        $this->email = $email;
        $this->nombre = $nombre;
        $this->token = $token;
    }

    public function enviarConfirmacion(){
        
        //Crear el objeto de email
        $mail = new PHPMailer(true);
        //$mail ->SMTPDebug = 0;

        $mail->isSMTP();

        $mail->Host = 'smtp.office365.com';
         $mail->SMTPAuth = true;
        $mail->Username = 'BBRH4@hotmail.com';
        $mail->Password = 'B4B4R4H4@';
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
        $mail->Port = 587;

        $mail->setFrom('BBRH4@hotmail.com','Confirmacion BlackBox RedHair');
        $mail->addAddress('BBRH4@hotmail.com', 'Confirmacion BlackBox RedHair');
        $mail->Subject = 'Confirma tu cuenta en BlackBox RedHair';

        //Usamos HTML
        //Lineas para comentar que las lineas inferiores contienen HTML
        $mail->isHTML(TRUE);
        $mail->CharSet = 'UTF-8';

        $contenido = "<html>";
        $contenido .= "<p><strong>Hola " . $this->nombre .  "</strong> Te pedimos entrar al siguiente enlace para la confirmacion de tu cuenta.</p>";
        $contenido .= "<p>Presiona aquí: <a href='http://localhost:8000/confirmar-cuenta?token=" . $this->token . "'>Confirmar mi cuenta</a>";        
        $contenido .= "<p>Si tu no solicitaste esto puedes ignorar el mensaje</p>";
        $contenido .= '</html>';
       
        $mail->Body = $contenido;

        //Enviar el mail
        $mail->send();
    }

    public function Enviarinstrucciones(){
        //Crear el objeto de email
        $mail = new PHPMailer(true);
        //$mail ->SMTPDebug = 0;

        $mail->isSMTP();

        $mail->Host = 'smtp.office365.com';
         $mail->SMTPAuth = true;
         $mail->Username = 'BBRH4@hotmail.com';
         $mail->Password = 'B4B4R4H4@';
         $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
         $mail->Port = 587;
 
         $mail->setFrom('BBRH4@hotmail.com','Confirmacion BlackBox RedHair');
         $mail->addAddress('BBRH4@hotmail.com', 'Confirmacion BlackBox RedHair');
         $mail->Subject = 'Restablece tu contraseña en BlackBox RedHair';

        //Usamos HTML
        //Lineas para comentar que las lineas inferiores contienen HTML
        $mail->isHTML(TRUE);
        $mail->CharSet = 'UTF-8';

        $contenido = "<html>";
        $contenido .= "<p><strong>Hola " . $this->nombre .  "</strong> Te pedimos entrar al siguiente enlace para restablecer tu password.</p>";
        $contenido .= "<p>Presiona aquí: <a href='http://localhost:8000/recuperar?token=" . $this->token . "'>Restablecer Password</a>";        
        $contenido .= "<p>Si tu no solicitaste esto puedes ignorar el mensaje</p>";
        $contenido .= '</html>';
       
        $mail->Body = $contenido;

        //Enviar el mail
        $mail->send();

    }

}