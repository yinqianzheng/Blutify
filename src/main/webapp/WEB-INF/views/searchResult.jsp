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
  

  
</head>
<body>
      <div class="Search Result">
      <div class="row" style="padding-left: 15px;height: 60px">
      	<div class="col-sm-8">
      	<h3> Research Result</h3>
      	</div>
      	<div class="col-sm-4" style="padding-top: 10px">
			<input type="text" id="myInput" placeholder=" Search..">
      	</div>

      	<hr>
      	</div>
		</div>
 <div class="artist__header" >
               <div class="artist__navigation">
          <ul class="nav nav-tabs" role="tablist">
			<li role="presentation"  class="active">
              <a href="#Songs" aria-controls="Songs" role="tab" data-toggle="tab">Songs</a>
            </li>
            <li role="presentation">
              <a href="#Albums" aria-controls="Albums" role="tab" data-toggle="tab">Albums</a>
            </li>
            <li role="presentation">
              <a href="#Artists" aria-controls="Artists" role="tab" data-toggle="tab">Artists</a>
            </li>
            <li role="presentation">
              <a href="#Playlists" aria-controls="Playlists" role="tab" data-toggle="tab">Playlists</a>
            </li>

          </ul>
        </div>
</div>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane" id="Albums">
            <div class="media-cards">
			<c:forEach items="${searchResultAlbums}" var="album">
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
			      <c:forEach items="${searchResultArtists}" var="artist">
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
            <div class="media-cards"  id="playlistSearchResult">
<%--  			<c:forEach items="${searchResultPlaylists}" var="playlist">
	 			<div class="media-card">
	 			<form name="loadPublicPlaylist" action="loadPlaylist" method="get">
	 			<input type="hidden" name="name" value=${playlist.name} >
                <div class="media-card__image" style="height:150px; width: 200px; background-image: url(${playlist.imageUrl});">

                </div>
                <a class="media-card__footer" style="width: 200px"onclick="loadPlaylist()">${playlist.name}</a>
				</form>
              </div>
	 		</c:forEach> --%>
            </div>
          </div>
          
          <div role="tabpanel" class="tab-pane active" id="Songs">
              <div class="overview" style="padding-left: 15px">
            <!-- song area -->
                <div class="overview__albums">
                
                <div class="album">
                   <div class="album__tracks">
                    <div class="tracks">
                      <div class="tracks__heading">
                        <div class="tracks__heading__number">#</div>
                         <div class="tracks__heading__play"></div>
						<div class="tracks__heading__title">Title</div>
                        <div class="tracks__heading__artist">ARTIST</div>
                        <div class="tracks__heading__album">Album</div>
                        <div class="tracks__heading__time">Time</div>
                        <div class="tracks__heading__more">
                          MORE
                        </div>
                      </div>                 
           <c:forEach items="${searchResultSongs}" var="song" varStatus="songIndex">
                        <div class="track">
                         <div class="track__number">${songIndex.index+1}</div>
                           <div class="track__added"  style="display: none">
                          	<i class="ion-checkmark-round added"></i>
                          </div>
                          <div class="track__not_added" >
                          	<i class="ion-plus not-added"></i>
                          </div>
                          
                        <div class="track__title">${song.name}</div>
                          <div class="track__artist">${song.artistId.name}</div>
                          <div class="track__album">${song.songAlbumId.name}</div>
                          <div class="track__time">${song.duration}</div>  
                          <div class="track__more" style="right:0;">
								<div class="dropdown">
									<button class="button-light" type="button" data-toggle="dropdown"><i class="ion-ios-more"></i></button>
										<ul class="dropdown-menu">
											<li>
											<a class="navigation__list__item" onclick="addToQueue('${song.name}', '${song.content}')">Add to queue</a>
											</li>
											<li>
											<a class="navigation__list__item">delete</a>
											</li>
											<li class="dropdown-submenu">
											<a class="navigation__list__sub">Add to playlist <span class="caret"></span></a>
											<ul class="dropdown-menu">
											</ul>
										</li>
										</ul>
								</div>
                        	</div>	     
                          </div>
             </c:forEach> 
    </div>
    </div>
    </div>
    </div>
                <!-- song area end -->
        
       
        </div>
		</div>
		</div>

 
<!--     <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> -->

<script>
$(document).ready(function(){
	<c:forEach items="${searchResultPlaylists}" var="playlist1">
	var di = document.createElement("div");
	di.className = "media-card";
	var diinner1 = "<input type='hidden' value=${playlist1.publicStatus}><form name='loadPublicPlaylist' action='loadPlaylist'  method='get'><input type='hidden' name='name'  value=${playlist1.name}><div class='media-card__image' style='height:150px; width: 200px; background-image: url(";
	var ipath = "/Blue/resources/FileSystem/${currentFriend.email}/${playlist1.imageUrl}";		
	var diinner2 = ");'></div><a class='media-card__footer' style='width: 200px;'>${playlist1.name}</a></form>";
	var diinner = diinner1 + ipath + diinner2;
	di.innerHTML = diinner;
	document.getElementById("playlistSearchResult").appendChild(di);
	</c:forEach>



	$("form[name='loadPublicPlaylist']").on("click",function(e){
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
	    document.getElementById("content").style.background = "#181818";
	   }
	  });
	 });

	 
	$(".track__not_added").click(function (event) {
    	document.getElementsByClassName("track__not_added")[0].style.display = "none";
  		document.getElementsByClassName("track__added")[0].style.display = "block"; 
   		var researchtSongList = document.getElementsByClassName("track")[0].children[3];
/*   		for (var i = 0; i < researchtSongList.length; i++) {
  			alert(researchtSongList[i].innerHTML);
    		} */
  		
   		/*  		itemsArr.sort(function(a, b) {
  		  return a.children[2].innerHTML == b.children[2].innerHTML
  		          ? 0
  		          : (a.children[2].innerHTML < b.children[2].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		 */
  	});
  	
   	$(".track__added").click(function (event) {
    	document.getElementsByClassName("track__not_added")[0].style.display = "block";
  		document.getElementsByClassName("track__added")[0].style.display = "none"; 
   		/* var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[2].innerHTML == b.children[2].innerHTML
  		          ? 0
  		          : (a.children[2].innerHTML > b.children[2].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		 */
  	});
});
</script>
</body>
</html>