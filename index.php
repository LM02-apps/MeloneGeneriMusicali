
<?php
    include "database/database.php";

    $query="SELECT * FROM generi";
    $result=mysqli_query($conn,$query);

?>
<html>
<body>
    <h1>Selezione genere</h1>
    <form action="pages/sottogeneri.php" method="post">

            
            <?php
                while($row=mysqli_fetch_array($result,MYSQLI_ASSOC))
            {
                echo "<input type='radio' name=genere value='".$row['id_genere']."'>".$row['nome_genere'];
            }
        
            ?>
        

        <br><br>
        <input type="submit" value="Cerca">
    </form>
</body>
</html>