<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.blue.model.User" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Account Overview</title>
</head>
<body>
  <div class="container" style="width: 90%">
    <div class="page-header">
    	<h1 style="color: #1cbd62">${language.accountoverview}</h1>
  	</div>
    <div class="row">
                
       <div class="col-md-4">
      <div class="well card profile" id="">
	      <h3 style="color: #1cbd62; padding-bottom: 10px">${language.profile}</h3>
	      <form role="form">
	      	    <div class="form-group">
	      			<label class="control-label">${language.nickname}</label><p class="form-control-static" id="" style="color: black">${user.nickname}</p>
	      		</div>
	      		<div class="form-group">
	      			<label class="control-label">${language.firstname}</label><p class="form-control-static" id="" style="color: black">${user.firstname}</p>
	      		</div>
	      		<div class="form-group">
	      			<label class="control-label">${language.lastname}</label><p class="form-control-static" id="" style="color: black">${user.lastname}</p>
	      		</div>
	      		<div class="form-group">
	      			<label class="control-label">${language.email}</label>
	      			<p class="form-control-static" id="" style="color: black">${user.email}</p>
	      		</div>
	      		<div style="text-align: center">
	      			<a id="edit" href="viewProfile"><button class="button-dark" style="width: 100%; background: black; border: 1px solid black;">${language.editprofile}</button></a>
	      		</div>
	      	</form>	
      </div>    
      </div>
      
      <!-- for premium -->
      <span id="profileRole" style="display:none"></span>
       <div class="col-md-7" id="premiumHis" style="padding-left: 10%; display: none">
		<div class="well card subscription " style="text-align:center"><h3 style="color: #1cbd62; padding-bottom: 10px">${language.paymenthistory}</h3>
		<p class="subscription-status subscription-compact" style="color: black">
    		Click the button down below to view your payment history.
  		</p>
  		<hr>
  		<a id="checkHistory" href="viewHistory"><button class="button-dark" style="margin-left: 10%;width: 80%; background: black; border: 1px solid black;">${language.getreport}</button></a>
      </div>          
    </div>
     <!-- for premium -->
    
    <!-- for general -->
         <div class="col-md-7" id="generalPay" style="padding-left: 10%; display: none">
		<div class="well card subscription " style="text-align:center"><h3 style="color: #1cbd62; padding-bottom: 10px">${language.bluefree}</h3>
		<p class="subscription-status subscription-compact" style="color: black">
    		You're currently using our Free service. Please trying to use our Premium service, you can cancel the subscript whenever you want.
  		</p>
  		<hr>
  		<a id="generalUp" href="upgrade"><button class="button-dark" style="margin-left: 10%;width: 80%; background: black; border: 1px solid black;">${language.upgrade}</button></a>
      </div>      
    </div>
        <!-- for general -->
    
    
   </div>
   
   <div>
   	<div class="col-md-5" style='position: absolute; right: 15%; top: 55%;'>
	      <div class="well card profile">
		      <h3 style="color: #1cbd62; padding-bottom: 10px">${language.setting}</h3>
		      <p class="subscription-status subscription-compact" style="color: black">Click the button down below to change your preferences.</p>
		      <button onclick="redrToPreferencePage()" class="button-dark" style="margin-left: 10%;width: 80%; background: black; border: 1px solid black;">${language.changesetting}</button>
	      </div>    
   	</div>	
   </div>
   
   </div>  
 <script>

function redrToPreferencePage(){
	$("#content").load("preferences");
}

 
$(document).ready(function(){
	
 	if(${user.type == "general"})
	{
 		document.getElementById("profileRole").innerHTML = "premium";
		document.getElementById("generalPay").style.display = "block";
	 	$("#generalUp").click(function(event){
	 		event.preventDefault();	
	 		if(document.getElementById("upgrade").innerHTML == "UPGRADE"){
				$("#content").load(this.href);
				document.getElementById("content").style.background = "white";
	 		}
	 		else
	 		{
	 			if (confirm('Are you sure you want to unsubscript?')) {
	 				var actionurl = "downgrade";
					var actiontype = "post";
					$.ajax({
						url: actionurl,
						type: actiontype,
						dataType: 'application/json',
						complete: function(json) {
							document.getElementById("upgrade").innerHTML = "UPGRADE";
							var jsonBack = jQuery.parseJSON(json.responseText);
							window.location.href = jsonBack.value;				
						}
					});
	 			}
	 		}		
		});	
		
		
	}
	else
	{
		document.getElementById("profileRole").innerHTML = "general";
		document.getElementById("premiumHis").style.display = "block";
	  	$("#checkHistory").click(function(event){
	 		event.preventDefault();
			$("#content").load(this.href);
			document.getElementById("content").style.background = "white";
		});		
	} 
  	$("#edit").click(function(event){
 		event.preventDefault();
		$("#content").load(this.href);
		document.getElementById("content").style.background = "white";
	});	 
  	

 }); 
 </script>
</body>
</html>