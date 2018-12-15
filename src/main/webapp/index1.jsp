<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
	<title>index</title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<spring:url value="/resources/css/index.css" var="indexCss" />	
	<link href="${indexCss}" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function() {
		var isValid = true;
		$('#signUp').click(function(){
			window.location.href='signUp.jsp';
		});
		
	});
	<!--
	$('form').submit(function () {

	    // Get the Login Name value and trim it
	    var name = $.trim($('#userName').val());

	    // Check if empty of not
	    if (name  === '') {
	        alert('Text-field is empty.');
	        return false;
	    }
	});
	//-->

</script>



</head>
<body>
	<div class="bgimg">
		<div class="middle">
			<img src="https://explorance.com/wp-content/uploads/2016/07/Blue_logo-300x298.png">
			<h4>Welcome to Blue.</h4>
			<button class="button button1" id="signUp">CREATE ACCOUNT</button>
			<p id="demo1">Already a user?</p>
			<button class = "button button2" id="login" data-toggle="modal" data-target="#loginForm">
				Login
			</button><br>
			<a href="forgetPW.html">Forget password?</a>
		</div>
		
		
		<div class="modal fade" id="loginForm" role="dialog">
			<div class="modal-dialog">
			  	<form:form name="loginForm" class="modal-content animate" action="login" method = "get">
					<div class="form-login">
						<h5>Welcome back.</h5>
						<div id="errorMessage"></div>
						<input type="text" id="userName" name ="username" class="form-control input-sm chat-input" placeholder="email" />
						<input type="text" id="password" name="password" class="form-control input-sm chat-input" placeholder="password" />
						<div class="wrapper">
							<div class="form-group col-xs-4">
								<button class="btn btn-primary" id="submitBtn" type="submit">Submit</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		  </div>
		  
		  
		  <div class="modal fade" id="find" role="dialog">
		  	<div class = "modal-dialog">
		  		<form:form name="find" class="modal-content animate" action="find" method="get">
		  		 <label for="email" class="col-sm-3 control-label">FindByid</label>
		  		 <input type="int" id="find" name="find" placeholder="find" class="form-control">
		  		 
		  	</div>
		  	
		  	<div class="form-group">
				  <div class="col-md-3 col-md-offset-4" ><button class="btn btn-primary" id="submitBtn" type="submit">Submit</button></div>
             </div>
              </form:form>
		  </div>
		  <div class="modal fade" id="delete" role="dialog">
		  	<div class = "modal-dialog">
		  		<form:form name="delete" class="modal-content animate" action="delete" method="get">
		  		 <label for="email" class="col-sm-3 control-label">deleteByEmail</label>
		  		 <input type=email id="delete" name="delete" placeholder="delete" class="form-control">
		  	</div>
		  	
		  	<div class="form-group">
				  <div class="col-md-3 col-md-offset-4" ><button class="btn btn-primary" id="submitBtn" type="submit">Submit</button></div>
             </div>
              </form:form>
		  </div>
		  
		  <div class="form-group" id="update" role="dialog">
		  	<div class="form-group">
		  		<form:form name="update" class="modal-content animate" action="update" method="post">
		  		 <label for="nickname" class="col-sm-3 control-label">nickname</label>
		  		 <input type="text" id="nickname" name="nickname" placeholder="update" class="form-control">
		  		  <label for="id" class="col-sm-3 control-label">id</label>
		  		 <input type="text" id="id" name="id" placeholder="update" class="form-control">
		  	</div>
             <div class="form-group">
				  <div class="col-md-3 col-md-offset-4" ><button class="btn btn-primary" type="submit">Submit</button></div>
		  	</div>
		  	</form:form>
		</div>
	</div>


</body>
</html>