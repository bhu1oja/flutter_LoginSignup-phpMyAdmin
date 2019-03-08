<?php
include 'config.php';


if(isset($_POST['Email'],$_POST['Password'])) {
		$Email = $_POST['Email'];
		$Password = $_POST['Password'];

//creating a query
 $query = "SELECT * from User where Email='$Email' and Password = '$Password' ";

			$result = mysqli_query($conn, $query);
			
			if(mysqli_num_rows($result) > 0){
					$json['message'] = 'User Successfully LoggedIn';
					//$json['sesson'] = $Email;
					
				}else{
					$json['message'] = 'Failed to Login User';
				}
				echo json_encode($json);
				mysqli_close($conn);
 //displaying the result in json format 
}

?>