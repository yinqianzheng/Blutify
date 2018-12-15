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
    <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>
  
	<style type="text/css">
	<%@ include file="../../resources/css/style.css" %>
	</style>

  
</head>

<body>
  <section class="header">

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
      	<img src="<c:url value="/resources/images/freepik.jpeg" />"alt="Profile Picture" class="img-responsive" /> 
        
      </span>

      <span class="user__info__name">
      
        <span class="first">${user.nickname}</span>

      </span>

    </div>

    <div class="user__actions">

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          <i class="ion-chevron-down"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
          <li><a href="#">Private Session</a></li>
          <li><a href="#">Account</a></li>
          <li><a href="#">Settings</a></li>
          <li><a href="#">Log Out</a></li>
        </ul>
      </div>

    </div>

  </div>

</section>

<section class="content">

  <div class="content__left">

    <section class="navigation">

      <!-- Main -->
      <div class="navigation__list">

        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#main" aria-expanded="true" aria-controls="main">
          Main
        </div>

        <div class="collapse in" id="main">

          <a href="#" class="navigation__list__item">
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
		               <form id="loadPL" action="loadPlaylist" method="get">
		               		<input type="text" name="name" value=${pl.name} hidden>
						   <a class="navigation__list__item">
				            <i class="ion-ios-musical-notes"></i>
				            <span>${pl.name}</span>
				          </a>
						    </form>
						</c:forEach>

        </div>

      </div>

    </section>

    <section class="playlist">

      <a data-toggle="modal" data-target="#createPL">

        <i class="ion-ios-plus-outline"></i> New Playlist

      </a>

    </section>

    <section class="playing">

      <div class="playing__art">

        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/7022/cputh.jpg" alt="Album Art" />

      </div>

      <div class="playing__song">

        <a class="playing__song__name">Some Type of Love</a>

        <a class="playing__song__artist">Charlie Puth</a>

      </div>

      <div class="playing__add">

        <i class="ion-checkmark"></i>

      </div>

    </section>

  </div>

  <div class="content__middle">
	- 		<div id="content">
	     	</div>

  </div>

  <div class="content__right">

    <div class="social">

      <div class="friends">

        <a href="#" class="friend">

          <i class="ion-android-person"></i> Sam Smith

        </a>


      </div>

      <button class="button-light">Find Friends</button>

    </div>

  </div>

</section>

<section class="current-track">

  <div class="current-track__actions">

    <a class="ion-ios-skipbackward"></a>

    <a class="ion-ios-play play"></a>

    <a class="ion-ios-skipforward"></a>

  </div>

  <div class="current-track__progress">

    <div class="current-track__progress__start">0:01</div>

    <div class="current-track__progress__bar">

      <div id="song-progress"></div>

    </div>

    <div class="current-track__progress__finish">3:07</div>

  </div>

  <div class="current-track__options">

    <a href="#" class="lyrics">Lyrics</a>

    <span class="controls">
    
      <a href="#" class="control">
        <i class="ion-navicon"></i>
      </a>
      
      <a href="#" class="control">
        <i class="ion-shuffle"></i>
      </a>
      
      <a href="#" class="control">
        <i class="fa fa-refresh"></i>
      </a>


    <a href="#" class="control volume">

      <i class="ion-volume-high"></i>

      <div id="song-volume"></div>

    </a>

    </span>

  </div>

</section>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

   <spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script>
	
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

</body>
</html>
