
<?php
    include "../database/database.php";
 
    $artista=$_POST['artista'];
    $query="SELECT a.id_album, a.titolo_album, a.data_pubblicazione, a.durata_album a.id_gruppo FROM album a INNER JOIN gruppo g ON a.id_gruppo=g.id_gruppo INNER JOIN musicista m ON g.id_gruppo=m.id_gruppo WHERE m.id_artista=$artista";
    $result=mysqli_query($conn,$query);

?>
<html>
    <body>
        <h1>Album</h1>

                <?php

                while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
                {
                    echo $row['titolo_album'].$row['data_pubblicazione'];
                }
                ?>

    </body>
</html>