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
  <title></title>
    <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
	<style type="text/css">
	
	</style>
	
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>
  
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<style type="text/css">
	<%@ include file="../../resources/css/style.css" %>
	</style>
  
</head>

<body>
  <section class="header" style="position: fixed; width: 100%">

  <!--
  <div class="window__actions">
    <i class="ion-record red"></i>
    <i class="ion-record yellow"></i>
    <i class="ion-record green"></i>
  </div>
  -->

  <div class="page-flows">

    <span class="flow">
      <i class="ion-chevron-left"></i>
    </span>

    <span class="flow">
      <i class="ion-chevron-right disabled"></i>
    </span>

  </div>

  <div class="search">

    <input type="text" placeholder="Search" />

  </div>

  <div class="user">

    <div class="user__notifications">

      <i class="ion-android-notifications"></i>

    </div>

    <div class="user__inbox">

      <i class="ion-archive"></i>

    </div>

    <div class="user__info">

      <span class="user__info__img">
      	<img id="profileImg" src="<c:url value="/resources/images/freepik.jpeg" />" class="img-responsive" /> 
        
      </span>

      <span class="user__info__name">
      
        <span class="first">${user.nickname}</span>

      </span>

    </div>

    <div class="user__actions">

<%--       <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          <i class="ion-chevron-down"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
          <li><a href="#">Private Session</a></li>
          <li>
           	<form action="portfolio" method="post">
				<button class="buttonLink" type="submit">Account</button>
			</form>
         	<a id="profile" href="portfolio">Account</a>
          </li>
          <li><a href="#">Settings</a></li>
           <li>
          	<form action="deleteAccount" method="post">
				<button class="buttonLink" type="submit">Delete</button>
			</form>
          </li>
          <li>
          	<form action="logout" method="post">
				<button class="buttonLink" type="submit">Log out</button>
			</form>
          </li>
        </ul>
      </div> --%>
			
	        
	        
	        	<div class="dropdown" style="right:50px; top:-20px;">
				<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><i class="ion-chevron-down"></i></button>
					<ul class="dropdown-menu">
						<li><a href="#">Private Session</a></li>
					    <li><a href="#">Settings</a></li>
					    <li><a id="profile" href="portfolio">Account</a></li>
					    <li>
					    		<form action="deleteAccount" method="post">
								<button  type="submit">Delete</button>
							</form>
						</li>
						<li>
							<form action="logout" method="post">
								<button  type="submit">Log out</button>
							</form>
						</li>
					</ul>
			</div>
	        
    </div>

  </div>

</section>


  <div class="navbar navbar-inverse navbar-fixed-left" style="height: 100;top: 7%;padding: 0px;margin-bottom: 10%;width: 11%; position: fixed">
	
  <!--   <section class="navigation"> -->
<div style="position: absolute">
      <!-- Main -->
      <div class="navigation__list">

        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#" aria-expanded="true" aria-controls="main">
          Main
        </div>

        <div class="collapse in" id="main">

          <a href="loadMain" class="navigation__list__item" id="browse">
            <i class="ion-ios-browsers"></i>
            <span>Browse</span>
          </a>

          <a href="#" class="navigation__list__item">
            <i class="ion-person-stalker"></i>
            <span>Activity</span>
          </a>

          <a href="#" class="navigation__list__item">
            <i class="ion-radio-waves"></i>
            <span>Radio</span>
          </a>

        </div>

      </div>
      <!-- / -->

      <!-- Your Music -->
      <div class="navigation__list">

        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#yourMusic" aria-expanded="true" aria-controls="yourMusic">
          Your Music
        </div>

        <div class="collapse in" id="yourMusic">

          <a href="#" class="navigation__list__item">
            <i class="ion-headphone"></i>
            <span>Songs</span>
          </a>

          <a href="#" class="navigation__list__item">
            <i class="ion-ios-musical-notes"></i>
            <span>Albums</span>
          </a>

          <a href="#" class="navigation__list__item">
            <i class="ion-person"></i>
            <span>Artists</span>
          </a>

          <a href="#" class="navigation__list__item">
            <i class="ion-document"></i>
            <span>Local Files</span>
          </a>

        </div>

      </div>
      <!-- / -->

      <!-- Playlists -->
      <div class="navigation__list">

        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#playlists" aria-expanded="true" aria-controls="playlists">
          Playlists
        </div>
        <div class="collapse in" id="playlists">

 					<c:forEach items="${user.playlistCollection}" var="pl">
		               <form id="loadPL" name="loadPL" action="loadPlaylist" method="get">
		               		<input id="loadName" type="hidden" name="name"  value=${pl.name} >
						   <a class="navigation__list__item">
				            <i class="ion-ios-musical-notes"></i>
				            <span>${pl.name}</span>
				          </a>
						    </form>
						</c:forEach>
		<!-- 				<button onclick="check()"></button> -->

        </div>

      </div>
   <section class="playlist">

      <a data-toggle="modal" data-target="#createPL">

        <i class="ion-ios-plus-outline"></i> New Playlist

      </a>

    </section>
    </div>
<!--     </section> -->

 



  </div>

<!--   <div class="content__middle"> -->
		<div style="height: 100%; width: 74%; top: 7%;margin-left: 12%;position:absolute">
	 		<div id="content">
<%-- 	 			<c:forEach items="${mainAlbums}" var="album">
	 				<span>${album.name}</span><br>
	 				<span>${album.createdTime}</span><br>
	 				<span>${album.numOfLike}</span><br>
	 				<span>${album.description}</span><br> 
	 				<span>${album.imageUrl}</span><br>
	 				<hr> 
	 			</c:forEach> --%>
 	 			<jsp:include page="inner.jsp"></jsp:include>
	     	</div>

  </div>

<!-- <div class="content__right"> -->
<div style="width: 15%; top: 7%;margin-left:87%;position:absolute">
    <div class="social">

      <div class="friends">
    
                <c:forEach items="${user.friendCollection}" var="fl">
                 	<form id="viewFriend" name="viewFriend" action="viewFriend" method="get">
		              <input type="hidden" name="id" value=${fl.id} >
		                  <a class="friend"><i class="ion-android-person"></i>${fl.nickname}</a >
                	</form>
            </c:forEach>

      </div>

      <button class="button-light" data-toggle="modal" data-target="#findFriend">Find Friends</button>
      <hr>
      <!-- play queue -->
  <div id="playlist">
     <div id="list"></div> 
  </div>
  <!-- play queue -->
  
    </div>

  </div>


<!--   <section class="current-track"> -->
  <div  id="playerBody" class="footer">
<!--     <div class="container"> -->
      <!-- Top Info -->
      <div id="title">
        <span id="track"></span>
        <div id="timer">0:00</div>
        <div id="duration">0:00</div>
      </div>

      <!-- Controls -->
      <div class="controlsOuter">
        <div class="controlsInner">
          <div id="loading" ></div>
          <div class="btn" id="playBtn"><a class="ion-ios-play play" style="font-size: 40px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></a></div>
          <div class="btn" id="pauseBtn"><a class="ion-ios-pause pause" style="font-size: 40px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);" ></a></div>
          <div class="btn" id="prevBtn"><a class="ion-ios-skipbackward" style="font-size: 25px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></a></div>
          <div class="btn" id="nextBtn"><a class="ion-ios-skipforward" style="font-size: 25px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></a></div>
          <div class="btn" id="normalMode" onclick="changeMode()" style="display: block; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
          <div class="btn" id="loopOneMode" onclick="changeMode()" style="display: none; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
          <div class="btn" id="loopAllMode" onclick="changeMode()" style="display: none; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
          <div class="btn" id="randomMode" onclick="changeMode()" style="display: none; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
         <!--  <div class="btn" id="playerMode"><i class="ion-shuffle" style="font-size: 15px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></i></div> -->
        </div>
        
<!--         <div class="btn" id="volumeBtn"> -->
		<div class="btn" id="playlistBtn" ></div>
		<div class="btn" id="volumeBtn">
        </div>
      </div>

      <!-- Progress -->
      <div id="waveform"></div>
      <div id="bar"></div>
      <div id="progress"></div>

     

      <!-- Volume -->
      <div id="volume" class="fadeout">
         <div id="barFull" class="bar"></div>
        <div id="barEmpty" class="bar"></div>
        <div id="sliderBtn"></div>
      </div>
    </div>


 <div class="modal fade" id="findFriend" tabindex="-1" role="dialog" aria-labelledby="edit-profile-label" aria-hidden="true">
    <div class="modal-dialog" style="min-width: 650px">
        <div class="modal-content">
            <form class="form-horizontal" role="form" class="modal-content animate" action="#" method="post">
                <div class="modal-header">
                    <h4 class="modal-title" id="edit-profile">Edit Profile</h4>
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                </div>
                 <div class="modal-body">
                 <span id="addError" style="color: red"></span>
                	<div class="row">
                		
                		<label class="col-sm-3 control-label" >Enter a name:</label>
                		 				      
					          <div class="form-group" style="min-width: 500px">
					            <div class="col-lg-8">
					              <input class="form-control" id="friendName" style="minlength:50"name="" type="text" value="" required>
					              <input type="hidden" id="friendNameSubmit" name="nickname" value="">
					            </div>
					          </div>				          					          
					      </div>
                   
                </div>
                 <div class="modal-footer" >
                    <button type="reset" class="btn btn-default" style="right: 13%"data-dismiss="modal">Close</button>
                    <button type="submit" id="addFriend" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
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
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
   <spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script>
	 <spring:url value="/resources/js/howler.core.js" var="howlerJs" />
	<script src="${howlerJs}"></script>
		 <spring:url value="/resources/js/siriwave.js" var="siriwaveJs" />
	<script src="${siriwaveJs}"></script>
		 <spring:url value="/resources/js/player.js" var="playerJs" />
	<script src="${playerJs}"></script>
<%-- 	<spring:url value="/resources/js/jquery.jplayer.min.js" var="jplayerJs" />
	<script src="${jplayerJs}"></script> --%>
	
<script>
/* function check(){
	
	const i = ${user.playlistCollection};
	i.forEach(function(element) {
		alert(element.name);
	});
    <form name="loadPL" action="loadPlaylist" method="get">
    		<input type="text" name="name" value=${pl.name} hidden>
		   <a class="navigation__list__item">
         <i class="ion-ios-musical-notes"></i>
         <span>${pl.name}</span>
       </a>
		    </form> 
} */


var player = null;
function clearQueue(){          
	  try {
	      player.pause();
	  }
	  catch(err) {}
	  setTimeout(function() {
	    var myNode = document.getElementById("list");
	    while (myNode.firstChild) {
	        myNode.removeChild(myNode.firstChild);
	    }        
	    document.getElementById("track").innerHTML = "";
	    document.getElementById("duration").innerHTML = "0:00";
	    document.getElementById("timer").innerHTML = "0:00";
	    document.getElementById("progress").style="width: 0.00%";
	    player = null;
	  }, 50);
	}

	function addToQueue(name, url, howl){
	  if(player==null){
	    player = new Player([
	      {
	        title: name,
	        file: url,
	        howl: null
	      }
	    ]);
	  }else{
	    player.playlist = player.playlist.concat([
	    {
	      
	      title: name,
	      file: url,
	      howl: null
	    }
	    ]);
	    player.refleshQueue();
	  }
	}
	
	
	function changeMode(){
		if(player!=null){
		var normal = document.getElementById("normalMode");
		var repeatone = document.getElementById("loopOneMode");
		var repeatall = document.getElementById("loopAllMode");
		var random = document.getElementById("randomMode");
		if (normal.style.display == "block"){
			normal.style.display = "none";
			repeatone.style.display = "block";
			player.mode = "loopone";
		}else if(repeatone.style.display == "block"){
			repeatone.style.display = "none";
			repeatall.style.display = "block";
			player.mode = "loopall";
		}else if(repeatall.style.display == "block"){
			repeatall.style.display = "none";
			random.style.display = "block";
			player.mode = "random";
		}else{
			random.style.display = "none";
			normal.style.display = "block";
			player.mode = "normal";
		}
		}
	}
	
	function pau(){
	  player.play();
	}

	function loopone(){
	  player.mode = "loopone";
	}

	function loopall(){
	  player.mode = "loopall";
	}

	function random(){
	  player.mode = "random";
	}

	function normal(){
	  player.mode = "normal";
	}


	function setPlaylistQueue(data){
		try {
		      player.skipTo(-1);
		}catch(err) {}
		var myNode = document.getElementById("list");
	    while (myNode.firstChild) {
	        myNode.removeChild(myNode.firstChild);
	    }        
	    document.getElementById("track").innerHTML = "";
	    document.getElementById("duration").innerHTML = "0:00";
	    document.getElementById("timer").innerHTML = "0:00";
	    document.getElementById("progress").style="width: 0.00%";
	    player = null;
		var s = data;
		var res = s.split(";;721;;");
		res.forEach(function(element) {
			var e = element.split(";!;");
			addToQueue(e[0], e[1]);
		});
		player.play();
	}
	
	
	function addPlaylistToQueue(data){
		var s = data;
		var res = s.split(";;721;;");
		res.forEach(function(element) {
			var e = element.split(";!;");
			addToQueue(e[0], e[1]);
		});
	}
/* function load()
{ 
	$("form[name='loadPL']").on("click",function(e){
 		e.preventDefault();
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		alert("aaaaaaaaaaaaaaaaaaaa");
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
} */

$(document).ready(function(){
/* 	check(); */
	
	$("form[name='loadPL']").on("click",function(e){
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
				$("#content").load(jsonBack.value);

			}
		});
	});
	
	$("form[name='viewFriend']").on("click",function(e){
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
				$("#content").load(jsonBack.value);
			}
		});
	});



 	$("#profile").click(function(){
 		event.preventDefault();
		$("#content").load(this.href);
	});
	
 	$("#browse").click(function(){
 		event.preventDefault();
		$("#content").load(this.href);
	});
 	
 	
 	$("#addFriend").click(function (event) {
        event.preventDefault();
        $('#friendName').change(function() {
            $('#friendNameSubmit').val($(this).val());
        });
        var inpObj = document.getElementById("friendName");
        if (inpObj.checkValidity() == false) {
            document.getElementById("addError").innerHTML = inpObj.validationMessage;
        } else {
/*         	document.getElementById("addError").innerHTML = ""; */
        	var form = $('#findFriend')[0];
	        var data = new FormData(form);
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
						$("#friends").append("<form name='viewFriend' action='viewFriend' method='get'><input type='hidden' name='id'  value="+data.value+"><a class='friend'><i class='ion-android-person'></i>"+data.value+"</a></form>"); 
						document.getElementById("addError").innerHTML = "";
					}
					else{
					}
	            }
	        });
        } 
	       
    });
	
 	
 	
	$("#submitBtn").click(function (event) {
	        event.preventDefault();
	        var emptyError = 0;
/* 	        alert($("#plname").val()); */
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
							var plInput ="<input type='hidden' name='name'  value="+data.value+"><a class='navigation__list__item'><i class='ion-ios-musical-notes'></i><span>"+data.value+"</span></a>";
							var plForm = document.createElement('form');
							plForm.name = 'loadPL';
							plForm.action='loadPlaylist';
							plForm.method='get';
							plForm.innerHTML = plInput;
							plForm.onclick = function(e) {
								alert(1);
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

										$("#content").load(jsonBack.value);

									}
								});
							};
							document.getElementById("playlists").appendChild(plForm); 
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
/*  	$("form[name='loadPL']").on("click",function(e){
			alert("here");
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
		}); */
/* 		$('form').on("click",function(e){
			alert("loaddddddddddd");
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
		}); */
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

</body>
</html>
