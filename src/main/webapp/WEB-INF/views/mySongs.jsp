<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ page import="com.blue.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
      <div class="row" style="padding-left: 15px;height: 60px;">
      	<div class="col-sm-8">
      	<h3>${language.mysonglibrary}</h3>
      	</div>
      	
      	</div>
      	<hr>
      	      	<div style="padding-left:3%">
            <div class="overview">
              <div class="overview__albums">
                <div class="album">
                   <div class="album__tracks">
                    <div class="tracks">
                      <div class="tracks__heading">
                        <div class="tracks__heading__number">#</div>
                         <div class="tracks__heading__play"></div>
                        <div class="tracks__heading__title" id="playlistTitleSongA">Title<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__title" id="playlistTitleSongD" style="display: none">Title<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__artist" id="playlistTitleArtistA" >ARTIST<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__artist" id="playlistTitleArtistD" style="display: none">ARTIST<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__album" id="playlistTitleAlbumA" >Album<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__album" id="playlistTitleAlbumD" style="display: none">Album<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__time" id="playlistTitleTimeA" >Time<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__time" id="playlistTitleTimeD" style="display: none">Time<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__more"> MORE</div>
                      </div>
					<div id="plSongArea">
					</div>
                  	</div>
                  </div>
                </div>
              </div>
            </div>
			</div>
<script>
function removeSongFromMyLibrarySongs(sid){
 	$.ajax({
		url: "removeSongFromMyLibrarySongs",
		type: "post",
		dataType: 'application/json', 
		data: {
			id: sid
		},
		complete: function(json) {
			$("#content").load("mysongs.html", function(){
				mySongsLoadSongs();	
			});
		}
	}); 
}



function mySongsLoadSongs(){
	while (document.getElementById("plSongArea").firstChild) {
		document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
	}  
	<c:forEach items="${user.songCollection}" var="song" varStatus="songIndex">
		var trackdiv = document.createElement('div');
		trackdiv.addEventListener("dblclick", function(){
			setQueue('${song.name}', '${song.content}', '${song.id}');
		});
		trackdiv.className = "track";
		trackdiv.innerHTML = "<div class='track__number'>${songIndex.index+1}</div><div class='track__added'></div><div class='track__title'>${song.name}</div><div class='track__artist'>${song.artistId.name}</div><div class='track__album'><form name='loadAL' action='viewAlbum' method='get'><input type='hidden' name='id' value=${song.songAlbumId.id}><a onclick=\"viewAL()\">${song.songAlbumId.name}</a></form></div><div class='track__time'>${song.duration}</div><div class='track__more'><div class='dropdown'><button class='button-light' type='button' data-toggle='dropdown'><i class='ion-ios-more'></i></button><ul class='dropdown-menu dropdown-menu-left'><li> <a class='caonima' onclick=\"addToQueue(\'${song.name}\',\'${song.content}\')\">Add to queue</a></li><li><a href='#' onclick=\"removeSongFromMyLibrarySongs('${song.id}')\">Remove</a></li></ul></div></div><div style='display: none;'><input type='hidden' value=${song.id}><input type='hidden' value='${song.name}'><input type='hidden' value='${song.content}' ></div>";
		document.getElementById("plSongArea").appendChild(trackdiv);
	</c:forEach>
	
}

/* $(document).ready(function(){
	mySongsLoadSongs();
}); */
</script>
</body>
</html>