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
      	<img id="profileImg" src="<c:url value="/resources/images/freepik.jpeg" />" class="img-responsive" /> 
        
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
          <li>
<%--            	<form action="portfolio" method="post">
				<button class="buttonLink" type="submit">Account</button>
			</form> --%>
         	<a id="profile" href="portfolio">Account</a>
          </li>
          <li><a href="#">Settings</a></li>
          <li>
          	<form action="logout" method="post">
				<button class="buttonLink" type="submit">Log out</button>
			</form>
          </li>
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
						   <a class="navigation__list__item" onclick='load()'>
				            <i class="ion-ios-musical-notes"></i>
				            <span>${pl.name}</span>
				          </a>
						    </form>
						</c:forEach>
		<!-- 				<button onclick="check()"></button> -->

        </div>

      </div>

    </section>
</div>
</section>
  










    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
 
<%-- 	<spring:url value="/resources/js/jquery.jplayer.min.js" var="jplayerJs" />
	<script src="${jplayerJs}"></script> --%>
<script>

</script>

</body>
</html>
