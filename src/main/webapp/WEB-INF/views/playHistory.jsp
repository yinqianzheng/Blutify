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
            <div role="tabpanel" class="tab-pane active" id="artist-overview">
            <div class="overview">
              <div class="overview__albums">
                <div class="overview__albums__head" >
                  <span class="section-title" style="font-size: 20px">Listen history</span>
                </div>
                <div class="album">
                   <div class="album__tracks">
                    <div class="tracks">
                      <div class="tracks__heading">
                        <div class="tracks__heading__number">#</div>
                         <div class="tracks__heading__play"></div>
                        <div class="tracks__heading__title">Song</div>
                        <div class="tracks__heading__artist">ARTIST</div>
                        <div class="tracks__heading__album">Album</div>
                        <div class="tracks__heading__time">Time</div>
                      </div>
					<div id="plSongArea">
						<c:forEach items="${user.songHistoriesCollection}" var="song" varStatus="songIndex">
                     		<div class="track">
                        	<div class="track__number">${songIndex.index+1}</div>
                        	<div class="track__added">
                        	</div>
                        	<div class="track__title">${song.name}</div>
                        	<div class="track__artist">${song.artistId.name}</div>
                        	<div class="track__album">
                        		<form name='loadAL' action='viewAlbum' method='get'>
                        			<input type='hidden' name='id' value=${song.songAlbumId.id}>
                        			<a onclick="viewAL()">${song.songAlbumId.name}</a>
                        		</form>
                        	</div>
                        	<div class="track__time">${song.duration}</div>
                        	<br>				
                      		</div>		
						</c:forEach>
					</div>
                  	</div>
                  </div>
                </div>
              </div>
            </div>
          </div> 



</body>
</html>
