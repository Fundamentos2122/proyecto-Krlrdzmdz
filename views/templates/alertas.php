<?php
//en PHP mientas vayan existiendo una variable esta estara disponible en todos los lugares
    foreach($alertas as $key => $mensajes):
        foreach($mensajes as $mensaje):
?>
    <div class="alerta <?php echo $key; ?>">
            <?php echo $mensaje; ?>
    </div>
<?php
        endforeach;
    endforeach;


?>