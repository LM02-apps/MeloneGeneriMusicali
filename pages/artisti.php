
<?php
    include "../database/database.php";

    $sottogenere=$_POST['sottogenere'];
    $query="SELECT * FROM musicista WHERE id_sottogenere=$sottogenere";
    $result=mysqli_query($conn,$query);

?>
<html>
    <body>
        <h1>Selezione artista</h1>

        <form action="album.php" method="post">
            <select name="artista" id="artista">

                <?php

                while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
                {
                    echo "<option value='".$row['id_artista']."'>".$row['nome_artista']."</option>";
                }
                ?>
            </select>
            <br>
            <input type=submit value="Cerca">
        </form>
    </body>
</html>