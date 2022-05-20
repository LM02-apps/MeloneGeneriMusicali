
<?php
    include "../database/database.php";

    $genere=$_POST['genere'];
    $query="SELECT * FROM sottogeneri WHERE id_genere=$genere";
    $result=mysqli_query($conn,$query);

?>
<html>
    <body>
        <h1>Selezione sottogenere</h1>

        <form action="artisti.php" method="post">
            <select name="sottogenere" id="sottogenere">
                <option>---Scegliere sottogenere---</option>
                <?php

                while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
                {
                    echo "<option value='".$row['id_sottogenere']."'>".$row['nome_sottogenere']."</option>";
                }
                ?>
            </select>
            <br>
            <input type=submit value="Cerca">
        </form>
    </body>
</html>