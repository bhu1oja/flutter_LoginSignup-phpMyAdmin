<?php
include 'config.php';


if(isset($_POST['Email'],$_POST['Password'],$_POST['Name'])) {
		$Email = $_POST['Email'];
		$Password = $_POST['Password'];
		$Name = $_POST['Name'];
$query = "Select * from User where Email='$Email' ";
			$result = mysqli_query($conn, $query);
			if(mysqli_num_rows($result)>0){
				$json['message'] = ' Email Already Used:  ' .$Email;
				echo json_encode($json);
				mysqli_close($conn);
			}else{
				$query = "insert into User (Name, Email, Password) values ('$Name','$Email','$Password')";
				$inserted = mysqli_query($conn, $query);
				if($inserted == 1 ){
					$json['message'] = 'User Successfully Registered!!';
				}else{
					$json['message'] = 'Failed to Register User';
				}
				echo json_encode($json);
				mysqli_close($conn);
  }
}
?>