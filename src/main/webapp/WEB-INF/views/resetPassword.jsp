<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.blue.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>

  <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>
  
<style>
body {
  font-family:"Avenir", "Helvetica Neue", Arial;
}

.background {
  position:fixed;
  top:0;
  right:0;
  left:0;
  bottom:0;
  overflow:scroll;
}

.container {
  width:400px;
  margin:0px auto;  
  perspective: 1000;
}

.form {
  margin-top: 150px;
  box-shadow: 0px 10px 20px 0px rgba(0,0,0,0.5);
}

header {
  background-color:#3399ff;
  padding:20px;
  text-transform: uppercase;
  letter-spacing:0.5em;
  font-size:0.8em;
  text-align:center;
  color: #1b1b1b;
}

main {
  background-color:#fffff;
}

input {
  display:block;
  width: 100%;
  padding:40px 20px 20px 20px;
  border:0px;
  box-sizing:border-box;
}

input:focus {
  outline:none;
}

.input {
  position:relative;
}

label {
  bottom:30px;
  padding:5px 5px 5px 40px;
  left:-20px;
  position:absolute;
  font-family:"Courier", Monospace;
  color:#aaa;
  font-size:0.8em;
  transition:all 0.4s ease;
  border-radius:3px;
}

label.active{
  bottom:50px;
  background-color:#D9EEFF;
  color:#444;
  box-shadow:0 1px 2px rgba(0,0,0,0.8);
}

button {
/*    border: 1px solid rgba(255,255,255,0.5);
  border-radius:2px; */
/*   background-color: #aaaaaa;  */
  color:black;
  float:right;
  font-weight:200;
  margin-bottom:50px;
  margin-top:20px;
}

.card a {
  color:#ddd;
  font-size:0.8em;
  margin-top:20px;
  display:block;
  padding:5px 10px;
  float:left;
}

	.container.flip .card {
		transform: rotateY(180deg);
	}

.card {
	transition: 0.8s;
	transform-style: preserve-3d;
	position: relative;
}

#email {
  border-bottom:1px dotted #ccc;
}

.register, .forgot {
	backface-visibility: hidden;
	position: absolute;
	top: 0;
	left: 0;
  right:0;
}

.register {
	z-index: 2;
	transform: rotateY(0deg);
}

.forgot {
	transform: rotateY(180deg);
}

/* Signature */
.signature {
  background-color:rgba(255,255,255,0.9);
  width:150px;
  padding:20px;
  float:left;
  margin:0px 20px;
  opacity:0.2;
  transition:0.4s ease all;
  box-shadow:0px 2px 4px rgba(0,0,0,1);
  
  &:hover {opacity:1;}
  
  img {
    width:100px;
  }
  
  p {
  margin:0;  
  }
 
  
  p span {
    font-family:"Courier", Monospace;
    font-size:0.8em;
  }
}
</style>
</head>

</head>
<body>

<div class="background">
  <div class="container" id="container">
    <div class="card">
      <div class="register">
        <div class="form">
          <header>Reset Password</header>
          <main>
            <form id="resetPWform" name="resetPW" action="processResetPW" method="post">
            		<input type="hidden" name="id" value=${resetPWId}>
            		
              <div class="input">
                <label for="resetpassword" id="password_label" style="color: black">Password</label>
                <input class="label_pop" type="password" name="newPassword" id="resetpassword">
              </div>

              <div class="input">
                <label for="password" id="re-password_label" style="color: black">Confirm Password</label>
                <input class="label_pop" type="password"  id="resetpasswordConfirm" name="passwordConfirm" onblur="resetPWFunction()">
              </div>
            </form>
          </main>
        </div>
        <button type="button" id="resetPWSub" onclick="resetPWFunction()">Reset</button>
      </div>

    </div>
  </div>
</div>

  

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script>
	function resetPWFunction()
	{

/* 		var newPW = document.getElementById("resetpassword").value;		
		var newPWConfirm = document.getElementById("resetpasswordConfirm").value; */
		document.getElementById("resetPWSub").disabled=true;
		if(document.getElementById('resetpasswordConfirm').value == document.getElementById('resetpassword').value)
		{
			document.getElementById("resetPWSub").disabled=false;
			document.getElementById("resetPWSub").style.background = "";
			document.getElementById('password_label').style.color = "black";
			document.getElementById('re-password_label').style.color = "black"; 
			$.ajax({
				url: "processResetPW",
				type: "post",
				dataType: 'application/json', 
				data: $("#resetPWform").serialize(),
				complete: function(json) {
					window.location.href = "index";
						
				}
			});
		}
		else
			{
				document.getElementById('password_label').style.color = "red";
				document.getElementById('re-password_label').style.color = "red"; 
				document.getElementById("resetPWSub").disabled=true;
				document.getElementById("resetPWSub").style.background = "grey";
			
			}
	}


</script>
</body>
</html>