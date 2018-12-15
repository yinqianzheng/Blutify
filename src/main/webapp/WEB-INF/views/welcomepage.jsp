<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="com.blue.model.User" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
	<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
	<style type="text/css">
	<%@ include file="../../resources/css/main.css" %>
	</style>
	<spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class = "body-row">
		<div class="col-2">
			<ul class="sidebar-nav" id="left-nav">
                <li>
                	<img src="<c:url value="/resources/images/blue.jpeg" />">
                </li>
                <li class="active">
                    <a id = "page1" href="#">Browse</a>
                </li>
                <li>
                    <a id = "page3" href="#">Public</a>
                </li>
                <li>
                    <h6>YOUR LIBRARY</h6>
                </li>
                <li>
                    <a id = "page4" href="#">Songs</a>
                </li>
                <li>
                    <a href="#">Albums</a>
                </li>
                <li>
                    <a id = "page5" href="#">Artists</a>
                </li>
                <li>
                    <h6>PLAYLIST</h6>
                </li>
                <li>
					   <c:forEach items="${user.playlistCollection}" var="pl">
		               <form id="loadPL" action="loadPlaylist" method="get">
		               		<input type="text" name="name" value=${pl.name} hidden>
						    <li><a class="playlists">${pl.name}</a></li>
						    </form>
						</c:forEach>
				</li>	
                <foot id="sidenav-foot">
                	<button class="button button5" data-toggle="modal" data-target="#createPL" id="topbutton1">
                		<span>+ New Playlist</span>
                	</button>
                </foot>
            </ul>
    	</div>
		<div class="col-8">
	    	<div class="mid-top">
	    		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="topnav">
					<div class="container-fluid">
						<form class="navbar-form navbar-left">
							<div class="input-group">
								<input type="text" value="" class="form-control" placeholder="Search dashboard...">
								<span class="input-group-btn">
									<button class="button button4">Go</button>
								</span>
							</div>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li><button id="topbutton" class="button button1">UPGRADE</button></li>
	 						<li> 
	 							<div class="input-group-btn">
									<button id="topbutton" class="button button5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<img src="<c:url value="/resources/images/freepik.jpeg" />"> 
											<span>
												${user.nickname}
											</span>
									</button>
									<div class="dropdown-menu dropdown-menu-right">
										<a class="dropdown-item" id="page6" href="#">Profile</a>
										<a class="dropdown-item" href="#">Message</a>
										<a class="dropdown-item" href="#">Setting</a>
										<form action="logout" method="post">
											<button class="buttonLink" type="submit">
												Log out
											</button>
										</form>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</nav>
	    	</div>
- 			<div id="content">
	     		<jsp:include page="inner-main.jsp"></jsp:include>
	     	</div>
	    </div>
	    
	    <div class="col-2">
	    	<div class="right-center">

			<div class="right-content">
			
				<div class="social">
				    
				      <div class="friends">
				      
				        <a href="#" class="friend">
				        
				          <i class="ion-android-person" style="padding-right:20px"></i>
				          
				          Sam Smith
				          
				        </a>
						</div>
					</div> 
			</div>
						<button class="button-light">Find Friends</button>	
				</div>
</div>
<div class="modal fade" id="createPL">
	<div class="modal-dialog">
		<form id="createPlForm" class="modal-content animate" action="createPL" method="post">
			<div class="modal-content">
				<h4 class="modal-title">Create PlayList</h4>
				<input id="createPLE" class="input-p" disabled/>
	            <div class="modal-body">
		            <input type="text" id="plname" class="form-control input-sm chat-input" name="name" required placeholder="name"/>
		            <div class="row">
			            <div id="img-group" class="col-md-4">
			            	<div class="img-content">
			            		<img id ="playlistCover" class="plImg" src="<c:url value="/resources/images/default.jpeg" />">
			            		<label for="file" id="label-button" class="btn">
			            			change Image..
			            		</label>
			            		<input type="file" style="display:none" id="file" name= "image" onclick="changeImg()"/>
			            	</div>
						</div>
						<div class="col-md-8 product_content">
							<span>Description</span>
							<textarea rows="7" cols="42" id="plarea" name="description">
							</textarea>
						</div>
					</div>
					<div class="wrapper">
						<button id="submitBtn" class="button button6" type="submit">
							Submit
						</button>
						<button id="close1" class="button button7" data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#submitBtn").click(function (event) {
	        event.preventDefault();
	        var emptyError = 0;
	        if($("#plname").val()=="")
	        {
	        	$('#createPLE').val("name can't be empty");
				$('#createPLE').addClass("input-p-error");	
	        }
	        else
	        	{
	        	var form = $('#createPlForm')[0];
		        var data = new FormData(form);
		        $("#submitBtn").prop("disabled", true);
		        $.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "createPlaylist",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            success: function (json) {
		                console.log("SUCCESS : ", data);
		                $("#submitBtn").prop("disabled", false);
		            },
		            error: function (e) {
		                $("#result").text(e.responseText);
		                console.log("ERROR : ", e);
		                $("#submitBtn").prop("disabled", false);

		            },
		            complete: function (json) {
		            	var data = jQuery.parseJSON(json.responseText);
						if(data.status == true) {
							$("#left-nav").append("<li><a>"+data.value+"</a></li>");
							$('#createPLE').val("");
							$('#createPLE').addClass("input-p");
							$("#submitBtn").closest('form').find("input[type=text]").val("");
							$("#submitBtn").closest('form').find("textarea").val("");
							$('#playlistCover').attr('src','<c:url value="/resources/images/default.jpeg" />');
						}
						else{
							$('#createPLE').val(data.value)
							$('#createPLE').addClass("input-p-error");	
						}
		            }
		        });
	        	
	        	}
	        
	    });
		$('form').on("click",function(e){
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

					$("#content").load(jsonBack.value);

				}
			});
		});
		$("button[id^='close']").click(function() {
			$('#createPLE').removeClass("input-p-error");
			$('#createPLE').val("");
			$('#createPLE').addClass("input-p");
			$(this).closest('form').find("input[type=text]").val("");
			$(this).closest('form').find("textarea").val("");
			$('#playlistCover').attr('src','<c:url value="/resources/images/default.jpeg" />');
		});
});
</script>
<footer>
  	<audio controls style="width:100%">
  		<source src="" type="audio/ogg">
	</audio>
</footer>


</body>
</html>
