
<?php
    include "database/database.php";

    $query="SELECT * FROM generi";
    $result=mysqli_query($conn,$query);

?>
<html>
<body>
    <h1>Selezione genere</h1>
    <form action="pages/sottogeneri.php" method="post">
        <select name="genere" id="genere">
            <option>---Selezionare genere musicale---</option>
            
            <?php
                while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
            {
                echo "<option value='".$row['id_genere']."'>".$row['nome_genere']."</option>";
            }
        
            ?>
        
        
        </select>
        <br><br>
        <input type="submit" value="Cerca">
    </form>
</body>
</html>