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
  <title>Playlist</title>

<style>

</style>
</head>

<body>
<div class="artist is-verified">

      <div class="artist__header" style="border:0px">

        <div class="artist__info">

          <div class="profile__img" >

            <img id="playlistCoverImg" style="border-radius: 0 !important;" src='${imageFile}' />
<!--             <label for="changePlaylistImage" class="btn">
			   change Image..
			</label>
			<input type="file" style="display:none" id="changePlaylistImage" name= "image" onclick="changePlaylistImg()"/> -->

          </div>

          <div class="artist__info__meta">

            <div class="artist__info__type">Playlist</div>

            <div class="artist__info__name" id="playListName">${currentPlaylist.name}</div>
			<div class="artist__info__description" id="playListDes">${currentPlaylist.description}</div>
			<div class="artist__info__owner">Created by: ${currentPlaylist.creater}</div>
            <div class="artist__info__actions">

              <button class="button-dark" onclick="setPlaylistQueue()">
                <i class="ion-ios-play"></i>${language.play}</button>
               				<form name="followPL" action="followPlaylist" method="post">
								<input  type="hidden" name="id" value=${currentPlaylist.id}>
								<button id="followed" type="submit" class="button-light save">Follow</button>
							</form>
			<div id="hideplaylistdiv">
			<div class="dropdown">
				<button class="button-light" type="button" data-toggle="dropdown"><i class="ion-ios-more"></i></button>
					<ul class="dropdown-menu">
						<!-- <li><a class="navigation__list__item">Share to public</a></li> -->
						<li><a class="navigation__list__item" data-toggle="modal" data-target="#editPL">${language.editplaylist}</a></li>
						<li>
							 <a class="navigation__list__item" onclick="addPlaylistToQueue()">${language.addtoqueue}</a>
						</li>
						<li>
 							<form name="deletePL" action="deletePlaylist" method="post">
								<input type="hidden" id="aftereditname" name="name" value=${currentPlaylist.name}>
								<button class="navigation__list__item" style="width: 100%;border-radius: 0; background-color: white; color: #aaaaaa; font-size:12px; padding-left: 20px" type="submit">${language.delete}</button>
							</form>
<!-- 							<a class="navigation__list__item" href="deletePlaylist">Delete</a> -->
						</li>
					</ul>
			</div>
			</div>
            </div>
          </div>
        </div>
      </div>

      <div class="artist__content">
      <div class="searchbar">
		<input type="text" id="myInput" placeholder=" Search for names..">
	  </div>
        <div class="tab-content">
          <!-- Overview -->
<!--           <div role="tabpanel" class="tab-pane active" id="artist-overview">
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
                        <div class="tracks__heading__title">Song</div>
                        <div class="tracks__heading__length">
                          ARTIST
                        </div>
                        <div class="tracks__heading__popularity">
                          MORE
                        </div>
                      </div>
					<div id="plSongArea">
					</div>
                  	</div>
                  </div>
                </div>
              </div>
            </div>
          </div> -->
          <!-- / -->

          <!-- Related Artists -->
<!--           <div role="tabpanel" class="tab-pane" id="related-artists">
            <div class="media-cards">
              <div class="media-card">
                <div class="media-card__image" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/7022/hoodie.jpg);">
                  <i class="ion-ios-play"></i>
                </div>
                <a class="media-card__footer">Hoodie Allen</a>
              </div>
            </div>
          </div> -->
          <!-- / -->

          <!-- About // Coming Soon-->
          <!--<div role="tabpanel" class="tab-pane" id="artist-about">About</div>-->
          <!-- / -->

        </div>
<%--         <div class="table-content" style="padding: 0px; margin-left: 3%">
    	
             <div class="row" ">
			    <div class="col-sm-1 " >#</div>
			    <div class="col-md-5 ">Title </div>
			    <div class="col-md-3" >ARTIST </div>
			    <div class="col-md-1" >Duration</div>
			    <div class="col-md-1" >More </div>
			   </div>
		<div class="pl-header" style="border-bottom: 2px solid white; width: 88%">
		</div>
		<div class="pl-body">  
		<c:forEach items="${currentPlaylist.songCollection}" var="song" varStatus="songIndex">
			     <div class="row">
			    <div class="col-sm-1 " >${songIndex.index+1}</div>
			    <div class="col-md-5 " >${song.name} </div>
			    <div class="col-md-3" >${song.artistId.name} </div>
			    <div class="col-md-1" >${song.duration}</div>
			    <div class="col-md-1" >
			    	<div class="dropdown">
									<button class="button-light" type="button" data-toggle="dropdown"><i class="ion-ios-more"></i></button>
										<ul class="dropdown-menu">
											<li> <a href="#" onclick="addToQueue('${song.name}', '${song.content}')">Add to queue</a></li>
											<li><a href="#" onclick="delteSongPL()">delete</a></li>
											<li>
												<a class="test" href="#">Add to playlist <span class="caret"></span></a>
											</li>
										</ul>
								</div>
			    </div>
			   </div>
		</c:forEach>
        </div>
        </div>    --%>

          <!-- Overview -->
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
                        <div class="tracks__heading__title" id="playlistTitleSongA">${language.song}<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__title" id="playlistTitleSongD" style="display: none">${language.song}<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__artist" id="playlistTitleArtistA" >${language.artist}<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__artist" id="playlistTitleArtistD" style="display: none">${language.artist}<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__album" id="playlistTitleAlbumA" >${language.album}<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__album" id="playlistTitleAlbumD" style="display: none">${language.album}<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__time" id="playlistTitleTimeA" >${language.time}<i class="ion-arrow-down-b"></i></div>
                        <div class="tracks__heading__time" id="playlistTitleTimeD" style="display: none">${language.time}<i class="ion-arrow-up-b"></i></div>
                        <div class="tracks__heading__more"> ${language.more}</div>
                      </div>
					<div id="plSongArea">
					</div>
                  	</div>
                  </div>
                </div>
              </div>
            </div>
          </div> 
          <!-- / -->



      </div>

    </div>
 <div class="modal fade" id="editPL">
	<div class="modal-dialog">
		<form id="editPlForm" class="modal-content animate" method="post">
			<div class="modal-content">
				<h4 class="modal-title">Edit PlayList</h4>
				<input id="editPLE" class="input-p" disabled/>
	            <div class="modal-body">
	            		<input type="hidden" id="editploldname" name="name" value='${currentPlaylist.name}' >
		            <input type="text" id="editplname" class="form-control input-sm chat-input" name="newName" value='${currentPlaylist.name}' placeholder='${currentPlaylist.name}'/>
		            <div class="row">
			            <div id="img-group" class="col-md-4">
			            	<div class="img-content">
			            		<img id ="playlistCover" class="plImg" src="${imageFile}">
			            		<label for="file" id="label-button" class="btn">
			            			change Image..
			            		</label>
			            		<input type="file" style="display:none" id="file" name= "image" onclick="changeImg()"/>
			            	</div>
						</div>
						<div class="col-md-8 product_content">
							<span>Description</span>
							<textarea rows="7" cols="42" style="color: black" id="plarea" name="description" placeholder=${currentPlaylist.description}></textarea>
						</div>
					</div>
					<div class="wrapper">
						<button id="editSubmit" class="button button6" type="submit">
							Submit
						</button>
						<button id="close10" class="button button7" data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
 <%--  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

   <spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script> --%>
	
<script>

/*  function changeFollow(){
	var follow = document.getElementById("followed");
 	var unfollow = document.getElementById("unfollow"); 
	if (follow.innerHTML == "Unfollow"){
		follow.innerHTML = "Follow";
	}else
	{
		follow.innerHTML = "Unfollow";

	}
} */

function removeSongFromPlaylist(sid, pname){
	$.ajax({
		url: "removeSongFromPlaylist",
		type: "post",
		dataType: 'application/json', 
		data: {
			id: sid,
			name: pname
		},
		complete: function(json) {
			$("#content").load("playlist.html");
		}
	});
}

function ppLoadSongs(){
	while (document.getElementById("plSongArea").firstChild) {
		document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
	}  
	<c:forEach items="${currentPlaylist.songCollection}" var="song" varStatus="songIndex">
		var trackdiv = document.createElement('div');
		trackdiv.addEventListener("dblclick", function(){
			setQueue('${song.name}', '${song.content}', ${song.id});
		});
		trackdiv.className = "track";
		trackdiv.innerHTML = "<div class='track__number'>${songIndex.index+1}</div><div class='track__added'><i class='ion-checkmark-round added'></i></div><div class='track__title'>${song.name}</div><div class='track__artist'>${song.artistId.name}</div><div class='track__album'><form name='loadAL' action='viewAlbum' method='get'><input type='hidden' name='id' value=${song.songAlbumId.id}><a onclick=\"viewAL()\">${song.songAlbumId.name}</a ></form></div><div class='track__time'>${song.duration}</div><div class='track__more'><div class='dropdown'><button class='button-light' type='button' data-toggle='dropdown'><i class='ion-ios-more'></i></button><ul class='dropdown-menu dropdown-menu-left'><li> <a class='caonima' onclick=\"addToQueue(\'${song.name}\',\'${song.content}\')\">Add to queue</a ></li><li><a onclick=\"removeSongFromPlaylist('${song.id}', '${currentPlaylist.name}')\">Remove</a ></li><li class='dropdown-submenu'><a class='navigation__list__sub' id='alsubdropdownMenu'>Add to playlist <span class='caret'></span></a ><ul class='dropdown-menu' aria-labelledby='alsubdropdownMenu'><c:forEach items='${user.playlistCollection}' var='pl'><li><form name='addToPL' action='addSong' method='post'><input name='name' type='hidden' value=${pl.name}><input name='id'  type='hidden' value=${song.id} ><a class='navigation__list__subItem'>${pl.name}</a ></form></li></c:forEach></ul></div></div><div></div><div style='display: none;'><input type='hidden' value=${song.id}><input type='hidden' value='${song.name}'><input type='hidden' value='${song.content}' ></div>";
		document.getElementById("plSongArea").appendChild(trackdiv);
	</c:forEach>
	
}

$("form[name='followPL']").on("click",function(e){
	e.preventDefault();
	var save = document.getElementById("followed");
	if (save.innerHTML == "Follow"){
			var actionurl = "followPlaylist"
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
			var actionurl = "unFollowPlaylist"
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

function playlistHideSomeBtn(){
  	if(${user.id}==${currentPlaylist.ownerId.id}){
  	  	
  		
		document.getElementById("followed").style.display = "none";
		var wocaoq = document.getElementById("plSongArea").children;
		for (var i = 0; i < wocaoq.length; i++) {
			wocaoq[i].children[1].innerHTML = "";

			/* hide add to playlist */
 			wocaoq[i].children[6].children[0].children[1].children[2].innerHTML="";
 	 	}
  	}else{
  	  	
  		document.getElementById("hideplaylistdiv").style.display = "none";
  		document.getElementById("followed").style.display = "none";
  		var wocaoq = document.getElementById("plSongArea").children;
		for (var i = 0; i < wocaoq.length; i++) {
			var dx = wocaoq[i].children[8].children[0].value;
			for (var i = 0; i < wocaoq.length; i++) {
				/* hide remove */
				wocaoq[i].children[1].children[0].style.display = "none";
	 			wocaoq[i].children[6].children[0].children[1].children[1].innerHTML="";
	 	 	}
			<c:forEach items="${user.songCollection}" var="s">
				if(${s.id}==dx){
					wocaoq[i].children[1].children[0].style.display = "block";
					wocaoq[i].children[1].children[1].style.display = "none";
				}
			</c:forEach>
	 	}
  	}
}

$(document).ready(function(){
  	ppLoadSongs(); 
/*   	<c:forEach items="${user.playlistCollection}" var="pl">
		if(${pl.id}==${currentPlaylist.id}){
			document.getElementById("followed").style.display = "none";
			var wocaoq = document.getElementById("plSongArea").children;
			for (var i = 0; i < wocaoq.length; i++) {
				wocaoq[i].children[1].innerHTML = "";
		 	}
	  	}
	</c:forEach> */

	playlistHideSomeBtn();

	
  	$("#playlistTitleSongA").click(function (event) {
  		document.getElementById("playlistTitleSongA").style.display = "none";
  		document.getElementById("playlistTitleSongD").style.display = "block";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
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
  		
  	});
  	
  	$("#playlistTitleSongD").click(function (event) {
		document.getElementById("playlistTitleSongA").style.display = "block";
  		document.getElementById("playlistTitleSongD").style.display = "none";
   		var playlistSongList = document.getElementById("plSongArea").children;
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
  		
  	});
  	
  	
  	$("#playlistTitleArtistA").click(function (event) {
  		document.getElementById("playlistTitleArtistA").style.display = "none";
  		document.getElementById("playlistTitleArtistD").style.display = "block";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[3].innerHTML == b.children[3].innerHTML
  		          ? 0
  		          : (a.children[3].innerHTML < b.children[3].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		
  	});
  	
  	$("#playlistTitleArtistD").click(function (event) {
		document.getElementById("playlistTitleArtistA").style.display = "block";
  		document.getElementById("playlistTitleArtistD").style.display = "none";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[3].innerHTML == b.children[3].innerHTML
  		          ? 0
  		          : (a.children[3].innerHTML > b.children[3].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		
  	});
  	
  	$("#playlistTitleAlbumA").click(function (event) {
  		document.getElementById("playlistTitleAlbumA").style.display = "none";
  		document.getElementById("playlistTitleAlbumD").style.display = "block";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[4].innerHTML == b.children[4].innerHTML
  		          ? 0
  		          : (a.children[4].innerHTML < b.children[4].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		
  	});
  	
  	$("#playlistTitleAlbumD").click(function (event) {
		document.getElementById("playlistTitleAlbumA").style.display = "block";
  		document.getElementById("playlistTitleAlbumD").style.display = "none";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[4].innerHTML == b.children[4].innerHTML
  		          ? 0
  		          : (a.children[4].innerHTML > b.children[4].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		
  	});
  	
  	
  	
  	$("#playlistTitleTimeA").click(function (event) {
  		document.getElementById("playlistTitleTimeA").style.display = "none";
  		document.getElementById("playlistTitleTimeD").style.display = "block";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[5].innerHTML == b.children[5].innerHTML
  		          ? 0
  		          : (a.children[5].innerHTML < b.children[5].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		
  	});
  	
  	$("#playlistTitleTimeD").click(function (event) {
		document.getElementById("playlistTitleTimeA").style.display = "block";
  		document.getElementById("playlistTitleTimeD").style.display = "none";
   		var playlistSongList = document.getElementById("plSongArea").children;
   		var itemsArr = [];
  		for (var i = 0; i < playlistSongList.length; i++) {
  			itemsArr.push(playlistSongList[i]);
    		}
  		
  		itemsArr.sort(function(a, b) {
  		  return a.children[5].innerHTML == b.children[5].innerHTML
  		          ? 0
  		          : (a.children[5].innerHTML > b.children[5].innerHTML ? 1 : -1);
  		});
  		
  		
  		while (document.getElementById("plSongArea").firstChild) {
  			document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
  		} 
  		
  		for (i = 0; i < itemsArr.length; i++) {
  			document.getElementById("plSongArea").appendChild(itemsArr[i]);
  		}
  		
  	});
	$("#editPlForm").submit(function(e){
		var oldname = document.getElementById("editploldname").value;
		e.preventDefault();
    		var form = $(this)[0];
        var data = new FormData(form);
 		jQuery.support.cors = true;
		$.ajax({
			type: "POST",
            enctype: 'multipart/form-data',
            url: "editPlaylist",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            complete: function (json) {
            	var data = jQuery.parseJSON(json.responseText);
				document.getElementById("playListName").innerHTML = data.name;
				document.getElementById("playListDes").innerHTML = data.description;
				document.getElementById("playlistCoverImg").src = data.imageFile;
				document.getElementById("editploldname").value = data.name;
				document.getElementById("aftereditname").value = data.name;
				
				
			    var pchildren = document.getElementById("playlists").children;
			    for (var i = 0; i < pchildren.length; i++) {
			        var pc = pchildren[i].children[0].value;
			        if(pc==oldname){
			        		pchildren[i].children[0].value = data.name;
			        		pchildren[i].children[1].children[1].innerHTML = data.name;
			        }
			      }
	          	document.getElementById("close10").click();
            }
		}); 
	});
	
});
</script>

</body>
</html>
