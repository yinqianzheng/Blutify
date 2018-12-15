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
  <title></title>


  
</head>
<body>

      <div class="artist__header" >
               <div class="artist__navigation">
          <ul class="nav nav-tabs" role="tablist">

            <li role="presentation" class="active">
              <a href="#Albums" aria-controls="Albums" role="tab" data-toggle="tab">${language.albums}</a>
            </li>
            <li role="presentation">
              <a href="#Artists" aria-controls="Artists" role="tab" data-toggle="tab">${language.artists}</a>
            </li>
     <!--        <li role="presentation">
              <a href="#Playlists" aria-controls="Playlists" role="tab" data-toggle="tab">Playlists</a>
            </li> -->
            <li role="presentation">
              <a href="#Songs" aria-controls="Songs" role="tab" data-toggle="tab">${language.songs}</a>
            </li>
          </ul>
        </div>
</div>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="Albums">
            <div class="media-cards">
			<c:forEach items="${mainAlbums}" var="album">
	 			<div class="media-card">
	 			<form id="loadAL" name="loadAL" action="viewAlbum" method="get">
				<input id="loadName" type="hidden" name="id" value=${album.id} >
                <div class="media-card__image" style="height:150px; width: 200px; background-image: url(${album.imageUrl});">

                </div>
                <a class="media-card__footer" id="loadA" style="width: 200px"onclick="viewAL()">${album.name}</a>
				</form>
              </div>
	 		</c:forEach>
            </div>
          </div>
          
          
             <div role="tabpanel" class="tab-pane" id="Artists">
		      <div class="media-cards">
			      <c:forEach items="${popularArtists}" var="artist">
			      <div class="media-card">
			        <form name="loadArtist" action="viewArtist" method="post">
			        <input type="hidden"  name="id" value=${artist.id}>
			                <div class="media-card__image" style="margin:0 auto; width: 150px;height: 150px;border-radius: 50%;background-image: url(${artist.imageUrl});">
			                </div>
			                 <a class="media-card__footer" style="text-align: center; background-color: inherit" onclick="viewArtist()">${artist.name}</a>
			        </form>
			              </div>
			      </c:forEach>
            </div>
          </div>       
          
           <div role="tabpanel" class="tab-pane" id="Playlists">
            <div class="media-cards">
 			<c:forEach items="${publicPlaylists}" var="playlist">
	 			<div class="media-card">
	 			<form name="loadPlaylist" action="viewPublicPlaylists" method="get">
                <div class="media-card__image" style="height:150px; width: 200px; background-image: url(${playlist.imageUrl});">

                </div>
                <a class="media-card__footer" style="width: 200px"onclick="loadPlaylist()">${playlist.name}</a>
				</form>
              </div>
	 		</c:forEach>
            </div>
          </div>
          
          <div role="tabpanel" class="tab-pane" id="Songs">
               <div class="overview__albums" style="padding-left: 3%">
                <div class="overview__albums__head">
                  <span class="section-title">Songs</span>
                </div>
                <div class="album">
                   <div class="album__tracks">
                    <div class="tracks">
                      <div class="tracks__heading">
                        <div class="tracks__heading__number">#</div>
                         <div class="tracks__heading__play"></div>
                        <div class="tracks__album_heading__title">Song</div>
                        <div class="tracks__heading__artist">
                          ARTIST
                        </div>
                        <div class="tracks__heading__time">
                          Time
                        </div>
                        <div class="tracks__heading__more">
                          MORE
                        </div>
                      </div>
<!--                     <div id="alSongArea">
					</div> -->
                      
                     <div id="plSongArea">
			 		<c:forEach items="${publicSongs}" var="song" varStatus="songIndex">
                     		<div class="track" ondblclick="setQueue('${song.name}', '${song.content}', ${song.id});">
                          <div style='display: none;'>${songIndex.index}</div>
            			<div class='track__number'>${songIndex.index+1}</div>
            			<div class='track__added'>
            				<span style='display: none;' onclick='changeToAddIcon(${songIndex.index})'><i class='ion-checkmark-round added'></i></span>
            				<span style='display: block;' onclick='changeToAddedIcon(${songIndex.index})'><i class='ion-plus not-added' ></i></span>      
            			</div>
            			<div class='track_album__title'>${song.name}</div>
            			<div class='track__artist'>${song.artistId.name}</div>
            			<div class='track__time'>${song.duration}</div>
            			<div class='track__more'>
            				<div class='dropdown'>
            					<button class='button-light' type='button' data-toggle='dropdown'><i class='ion-ios-more'></i></button>
            					<ul class='dropdown-menu'>
            						<li> <a class='navigation__list__item' onclick="addToQueue('${song.name}','${song.content}', ${song.id})">Add to queue</a></li>
            						<li class='dropdown-submenu'>
            							<a class='navigation__list__sub' id='alsubdropdownMenu'>Add to playlist <span class='caret'></span></a>
            							<ul class='dropdown-menu' aria-labelledby='alsubdropdownMenu'>
            								<c:forEach items='${user.playlistCollection}' var='pl'>
            									<li>
            										<form name='addToPL' action='addSong' method='post'>
	            										<input name='name' type='hidden' value=${pl.name}>
	            										<input name='id'  type='hidden' value=${song.id} >
	            										<a class='navigation__list__subItem'>${pl.name}</a>
            										</form>
            									</li>
            								</c:forEach>
            							</ul>
            				</div>
            			</div>     
            			<div></div>   
            			<div><input type='hidden' value=${song.id}><input type='hidden' value='${song.name}'><input type='hidden' value='${song.content}'></div>
              
              
              
              
              
              </div>
						</c:forEach>
						</div>
	
           

		</div>
		</div>
		</div>
		</div>
          </div>
          
          </div>
          
<script>
 function viewAL()
{
	 
 	$("form[name='loadAL']").on("click",function(e){
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
}
/*  function viewArtist()
 {
  	$("form[name='viewArtist']").on("click",function(e){
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
 } */
 
 function loadPlaylist()
 {
 	 
  	$("form[name='loadPlaylist']").on("click",function(e){
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
 }
/*  $('form').on("click",function(e){
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
});  */



$(document).ready(function() {
	var wocaoq = document.getElementById("plSongArea").children;
	for (var i = 0; i < wocaoq.length; i++) {
		var dx = wocaoq[i].children[8].children[0].value;
		<c:forEach items="${user.songCollection}" var="s">
			if(${s.id}==dx){
				wocaoq[i].children[2].children[0].style.display = "block";
				wocaoq[i].children[2].children[1].style.display = "none";
			}
		</c:forEach>
 	}
});
</script>
</body>
</html>