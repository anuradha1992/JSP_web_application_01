<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
		$( "#datepicker" ).datepicker();
	});
</script>

<title>Registration Form</title>

</head>

<body>

<center><img src="images/frozen.jpg"></center>

<center><h1><b><u>Register Here</u></b></h1>

<table>
<tr><td>Username</td><td><input type="text" name="username" style="font-size:18px; font-family:Times New Roman"><font color=red size=2><b>*required</b></font></td></tr>
<tr><td>Password</td><td><input type="password" name="password1" style="font-size:18px; font-family:Times New Roman"><font color=red size=2><b>*required</b></font></td></tr>
<tr><td>Confirm Password</td><td><input type="password" name="password2" style="font-size:18px; font-family:Times New Roman"></td></tr>
<tr><td>First Name</td><td><input type="text" name="firstName" style="font-size:18px; font-family:Times New Roman"><font color=red size=2><b>*required</b></font></td></tr>
<tr><td>Last Name</td><td><input type="text" name="lastName" style="font-size:18px; font-family:Times New Roman"><font color=red size=2><b>*required</b></font></td></tr>
<tr><td>Date</td><td><input type="text" id="datepicker" style="font-size:18px; font-family:Times New Roman"/></td></tr>
<tr><td>Email Address</td><td><input type="text" name="email" style="font-size:18px; font-family:Times New Roman"></td></tr>
<tr><td>Billing Address</td><td><textarea name="billingAddress" style="width: 300px; height: 120px; font-size:18px; font-family:Times New Roman"></textarea></td></tr>
<tr><td></td><td><input type="submit" value="Submit" style="width: 120px; height: 40px; font-size:18px; font-family:Times New Roman"></td></tr>
</table>

</center>
</body>
</html>