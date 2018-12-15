<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="width: 90%; height: 500px">
    <div class="page-header">
    	<h1 style="color: #1cbd62">Edit your profile</h1>
  	</div>
        <div style="">        
		 <form class="form-horizontal" name="editProfile" action="editProfile" method="post">
            <div class="form-group">
              <label class="control-label col-sm-3" for="email">Email:</label>
              <div class="col-sm-9">
                <input type="email" class="form-control" id="email" disabled value=${user.email} >
              </div>
            </div>
          
            <div class="form-group">
              <label class="control-label col-sm-3" for="firstname">First Name:</label>
              <div class="col-sm-9">
                <input type="text" name="firstname" class="form-control" value=${user.firstname}>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-3" for="lastname">Last Name:</label>
              <div class="col-sm-9"> 
                <input type="text" name="lastname" class="form-control" value=${user.lastname}>
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-3" for="nickname">Nick Name:</label>
              <div class="col-sm-9"> 
                <input type="text" name="nickname" id="nickname" class="form-control"  value=${user.nickname}>
              </div>
            </div>
            <div style="text-align:right">
               <a id="cancel" href="portfolio"><button class="button-dark" style="background: #aaaaaa; border: 1px solid #aaaaaa;">CANCEL</button></a>
          	   <button type="submit" class="button-dark">Save Profile</button>

			</div>
          </form>
             </div>
   </div>
 <script>
$(document).ready(function(){
  	$("#cancel").click(function(event){
 		event.preventDefault();
		$("#content").load(this.href);
		document.getElementById("content").style.background = "white";
	});	 
  	
	$( "form[name='editProfile']" ).submit(function(e) {
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
				if(jsonBack.status == false)
				{
					document.getElementById("nickname").style.background = "pink";
				}
				else
				{
					document.getElementById("mainPageShowName").innerHTML = jsonBack.value;
					document.getElementById("nickname").style.background = "white";
					$("#content").load("portfolio");
					document.getElementById("content").style.background = "white";
				}

			}
		});
	});
 }); 
 </script>
</body>
</html>