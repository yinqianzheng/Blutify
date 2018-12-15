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

      <div class="artist__header" >
        <div class="artist__info" style="margin-top:0px">
          <div class="profile__img" style="margin-top:2%;">
            <img src=${artist.imageUrl}  style="border-radius: 0;" />
<!--       <img src=${album.img} alt="" style="border-radius: 0;" /> -->
          </div>

          <div class="artist__info__meta">
            <div class="artist__info__name" style="width:630px; overflow: hidden; white-space: nowrap;text-overflow: initial;">${artist.name}</div>
            <div class="artist__info__description">Total Songs: ${artistInfo.totalSongs}</div>
            <div class="artist__info__description">Total Listeners: ${artistInfo.totalListeners}</div>
            <div class="artist__info__actions">
			<button data-toggle="modal" data-target="#editArtist">
                Edit
              </button>
            </div>

          </div>

        </div>
               <div class="artist__navigation">

          <ul class="nav nav-tabs" role="tablist">

            <li role="presentation" class="active">
              <a href="#artist-overview" aria-controls="artist-overview" role="tab" data-toggle="tab">Overview</a>
            </li>
            <li role="presentation">
              <a href="#artist-album" aria-controls="about-artists" role="tab" data-toggle="tab">Albums</a>
            </li>
            <li role="presentation">
              <a href="#related-artists" aria-controls="related-artists" role="tab" data-toggle="tab">Related Artists</a>
            </li>
          </ul>
        </div>
</div>

       <div class="artist__content">

        <div class="tab-content">

          <!-- Overview -->
    <div role="tabpanel" class="tab-pane active" id="artist-overview">
            <div class="overview">
                          <div class="overview__albums">
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
                      
                      
                      
          <c:forEach items="${artist.songCollection}" var="song" varStatus="songIndex">
                        <div class="track">
                          <div class="track__number">${songIndex.index+1}</div>
                          <div class="track__added">
                          </div>
                          <div class="track_album__title">${song.name}</div>
                          <div class="track__artist">${song.artistId.name}</div>
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
                      <a class="navigation__list__sub" id="alsubdropdownMenu">Add to playlist <span class="caret"></span></a>
                      <ul class="dropdown-menu" aria-labelledby="alsubdropdownMenu">
                          <c:forEach items="${user.playlistCollection}" var="pl">
                            <li>
                                   <form name="addToPL" action="addSong" method="post">
                                       <input name="name" value=${pl.name}  type="hidden"/>
                                       <input name="id"   value=${song.id} type="hidden"/>
                                       
                                 <a class="navigation__list__subItem">${pl.name}
                                     </a>
                                 
                                </form>
                                </li>
                            </c:forEach>
                      </ul>
                    </li>
                    </ul>
                </div>
                          </div>          
                          </div>
                          <br>
            </c:forEach>

    </div>
    </div>
    </div>
    </div>
        </div>
      </div>
      
         <div role="tabpanel" class="tab-pane" id="artist-album">
			<div class="media-cards">
			<c:forEach items="${albums}" var="album">
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
      
       <div role="tabpanel" class="tab-pane" id="related-artists">
            <div class="media-cards">
              <div class="media-card">
                <div class="media-card__image" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/7022/hoodie.jpg);">
                  <i class="ion-ios-play"></i>
                </div>
                <a class="media-card__footer">Hoodie Allen</a>
              </div>
            </div>
          </div>
    </div>
  </div>

	<div class="modal fade" id="editArtist" tabindex="-1" role="dialog" aria-labelledby="edit-profile-label" aria-hidden="true">
   		<div class="modal-dialog">
		<form name="editArtist" class="modal-content animate" action="saveArtistEdit" method="get">
			<div class="modal-content">
				<h4 class="modal-title" style="border-bottom: 1px solid #aaaaaa">Edit Artist</h4>
	            <div class="modal-body">		
		            <div class="row">
			            <div class="col-md-4" style="margin-top: 4%">
							<label for="">artistName</label>
      	 					<input type="text" id="artistName" name="artistName" value=${artist.name} >
						</div>
						<div class="col-md-8 product_content">
							<label for="">Biography</label>
      	 					<textarea id="artistBio" name="artistBio" rows="7" cols="42" >${artist.biography}</textarea>
						</div>
					</div>
					<div class="wrapper">
						<button class="button button6" type="submit">
							Submit
						</button>
						<button class="button button7" data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
			</div>
		</form>
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

/* $("form[name='followArtist']").on("click",function(e){
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

$(document).ready(function() { */
  /*  loadAlbumToP(); */
    // Configure/customize these variables.
/*   $('.dropdown-submenu a.navigation__list__sub').on("click", function(e){
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
  
});  */
</script>
</body>
</html>