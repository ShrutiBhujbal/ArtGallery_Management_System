<?php
	require_once 'config.php';
	session_start();

	$username = $artid = $quantity = $stock = '';
	$username = $_POST['username'];
	$artid = $_POST['art_id'];
	$quantity = $_POST['quantity'];
	$stock=$_POST['stock'];
	 $cvv = $_POST['cvv'];
    $length = strlen((string)$cvv);
	
?>
<!DOCTYPE html>
<html>
    <head>
	    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <title>Bought</title>
	    <link href="style/bootstrap4/css/bootstrap.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="style/otherstyle.css">
	    <link href="style/sticky-footer-navbar.css" rel="stylesheet">
        </script>
	    <style>
            .jumbotron{
            background-image: url("assets/background_1.jpg");
            background-size: cover;
            }
			.footer{
            background-image: url("assets/background_1.jpg");
            background-size: cover;
			position:fixed;
			left:0;
            }
	        body{
		    overflow-x: hidden;
	        }
        </style>
    </head>
    <body class="jumbotron text-center">
		<?php if($length==3)
            { ?> 
	        <div class="text-center display-4 lead">
		        <?php
                    if (isset($quantity) && $quantity !=0) {
				        if($quantity>$stock)
					        echo "quantity not avaiable";
					    else{
				            $sql = "SELECT id FROM customer WHERE username='$username';";
				            $result = mysqli_query($link, $sql);
		    	            $row = mysqli_fetch_assoc($result); 
		    	            $id = $row['id'];
				            $sql = "CALL update_count('$id','$artid','$quantity');";
				            $result = mysqli_query($link, $sql);
				            $stock =$stock-$quantity;
				            $sql2="UPDATE art SET art.stock = '$stock' WHERE art.art_id = '$artid';";
				            $result = mysqli_query($link, $sql2);
				            echo "Congratulations, <strong>" . ucfirst($username) ."</strong><br>
				            You've bought <strong>".$quantity."</strong> art piece(s).<br>";
				            echo "the remaining stock is  ".$stock;
				            /*$stock = $stock-$quantity;
				            $sql2="UPDATE art SET art.stock = '$stock' WHERE art.art_id = '$artid';";
				            $result = mysqli_query($link, $sql2);*/
			            }
		            }
		                else{
		    	            echo "Quantity can't be 0!!!<br>";
		                }
		        ?>
		        <?php 
                }
                else
                { 
                    echo '<div class = "jumbotron text-center display-4"> incorrect cvv </div>';
                }
        ?>

		        <div class="container " >
		            <a href  ="home.php" class="btn btn-secondary">Back to Home</a>
		        </div>
            </div>

            <footer class="footer">
	            <div class="container text-center">
                    <span>&copy; ArtSpark Gallery, 2025.</span>
                </div>
            </footer>

	        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
            <script type="text/javascript" src="style/bootstrap4/js/bootstrap.js"></script>
    </body>
</html>	