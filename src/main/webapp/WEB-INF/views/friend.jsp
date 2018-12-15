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

</head>
<body>
      <div class="artist__header" >
        <div class="artist__info">

          <div class="profile__img">

            <img src="<c:url value="/resources/images/freepik.jpeg" />" />
          </div>
          <div class="artist__info__meta">
            <div class="artist__info__name">${currentFriend.nickname} </div>
          </div>
        </div>
               <div class="artist__navigation">
          <ul class="nav nav-tabs" role="tablist">

            <li role="presentation" class="active">
              <a href="#friend" aria-controls="friend" role="tab" data-toggle="tab">His/Her Friends</a>
            </li>
            <li role="presentation">
              <a href="#friendPlayLis" aria-controls="friendPlayLis" role="tab" data-toggle="tab">His/Her PlayList</a>
            </li>
            <li role="presentation">
              <a href="#friendHistory" aria-controls="friendHistory" role="tab" data-toggle="tab">His/Her History</a>
            </li>
          </ul>
        </div>
</div>


        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="friend">
            <c:forEach items="${currentFriend.userCollection1}" var="fl">
            <form name="viewFriendFriend" action="viewFriend" method="get">
				<div class="related-artists">
					<input type='hidden' id="asd" name='id' value=${fl.id}>
                  <a href="#" class="related-artist">
                    <span class="related-artist__img">                
                      <img src="<c:url value="/resources/images/freepik.jpeg" />" />       
                    </span>
                    <span class="related-artist__name">${fl.nickname} </span>
                  </a>  

                </div>
               </form>
            </c:forEach>
          </div>
      
		<div role="tabpanel" class="tab-pane" id="friendPlayLis" >
		   <div class="media-cards" id="friendPlaylistlist">
  			
            </div>
		</div>
		
		 <div role="tabpanel" class="tab-pane" id="friendHistory" >
			      <div class="album" style="padding-left: 10px">
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
					<div id="friendPlayHistorylist">
						<c:forEach items="${currentFriend.songHistoriesCollection}" var="song" varStatus="songIndex">
                     		<div class="track" ondblclick="setQueue('${song.name}', '${song.content}', ${song.id});">
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
		                        	<div class="track__time" style="width: 20%">${fplayHistoryList[songIndex.index]}</div>
		                        	<br>				
                      		</div>		
						</c:forEach>
					</div>
                  	</div>
                  </div>
                </div>
		</div>
</div>
    

<script>
	
$(document).ready(function(){
	<c:forEach items="${currentFriend.playlistCollection}" var="playlist1">
	var di = document.createElement("div");
	di.className = "media-card";
	var diinner1 = "<input type='hidden' value=${playlist1.publicStatus}><form name='loadFriendPlaylist' action='loadFriendPlaylist'  method='get'><input type='hidden' name='id'  value=${playlist1.id}><div class='media-card__image' style='height:150px; width: 200px; background-image: url(";
	var ipath = "/Blue/resources/FileSystem/${currentFriend.email}/${playlist1.imageUrl}";		
	var diinner2 = ");'></div><a class='media-card__footer' style='width: 200px'onclick='loadPlaylist()''>${playlist1.name}</a></form>";
	var diinner = diinner1 + ipath + diinner2;
	di.innerHTML = diinner;
	document.getElementById("friendPlaylistlist").appendChild(di);
	</c:forEach>

	
	var checkStatus = document.getElementById("friendPlaylistlist").children;
	for(var i=0; i<checkStatus.length; i++)
	{
		if(checkStatus[i].children[0].value!= 1)
		{
			checkStatus[i].style.display = "none";
		}
	}
	
	if(${currentFriend.privacy != 1})
	{
		document.getElementById("friendPlayHistorylist").style.display = "none";
	}




	$("form[name='viewFriendFriend']").on("click",function(e){
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
$("form[name='loadFriendPlaylist']").on("click",function(e){
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

	
});

</script>

</body>
</html>