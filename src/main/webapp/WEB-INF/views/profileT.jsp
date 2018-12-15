<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.blue.model.User" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Spotify Artist Page UI</title>
</head>
<body>
<div class="container-fluid bg" >
  <div class="container edit-user">
    <div class="row" style="margin-right: 50px">
                
      <div class="col-sm-6">
        <div class="profile-pic">
          <!-- <img class="img-responsive user-pic" src="https://i.imgur.com/o8ouMW0.jpg" alt="" /> -->
           <img id="profileimage" class="img-responsive user-pic" src="<c:url value="/resources/images/default.jpeg" />">
         <div class="text-center">
					         
					          <label for="profileFile" class="btn">
			            			change Image
			            		</label>
			            		<input type="file" style="display:none" id="profileFile" name="image">
					        </div>
        </div>
      </div>
      
     <div class="col-xs-12 col-sm-9 col-md-9 pull-right">
        <div class="personal-info">
          <h3 class="heading" >Personal Information</h3>
          <hr>
          <form class="form-horizontal" role="form">
            <div class="form-group">
              <label class="control-label col-sm-3" for="email">Email:</label>
              <div class="col-sm-9">
                <input type="email" class="form-control" id="email" disabled value=${user.email} >
              </div>
            </div>
          
            <div class="form-group">
              <label class="control-label col-sm-3" for="firstname">First Name:</label>
              <div class="col-sm-9">
                <input type="text" name="firstname" class="form-control" id="firstname" value=${user.firstname}>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-3" for="lastname">Last Name:</label>
              <div class="col-sm-9"> 
                <input type="text" name="lastname" class="form-control" id="lastname" value=${user.lastname}>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-3" for="nickname">Nick Name:</label>
              <div class="col-sm-9"> 
                <input type="text" name="nickname" class="form-control" id="nickname" value=${user.nickname}>
              </div>
            </div>

         <div class="pull-right">
          <button type="submit" class="btn btn-default btn-lg save-edit-btn" style="right: 25%">UPDATE</button>
          <button type="reset" class="btn btn-default btn-lg save-edit-btn" style="right: 5%">CANCEL</button>
        </div>
            

          </form>
          
        </div>   
      </div>
      
     
        
<!--         <div class="pull-right">
          <button type="button" class="btn btn-default btn-lg save-edit-btn">UPDATE ACCOUNT</button>
        </div> -->
      </div>
      
      
      
    </div>
  </div>


    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
   <spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script>
<script>
 $("#profileFile").change(function() {
	if (this.files && this.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#profileimage')
				.attr('src', e.target.result)
				.width(250)
				.height(250);
		};
		reader.readAsDataURL(this.files[0]);
	}
});
</script>
</body>
</html>