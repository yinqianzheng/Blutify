<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>index</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

	<style type="text/css">
	<%@ include file="../../resources/css/index.css" %>
	</style>
	  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    

</head>
<body>
	<div class="bgimg">
		<div class="middle">
			<img src="https://explorance.com/wp-content/uploads/2016/07/Blue_logo-300x298.png">
			<h4>${language.welcome}</h4>	
			<button class="button button1" id="signUp" data-toggle="modal" data-target="#signUpDialog">${language.createAccount}</button>
			<p id="demo1"></p >
			<button class = "button button2" id="login" data-toggle="modal" data-target="#loginDialog">${language.login}</button><br>
			<a href="#" data-toggle="modal" data-target="#resetPW">${language.forgetPassword}</a><br>
		</div>

		
		
		<div class="modal fade" id="loginDialog" role="dialog">
			  	<form id="loginForm" class="modal-content animate" action="login" method = "get">
					<div class="form-login">
						<h5>Welcome back.</h5>
						<input id="loginError" class="input-p" disabled/>
						<input type="text" id="userName" name ="username" class="form-control input-sm chat-input" placeholder="email" required/>
						<input type="password" id="password" name="password" class="form-control input-sm chat-input" placeholder="password" required/>
						<div class="wrapper">
								<button class="btn btn-primary" id="submitBtn" type="submit">${language.submit}</button>
								<button type="button" id="close1" class="btn btn-secondary" data-dismiss="modal">${language.close}</button>
							</div>
						</div>
				</form>
 			</div>
		  
		  <div class="modal fade" id="signUpDialog" role="dialog">
			  	<form id="signUpForm" class="modal-content animate" action="signUp" method="post">
					<div class="form-login">
						<h5>Registration Form</h5>
                    	<input id="signUpErrorE" class="input-p" disabled/>
                    	<input id="signUpErrorN" class="input-p" disabled/>
                    	<label for="email *"  class="signup-lable">${language.email}</label>
                        <input type="email" name="email" placeholder="Email" class="form-control" required>
                    	<label for="password *" class="signup-lable">${language.password}</label>
                        <input type="password" id="indexPw" name="password" placeholder="Password" class="form-control" required>
                        <label for="repassword *" class="signup-lable">${language.repassword}</label>
                        <input type="password" id="indexRePw" name="repassword" placeholder="Re-enter Password" class="form-control" onblur="indexpwCheck()" required>
                		<label for="firstName *" class="signup-lable">${language.firstname}</label>
                        <input type="text" name="firstname" placeholder="First Name" class="form-control" autofocus required>
                    	<label for="lastName *" class="signup-lable">${language.lastname}</label>
                        <input type="text" name="lastname" placeholder="Last Name" class="form-control" autofocus required>
                   		<label for="nickName *" class="signup-lable">${language.nickname}</label>
                        <input type="text" id="nickName" name="nickname" placeholder="Nick Name" class="form-control" autofocus required>
						<div class="wrapper">
							<button class="btn btn-primary" id="signUpBT" type="submit">${language.submit}</button>
							<button type="button" id="close2" class="btn btn-secondary"  data-dismiss="modal">${language.close}</button>
						</div>
					</div>
				</form>
			</div>
			
	<div class="modal fade" id="artistLogin" tabindex="-1" role="dialog" aria-labelledby="edit-profile-label" aria-hidden="true">
   			<form name="artistLogin" class="modal-content animate" action="artistlogin" method="post">
						<div class="form-login">
						<h5>Greeting.</h5>
						<input type="text"  name ="email" class="form-control input-sm chat-input" placeholder="email" required/>
						<input type="password" name="password" class="form-control input-sm chat-input" placeholder="password" required/>
						<div class="wrapper">
								<button class="btn btn-default" type="submit">${language.submit}</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">${language.close}</button>
							</div>
						</div>
				</form>
		</div>		
</div>


<div class="modal fade" id="resetPW" tabindex="-1" role="dialog" aria-labelledby="resetPW" aria-hidden="true">
<form id="resetPW" name="resetPW" class="modal-content animate" action="resetPassword" method="post">
<div class="form-login">
						<h5>Reset Password.</h5>
						<h5 style="border: 0px">Please input your email for receiving instruction.</h5>
						<div type="hidden"  id="resetError"></div>
						<input type="email"  name ="email" class="form-control input-sm chat-input" placeholder="email" required/>
						<div class="wrapper">
								<button class="btn btn-default" type="submit">Confirm</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">${language.close}</button>
							</div>
						</div>

</form>		
</div>

<script type="text/javascript">	   
function indexpwCheck()
{
	document.getElementById("signUpBT").disabled=true;
	if (document.getElementById('indexRePw').value == document.getElementById('indexPw').value) {
		document.getElementById("signUpBT").disabled=false;
		$('#signUpErrorE').val("");
		$('#signUpErrorE').removeClass("input-p-error");
		$('#signUpErrorE').addClass("input-p");
		document.getElementById('indexPw').style.background = "white";
		document.getElementById('indexRePw').style.background = "white"; 
	} else {
		document.getElementById('indexPw').style.background = "pink";
		document.getElementById('indexRePw').style.background = "pink"; 
		$('#signUpErrorE').val("Password not match");
		$('#signUpErrorE').after($("#signUp-title"));
		$('#signUpErrorE').removeClass("input-p");
		$('#signUpErrorE').addClass("input-p-error");
		document.getElementById("signUpBT").disabled=true;
	}
}
$(document).ready(function() {	
	$("form").submit(function(e) {
		e.preventDefault();	       
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		$.ajax({
			url: actionurl,
			type: actiontype,
			dataType: 'application/json', 
			data: $(this).serialize(),
			complete: function(json) {
				var data = jQuery.parseJSON(json.responseText);
				if (data.action == "signUp"){
					signUphandle(data)
				}else if(data.action=="login"){
					logInhandle(data);
				}
			}
		});
	});
	
	$("form[name='resetPW']").on('submit',function(e){
 		e.preventDefault();		
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		$.ajax({
			url: actionurl,
			type: actiontype,
			dataType: 'application/json', 
			data: $(this).serialize(),
			complete: function(json) {
				var jsonBack = jQuery.parseJSON(json.responseText);
				if(jsonBack.status == false){
					
					document.getElementById("resetError").innerHTML = jsonBack.value;
					document.getElementById("resetError").style.color = "red";
					document.getElementById("resetError").style.display = "block";
				}
				else
				{
					document.getElementById("resetError").innerHTML = jsonBack.value;
					document.getElementById("resetError").style.color = "green";
					document.getElementById("resetError").style.display = "block";
				}
					
			}
		});
	});
	
	$("form[name='artistLogin']").on('submit',function(e){
 		e.preventDefault();		
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		$.ajax({
			url: actionurl,
			type: actiontype,
			dataType: 'application/json', 
			data: $(this).serialize(),
			complete: function(json) {
				var jsonBack = jQuery.parseJSON(json.responseText);
				window.location.href = jsonBack.value;
			}
		});
	});
		    	 
function signUphandle(data){
	if(data.status == false){
		if(data.email == true){
			$('#signUpErrorE').val("Email existed");
			$('#signUpErrorE').after($("#signUp-title"));
			$('#signUpErrorE').addClass("input-p-error");
		}
		else{
			$('#signUpErrorE').removeClass("input-p-error");
		    $('#signUpErrorE').addClass("input-p");
		}
		if(data.nickname == true){
		    $('#signUpErrorN').val("Nick name existed");
		    $('#signUpErrorN').after($("#signUp-title"));
		    $('#signUpErrorN').addClass("input-p-error");
		}
		else{
		    $('#signUpErrorN').removeClass("input-p-error");
		    $('#signUpErrorN').addClass("input-p");
		}
	}
	else{
		 $('#signUpErrorN').addClass("input-p");
		 $('#signUpErrorE').val("Success, activation link has been sent to your email.");
		 $('#signUpErrorE').after($("#signUp-title"));
		 $('#signUpErrorE').addClass("input-p-success"); 
	}
}
	

function logInhandle(data){
	if(data.status == false){
		$('#loginError').val(data.value)
	    $('#loginError').addClass("input-p-error");
	}
	else{
		window.location.href = data.value;
	}
}
		  			
	$("button[id^='close']").click(function() {
		$('#signUpErrorN').removeClass("input-p-error");
		$('#signUpErrorE').removeClass("input-p-error");
		$('#signUpErrorE').removeClass("input-p-success");
		$( "#loginError" ).removeClass("input-p-error");
		$('#signUpErrorN').addClass("input-p");
		$('#signUpErrorE').addClass("input-p");
		$( "#loginError" ).addClass("input-p");
		$(this).closest('form').find("input[type=text], input[type=password], input[type=email], input[type=date]").val("");
	});			
}); 
</script>
</body>
</html>