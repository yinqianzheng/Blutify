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
  
  </style>
  
<%--   <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
<!--
  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'> -->
 --%> 
<%--   <style type="text/css">
  <%@ include file="../../resources/css/style.css" %>
  </style>  --%>

  
</head>
<body>

      <div class="artist__header" >
        <div class="artist__info">
    <div class="row" style="margin-left:2%;">
          <div class="profile__img" style="margin-top:2%;">
            <img src=${currentArtist.imageUrl}  style="border-radius: 0;" />
<!--       <img src=${album.img} alt="" style="border-radius: 0;" /> -->
          </div>

          <div class="artist__info__meta">
            <div class="artist__info__name" style="width:630px; overflow: hidden; white-space: nowrap;text-overflow: initial;">${currentArtist.name}</div>
<%--       <div class="artist__info__description" id="desc" style="width:30em;  word-wrap: break-word;">${currentArtist.biography}</div> --%>
      <div class="artist__info__owner">Created by: ${currentArtist.name}</div>
            <div class="artist__info__actions">
        <button class="button-dark" onclick="setPlaylistQueue()">
                <i class="ion-ios-play"></i>
                Play
              </button>

              <form name="followArtist" action="followArtist" method="post">
                <input  type="hidden" name="id" value=${currentArtist.id}>
                <button id="followArtist" type="submit" class="button-light save" style='${color}' onclick="followArtist()">${followStatus}</button>
              </form>
        
              <button class="button-light more">
                <i class="ion-ios-more"></i>
              </button>

            </div>

          </div>

    </div>
        </div>
               <div class="artist__navigation">

          <ul class="nav nav-tabs" role="tablist">

            <li role="presentation" class="active">
              <a href="#artist-overview" aria-controls="artist-overview" role="tab" data-toggle="tab">Overview</a>
            </li>
            <li role="presentation">
              <a href="#about-artists" aria-controls="about-artists" role="tab" data-toggle="tab">About</a>
            </li>
            <li role="presentation">
              <a href="#related-artists" aria-controls="related-artists" role="tab" data-toggle="tab">Albums</a>
            </li>
          </ul>
        </div>
</div>

       <div class="artist__content">

        <div class="tab-content">

          <!-- Overview -->
    <div role="tabpanel" class="tab-pane active" id="artist-overview">
            <div class="overview">
              <div class="overview__artist">
                <div class="section-title">His/her Albums</div>

          <div class="media-cards">
			<c:forEach items="${currentArtist.albumCollection}" var="album">
	 			<div class="media-card">
	 			<form id="loadAL" name="loadAL" action="viewAlbum" method="get">
				<input id="loadName" type="hidden" name="id" value=${album.id} >
                <div class="media-card__image" style="height:150px; width: 160px; background-image: url(${album.imageUrl});">

                </div>
                <a class="media-card__footer" id="loadA" style="width: 160px">${album.name}</a>
				</form>
              </div>
	 		</c:forEach>
            </div>
                

                <!-- / -->
              </div>

              
              
              
              
                          <div class="overview__albums">
                <div class="overview__albums__head">
                  <span class="section-title">His/her Songs</span>
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
			
          <c:forEach items="${currentArtist.songCollection}" var="song" varStatus="songIndex">
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
      
                <div role="tabpanel" class="tab-pane" id="about-artists">
	         <h3 style="color: #1cbd62; padding-bottom: 10px">His/her Biography </h3>
	         <div class="well card profile" id="">
				<div><p style="color: black; font-size: 14px">${currentArtist.biography}</p></div>
			</div>
          </div>
      
       <div role="tabpanel" class="tab-pane" id="related-artists">
             <div class="media-cards">
            <c:forEach items="${currentArtist.albumCollection}" var="album">
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
    </div>
  </div>

 


<script>
/* function albumloadSong(){
  while (document.getElementById("alSongArea").firstChild) {
    document.getElementById("alSongArea").removeChild(document.getElementById("alSongArea").firstChild);
  }  
  <c:forEach items="${currentAlbum.songCollection}" var="song" varStatus="songIndex">
    var altrackdiv = document.createElement('div');
    altrackdiv.className = "track";
    altrackdiv.innerHTML = "<div class='track__number'>${songIndex.index+1}</div><div class='track__added'></div><div class='track_album__title'>${song.name}</div><div class='track__artist'>${song.artistId.name}</div><div class='track__time'>${song.duration}</div><div class='track__more'><div class='dropdown'><button class='button-light' type='button' data-toggle='dropdown'><i class='ion-ios-more'></i></button><ul class='dropdown-menu'><li> <a class='navigation__list__item' onclick=\"addToQueue(\'${song.name}\',\'${song.content}\')\">Add to queue</a></li><li class='dropdown-submenu'><a class='navigation__list__sub' id='alsubdropdownMenu'>Add to playlist <span class='caret'></span></a><ul class='dropdown-menu' aria-labelledby='alsubdropdownMenu'>";
    /* <c:forEach items='${user.playlistCollection}' var='pl'>
      var alinner = document.createElement('div');
      aliner.className = "alinner";
      aliner.innerHTML = "<li><form name='addToPL' action='addSong' method='post'><input name='name' type='hidden' value=${pl.name} ><input name='id'  type='hidden' value=${song.id} ><a class='navigation__list__subItem'>${pl.name}</a></form></li>";
      var aloutinner = document.createElement('div');
      aloutinner.className = "outinner";
      aloutinner.appendChild(alinner);
    </c:forEach>
    altrackdiv.appendChild(aloutinner); */
    /*    document.getElementById("alSongArea").appendChild(altrackdiv);
  </c:forEach>
  
}   */
/* function changeSave(){
  var save = document.getElementById("saved");
  if (save.innerHTML == "UnSave"){
    save.innerHTML = "Save";
  }else
  {
    save.innerHTML = "UnSave";

  }
} */

$("form[name='followArtist']").on("click",function(e){
  e.preventDefault();
  var save = document.getElementById("followArtist");
  if (save.innerHTML == "Follow"){
    var actionurl = "followArtist"
    var actiontype = "post";
    jQuery.support.cors = true;
    $.ajax({
      url: actionurl,
      type: actiontype,
      dataType: 'application/json', 
      data: $(this).serialize(),
      complete: function(json) {
      save.innerHTML = "Followed";
      save.style.color ="#1ed780";
      }
    });
  }else
  {
    var actionurl = "unFollowArtist"
      var actiontype = "post";
      jQuery.support.cors = true;
      $.ajax({
        url: actionurl,
        type: actiontype,
        dataType: 'application/json', 
        data: $(this).serialize(),
        complete: function(json) {
          save.innerHTML = "Follow";
          save.style.color ="#aaaaaa";
        }
      });

  }
  
});

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
  /*  loadAlbumToP(); */
    // Configure/customize these variables.
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