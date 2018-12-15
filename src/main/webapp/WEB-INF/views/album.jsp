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
	<style type="text/css">
	
	</style>
 	
<%--   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
<!--
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'> -->
  
	<style type="text/css">
	<%@ include file="../../resources/css/style.css" %>
	</style> --%>

  
</head>
<body>

      <div class="artist__header" >

        <div class="artist__info">
		<div class="row" style="margin-left:2%;">
          <div class="profile__img" style="margin-top:2%;">

            <img src=${currentAlbum.imageUrl}  style="border-radius: 0;" />
<!-- 		   <img src=${album.img} alt="" style="border-radius: 0;" /> -->
          </div>

          <div class="artist__info__meta">

            <div class="artist__info__name" style="width:630px; overflow: hidden; white-space: nowrap;text-overflow: initial;">${currentAlbum.name}</div>
			<div class="artist__info__description" id="desc" style="width:30em;  word-wrap: break-word;"></div>
			<div class="artist__info__owner">Created by: ${currentAlbum.artistId.name}</div>
            <div class="artist__info__actions">
			  <button class="button-dark" onclick="setPlaylistQueue()">
                <i class="ion-ios-play"></i>
                ${language.play}
              </button>

 							<form name="saveAlbum" action="saveAlbum" method="post">
 								
								<input  type="hidden" name="id" value=${currentAlbum.id}>
								<button id="saved" type="submit" class="button-light" style='${color}' onclick="changeSave()">${saveStatus}</button>
							</form>
<!-- 				
              <button class="button-light more">
                <i class="ion-ios-more"></i>
              </button> -->
              <div class="dropdown">
				<button class="button-light more" type="button" data-toggle="dropdown"><i class="ion-ios-more"></i></button>
					<ul class="dropdown-menu">
						<li>
							 <button onclick="addPlaylistToQueue()">
				               ${language.addtoqueue}
			              </button>
						</li>
					</ul>
			</div>

            </div>

          </div>

		</div>
        </div>



        <div class="artist__navigation" style="z-index: 0">

          <ul class="nav nav-tabs" role="tablist">

            <li role="presentation" class="active">
              <a href="#artist-overview" aria-controls="artist-overview" role="tab" data-toggle="tab">${language.album}</a>
            </li>

   			<li role="presentation">
              <a href="#description" aria-controls="description" role="tab" data-toggle="tab">Description</a>
            </li>

          </ul>


        </div>

      </div>

      <div class="artist__content">

        <div class="tab-content">

      		<div role="tabpanel" class="tab-pane active" id="artist-overview">
            <div class="overview">
              <div class="overview__albums">
                <div class="overview__albums__head">
                  <span class="section-title">${language.songs}</span>
                </div>
                <div class="album">
                   <div class="album__tracks">
                    <div class="tracks">
                      <div class="tracks__heading">
                        <div class="tracks__heading__number">#</div>
                         <div class="tracks__heading__play"></div>
                        <div class="tracks__album_heading__title" id="albumTitleSongA">${language.song}<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__album_heading__title" id="albumTitleSongD" style="display: none">${language.song}<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__artist">${language.artist}</div>
                        <div class="tracks__heading__time" id="albumTitleSTimeA">${language.time}<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__time" id="albumTitleSTimeD" style="display: none">${language.time}<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__more">
                          ${language.more}
                        </div>
                      </div>

                      
                       <div id="plSongArea">
                      
           </div>
		</div>
		</div>
		</div>
		</div>
        </div>
      </div>
		<div role="tabpanel" class="tab-pane" id="description">
	         <h3 style="color: #1cbd62; padding-bottom: 10px">Description </h3>
	         <div class="well card profile" id="">
				<div><span style="color: black; font-size: 14px">${currentAlbum.description}</span></div>
			</div>
          </div>
    </div>

  </div>
<script>
 function albumloadSong(){
	while (document.getElementById("plSongArea").firstChild) {
		document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
	}  
	<c:forEach items="${currentAlbum.songCollection}" var="song" varStatus="songIndex">
		var altrackdiv = document.createElement('div');
		altrackdiv.addEventListener("dblclick", function(){
			setQueue('${song.name}', '${song.content}', ${song.id});
		});
		altrackdiv.className = "track";
		altrackdiv.innerHTML = "<div style='display: none;'>${songIndex.index}</div><div class='track__number'>${songIndex.index+1}</div><div class='track__added'><span style='display: none;' onclick='changeToAddIcon(${songIndex.index})'><i class='ion-checkmark-round added'></i></span>        <span style='display: block;' onclick='changeToAddedIcon(${songIndex.index})'><i class='ion-plus not-added' ></i></span>      </div><div class='track_album__title'>${song.name}</div><div class='track__artist'>${song.artistId.name}</div><div class='track__time'>${song.duration}</div><div class='track__more'><div class='dropdown'><button class='button-light' type='button' data-toggle='dropdown'><i class='ion-ios-more'></i></button><ul class='dropdown-menu'><li> <a class='navigation__list__item' onclick=\"addToQueue(\'${song.name}\',\'${song.content}\', ${song.id})\">Add to queue</a></li><li class='dropdown-submenu'><a class='navigation__list__sub' id='alsubdropdownMenu'>Add to playlist <span class='caret'></span></a><ul class='dropdown-menu' aria-labelledby='alsubdropdownMenu'><c:forEach items='${user.playlistCollection}' var='pl'><li><form name='addToPL' action='addSong' method='post'><input name='name' type='hidden' value=${pl.name}><input name='id'  type='hidden' value=${song.id} ><a class='navigation__list__subItem'>${pl.name}</a></form></li></c:forEach></ul></div></div>     <div></div>   <div><input type='hidden' value=${song.id}><input type='hidden' value='${song.name}'><input type='hidden' value='${song.content}'></div>";
		document.getElementById("plSongArea").appendChild(altrackdiv);
	</c:forEach>
	
}   
/* function changeSave(){
	var save = document.getElementById("saved");
	if (save.innerHTML == "UnSave"){
		save.innerHTML = "Save";
	}else
	{
		save.innerHTML = "UnSave";

	}
} */

$("form[name='saveAlbum']").on("click",function(e){
	e.preventDefault();
	var save = document.getElementById("saved");
	if (save.innerHTML == "Save"||save.innerHTML == '${language.save}'){
			var actionurl = "saveAlbum"
			var actiontype = "post";
			jQuery.support.cors = true;
			$.ajax({
				url: actionurl,
				type: actiontype,
				dataType: 'application/json', 
				data: $(this).serialize(),
				complete: function(json) {
					save.innerHTML = '${language.saved}';
					save.style.color ="#1ed780";
				}
			});

	}else
	{
			var actionurl = "unsaveAlbum"
			var actiontype = "post";
			jQuery.support.cors = true;
			$.ajax({
				url: actionurl,
				type: actiontype,
				dataType: 'application/json', 
				data: $(this).serialize(),
				complete: function(json) {
					save.innerHTML = '${language.save}';
					save.style.color ="#aaaaaa";
				}
			});

	}
	
});

$(document).ready(function() {
	albumloadSong();
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
    // Configure/customize these variables.
      	$("#albumTitleSongA").click(function (event) {
  		document.getElementById("albumTitleSongA").style.display = "none";
  		document.getElementById("albumTitleSongD").style.display = "block";
   		var albumSongList = document.getElementById("plSongArea").children;
   		var AlbumitemsArr = [];
  		for (var i = 0; i < albumSongList.length; i++) {
  			AlbumitemsArr.push(albumSongList[i]);
    		}
  		
  		
  		AlbumitemsArr.sort(function(a, b) {
  		  return a.children[2].innerHTML == b.children[2].innerHTML
  		          ? 0
  		          : (a.children[2].innerHTML < b.children[2].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < AlbumitemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(AlbumitemsArr[i]);
  		}
  		
  	});
  	
  	$("#albumTitleSongD").click(function (event) {
		document.getElementById("albumTitleSongA").style.display = "block";
  		document.getElementById("albumTitleSongD").style.display = "none";
   		var albumSongList = document.getElementById("plSongArea").children;
   		var AlbumitemsArr = [];
  		for (var i = 0; i < albumSongList.length; i++) {
  			AlbumitemsArr.push(albumSongList[i]);
    		}
  		
  		AlbumitemsArr.sort(function(a, b) {
  		  return a.children[2].innerHTML == b.children[2].innerHTML
  		          ? 0
  		          : (a.children[2].innerHTML > b.children[2].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < AlbumitemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(AlbumitemsArr[i]);
  		}
  		
  	});
  	
  	
  	$("#albumTitleSTimeA").click(function (event) {
  	  	
  		document.getElementById("albumTitleSTimeA").style.display = "none";
  		document.getElementById("albumTitleSTimeD").style.display = "block";
   		var albumSongList = document.getElementById("plSongArea").children;
   		var AlbumitemsArr = [];
  		for (var i = 0; i < albumSongList.length; i++) {
  			AlbumitemsArr.push(albumSongList[i]);
    		}
  		
  		
  		AlbumitemsArr.sort(function(a, b) {
  		  return a.children[5].innerHTML == b.children[5].innerHTML
  		          ? 0
  		          : (a.children[5].innerHTML < b.children[5].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < AlbumitemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(AlbumitemsArr[i]);
  		}
  		
  	});
  	
  	$("#albumTitleSTimeD").click(function (event) {
		document.getElementById("albumTitleSTimeA").style.display = "block";
  		document.getElementById("albumTitleSTimeD").style.display = "none";
   		var albumSongList = document.getElementById("plSongArea").children;
   		var AlbumitemsArr = [];
  		for (var i = 0; i < albumSongList.length; i++) {
  			AlbumitemsArr.push(albumSongList[i]);
    		}
  		
  		AlbumitemsArr.sort(function(a, b) {
  		  return a.children[5].innerHTML == b.children[5].innerHTML
  		          ? 0
  		          : (a.children[5].innerHTML > b.children[5].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < AlbumitemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(AlbumitemsArr[i]);
  		}
  		
  	});
	$('.dropdown-submenu a.navigation__list__sub').on("click", function(e){
		$(this).next('ul').toggle();
		e.stopPropagation();
		e.preventDefault();
	});
    
 	$(function () {
        $("form[name='addToPL']").on("click", function(e) {
        	e.preventDefault();
        	var actionurl = $(this).closest('form').attr('action');
    		var actiontype = $(this).closest('form').attr('method'); 
    		jQuery.support.cors = true;
    		$.ajax({
    			url: actionurl,
    			type: actiontype,
    			dataType: 'application/json', 
    			data: $(this).serialize(),
    			complete: function(json) {
    			}
    		});
        });
    });
	
}); 
</script>
</body>
</html>