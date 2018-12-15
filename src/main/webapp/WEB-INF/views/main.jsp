<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

  
  <section class="header" style="position: fixed; width: 100%; z-index: 200">

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
	<form name="searchAll" action="overAllSearch" method="post">
    	<input type="text" id="searchField" name="keyWord" placeholder=${language.search} />
	</form>
  </div>

  <div class="user">

    <div class="user__inbox">

      <a id="up" href="upgrade"><button id="upgrade">Upgrade</button></a >

    </div>

    <div class="user__info" >

<%--       <span class="user__info__img">
      	<img id="profileImg" src="<c:url value="/resources/images/freepik.jpeg" />" class="img-responsive" /> 
        
      </span> --%>

      <span class="user__info__name" style="padding-left: 0;">
      
         <span id="mainPageShowName" class="first">${user.nickname}</span>
      </span>

    </div>

    <div class="user__actions">

<%--       <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          <i class="ion-chevron-down"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
          <li><a href="#">Private Session</a></li>
          <li>
           	<form action="portfolio" method="post">
				<button class="buttonLink" type="submit">Account</button>
			</form>
         	<a id="profile" href="portfolio">Account</a>
          </li>
          <li><a href="#">Settings</a></li>
           <li>
          	<form action="deleteAccount" method="post">
				<button class="buttonLink" type="submit">Delete</button>
			</form>
          </li>
          <li>
          	<form action="logout" method="post">
				<button class="buttonLink" type="submit">Log out</button>
			</form>
          </li>
        </ul>
      </div> --%>
			
	        
	        
	        	<div class="dropdown" style="right:50px; top:-20px;">
				<button class="btn dropdown-toggle" type="button" data-toggle="dropdown" style="color: #aaaaaa"><i class="ion-chevron-down"></i></button>
					<ul class="dropdown-menu dropdown-menu-right">
 						<li><a id="private" style="width: 100%; margin-left: 5px" href="preferences">${language.privatesession}</a></li>
					    <li><a id="profile" style="width: 100%; margin-left: 18px" href="portfolio">${language.account}</a></li>
					    <li>
					    		<form action="deleteAccount" method="post">
								<button  type="submit" style="padding-left: 0;width: 100%">${language.delete}</button>
							</form>
						</li>
						<li>
							<form action="logout" method="post">
								<button type="submit" style="padding-left: 0; width: 100%">${language.logout}</button>
							</form>
						</li>
					</ul>
			</div>
	        
    </div>

  </div>

</section>

<section class="content" style="padding-top: 50px">

  <div class="content__left" style="position:fixed; height: 100%; ">

    <section class="navigation">

      <!-- Main -->
      <div class="navigation__list">
        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#main" aria-expanded="true" aria-controls="main">
          ${language.main}
        </div>
        <div class="collapse in" id="main">
         <form name="viewBrowse" action="viewBrowse" method="get">
         <a class="navigation__list__item" id="browse" href="#">
            <i class="ion-ios-browsers"></i>
            <span>${language.browse}</span>
          </a>
			</form>

         <form name="viewConcert" action="viewConcert" method="get">
         <a class="navigation__list__item" id="concert" href="#">
            <i class="ion-ios-people"></i>
            <span>${language.concert}</span>
          </a>
			</form>

        </div>     
      </div>
      <!-- / -->

      <!-- Your music -->
      <div class="navigation__list">
        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#yourMusic" aria-expanded="true" aria-controls="yourMusic">
          ${language.yourmusic}
        </div>
        <div class="collapse in" id="yourMusic">
<!--         <a href="#" class="navigation__list__item">
            <i class="ion-headphone"></i>
            <span>Songs</span>
          </a>  -->
          	<form name="viewMySongs" action="viewMySongs" method="get">
			 <input type="hidden" name="id"  value=${user.id}>
	          <a href="#" class="navigation__list__item">
	            <i class="ion-headphone"></i>
	            <span>${language.songs}</span>
	          </a>
			</form>
			<form name="viewMyArtists" action="viewMyArtists" method="get">
			 <input type="hidden" name="id"  value=${user.id}>
	          <a href="#" class="navigation__list__item">
	            <i class="ion-person"></i>
	            <span>${language.artists}</span>
	          </a>
			</form>
			
			<form name="viewMyAlbums" action="viewMyAlbums" method="get">
			 <input type="hidden" name="id"  value=${user.id}>
	          <a href="#" class="navigation__list__item">
	            <i class="ion-ios-browsers"></i>
	            <span>${language.albums}</span>
	          </a>
			</form>
<!--           <a href="#" class="navigation__list__item">
            <i class="ion-ios-browsers"></i>
            <span>Albums</span>
          </a> -->
         <!--  <a href="#" class="navigation__list__item">
            <i class="ion-document"></i>
            <span>Followed Playlists</span>
          </a> -->
<!--           <a class="navigation__list__item" id="history" href="loadHistory"> -->
 		<a class="navigation__list__item" data-toggle="modal" data-target="#playHistory">
            <i class="ion-ios-time"></i>
            <span>${language.history}</span>
          </a>
        </div>
      </div>
      <!-- / -->


      <!-- Playlists -->
      <div class="navigation__list">

        <div class="navigation__list__header" role="button" data-toggle="collapse" href="#playlists" aria-expanded="true" aria-controls="playlists">
          ${language.playlists}
        </div>
        
        <!-- search -->
        <input type="text" placeholder=${language.search}  id="myPlaylistsInput" oninput="searchMySong()"/>
        <!--  -->
        
        <div class="collapse in" id="playlists">
		
<%--  					<c:forEach items="${user.playlistCollection}" var="pl">
		               <form id="loadPL" name="loadPL" action="loadPlaylist" method="get">
		               		<input id="loadName" type="hidden" name="name"  value=${pl.name}>
						   <a class="navigation__list__item">
				            <i class="ion-ios-musical-notes"></i>
				            <span>${pl.name}</span>
				          </a>
						    </form>
						</c:forEach> --%>
	

        </div>

      </div>

    </section>

    <section class="playlist">

      <a data-toggle="modal" data-target="#createPL">

        <i class="ion-ios-plus-outline"></i> ${language.newplaylist}

      </a>

    </section>


  </div>
  

  <div class="content__middle" style="left: 15%; position: absolute">
  
  
  <div id="adsDiv"  onmouseover="showCloseAdsBtn()" onmouseout="hideCloseAdsBtn()" >
<button id="closeAdsBtn" onclick="closeADs()" style="right: 0%; position: absolute; display: none; z-index: 100; display: none;">x</button>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="height: 150px;">
      <div class="item active">
        <a target="_blank" href="https://www.amazon.com/dp/B015TJD0Y4/ref=ods_gw_d_tpr_bt_im2?pf_rd_p=9506573d-3a85-4018-ae8d-e11a68dfe36e&pf_rd_r=02PTT8RAZ16PFGV1C2M2">
        <img src="<c:url value="/resources/images/holiday.JPG" />" style="min-height: 150px; max-height: 150px; min-width: 100%;max-width: 100%"alt="Image">
        </a>
<!--         <div class="carousel-caption">
          <h3>Sell $</h3>
          <p>Money Money.</p>
        </div>   -->    
      </div>

      <div class="item">
        <a target="_blank" href="https://www.amazon.com/12-Days-of-Deals/b?ie=UTF8&node=5550343011&pf_rd_p=b0fcc5a3-0918-420f-848c-6c1b9fcd58e8&pf_rd_r=W4FZJB7KYWN4NQSZSJHE">
        <img src="<c:url value="/resources/images/sale2.jpg" />" style="min-height: 150px; max-height: 150px; min-width: 100%;max-width: 100%"alt="Image">
        </a>
<!--         <div class="carousel-caption">
          <h3>More Sell $</h3>
          <p>Lorem ipsum...</p>
        </div>  -->     
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
</div>


	 		<div id="content" style="min-height: 900px; padding-bottom: 100px;">
	 			<jsp:include page="inner.jsp"></jsp:include>
	     	</div>

  </div>

<div class="content__right" style="right:0; position: fixed; height: 100%">

    <div class="social">
	 <input type="text" placeholder=${language.search}  id="myFriendListInput" oninput="searchMyFriend()">
      <div class="friends" id="friendList">

      </div>

      <button class="button-light" data-toggle="modal" data-target="#findFriend">${language.findfriend}</button>
      <hr style="color: #aaaaaa; ">
      <!-- play queue -->
  <div id="playlist">
    <div class="headerPlayer">
    <div class="headerPlayerLegend">
      <h4>Play Queue</h4>
    </div>
  </div>
    <div class="playerTrack">
     <div id="list"></div> 
  </div>
  </div>
  <!-- play queue -->
  
    </div>

  </div>

</section>

  <div  id="playerBody" class="footer">
<!--     <div class="container"> -->
      <!-- Top Info -->
      <div id="title">
        <span id="track"></span>
        <div id="timer">0:00</div>
        <div id="duration">0:00</div>
      </div>

      <!-- Controls -->
      <div class="controlsOuter">
        <div class="controlsInner">
          <div id="loading" ></div>
          <div class="btn" id="playBtn"><a class="ion-ios-play play" style="font-size: 40px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></a></div>
          <div class="btn" id="pauseBtn"><a class="ion-ios-pause pause" style="font-size: 40px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);" ></a></div>
          <div class="btn" id="prevBtn"><a class="ion-ios-skipbackward" style="font-size: 25px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></a></div>
          <div class="btn" id="nextBtn"><a class="ion-ios-skipforward" style="font-size: 25px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></a></div>
          <div class="btn" id="normalMode" onclick="changeMode()" style="display: block; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
          <div class="btn" id="loopOneMode" onclick="changeMode()" style="display: none; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
          <div class="btn" id="loopAllMode" onclick="changeMode()" style="display: none; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
          <div class="btn" id="randomMode" onclick="changeMode()" style="display: none; position: absolute;top: 60%;transform: translate(-50%, -50%);"></div>
         <!--  <div class="btn" id="playerMode"><i class="ion-shuffle" style="font-size: 15px; position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);"></i></div> -->
        </div>
        
<!--         <div class="btn" id="volumeBtn"> -->
		<div class="btn" id="playlistBtn" ></div>
		<div class="btn" id="volumeBtn">
			<div id="sliderBtnUnmute"></div>
        		<div id="sliderBtnMute" ></div>
        </div>
      </div>

      <!-- Progress -->
      <div id="waveform"></div>
      <div id="bar"></div>
      <div id="progress"></div>

     

      <!-- Volume -->
      <div id="volume" class="fadeout">
         <div id="barFull" class="bar"></div>
        <div id="barEmpty" class="bar"></div>
        <div id="sliderBtn"></div>
      </div>
    </div>


 <div class="modal fade" id="findFriend" tabindex="-1" role="dialog" aria-labelledby="findFriend" aria-hidden="true">
    <div class="modal-dialog" style="min-width: 650px">
        <div class="modal-content">
            <form id="findFriendForm" class="form-horizontal" role="form" class="modal-content animate" action="addFriend" method="post">
                <div class="modal-header">
                    <h4 class="modal-title" id="edit-profile">Add an user as friend</h4>
                    <span id="friendError" style="display: none"></span>
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">X</span><span class="sr-only">Close</span></button>
                </div>
                 <div class="modal-body">
                 <span id="addError" style="color: red"></span>
                	<div class="row">
                		
                		<label class="col-sm-3 control-label" >Enter an name:</label> 
					          <div class="form-group" style="min-width: 500px">
					            <div class="col-lg-8">
					              <input class="form-control" id="friendName" style="minlength:50" name="nickname" val="" type="text" required>
<!-- 					              <input type="" id="friendNameSubmit" name="nickname" value=""> -->
					            </div>
					          </div>				          					          
					      </div>
                   
                </div>
                 <div class="modal-footer" >
                    <button type="reset" id="addFriendCancel" class="btn btn-default" style="right: 13%" data-dismiss="modal">Cancel</button>
                    <button type="submit" id="addFriendAction" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="createPL" tabindex="-1" role="dialog" aria-labelledby="createPL" aria-hidden="true">
	<div class="modal-dialog">
		<form id="createPlForm" class="modal-content animate" action="createPlaylist" method="post">
			<div class="modal-content">
				<h4 class="modal-title">Create PlayList</h4>
				<input id="createPLE" class="input-p" disabled/>
	            <div class="modal-body">
		            <input type="text" id="plname" class="form-control input-sm chat-input" name="name" required placeholder="name">
		            <div class="row">
			            <div id="img-group" class="col-md-4">
			            	<div class="img-content">
			            		<img id ="playlistCover" class="plImg" src="<c:url value="/resources/images/default.jpeg" />">
			            		<label for="file" id="label-button" class="btn">
			            			change Image..
			            		</label>
			            		<input type="file" style="display:none" id="file" name= "image" onclick="changeImg()"/>
			            	</div>
						</div>
						<div class="col-md-8 product_content">
							<span>Description</span>
							<textarea rows="7" cols="42" id="plarea" name="description"></textarea>
						</div>
					</div>
					<div class="wrapper">
						<button id="submitBtn" class="button button6" type="submit">
							Submit
						</button>
						<button id="close1" class="button button7" data-dismiss="modal">
							Close
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="modal fade" id="playHistory" tabindex="-1" role="dialog"  aria-hidden="true">
	<div class="modal-dialog" style="min-width: 800px">
				            <div role="tabpanel" class="tab-pane active" id="artist-overview" >
            <div class="overview" style="background-color: #282828 !important; min-width: 800px">
              <div class="overview__albums">
                <div class="overview__albums__head" style="width: 100%;">
                  <span class="section-title" style="font-size: 20px; margin-left: 40%">Play history</span>
                  
                </div>
                <hr style="width: 90%">
                <div class="album" style="padding-left: 10px">
                   <div class="album__tracks">
                    <div class="tracks">
                      <div class="tracks__heading">
                        <div class="tracks__heading__number"></div>
                         <div class="tracks__heading__play"></div>
                        <div class="tracks__heading__title">Song</div>
                        <div class="tracks__heading__artist">ARTIST</div>
                        <div class="tracks__heading__album">Album</div>
                        <div class="tracks__heading__time">Time</div>
                      </div>
					<div id="playHistorylist">
						<c:forEach items="${user.songHistoriesCollection}" var="song" varStatus="songIndex">
                     		<div class="track">
		                        	<div class="track__number"></div>
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
		                        	<div class="track__time" style="width: 20%">${playHistoryList[songIndex.index]}</div>
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
	</div>
</div>


    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
   <spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script>
	 <spring:url value="/resources/js/howler.core.js" var="howlerJs" />
	<script src="${howlerJs}"></script>
		 <spring:url value="/resources/js/siriwave.js" var="siriwaveJs" />
	<script src="${siriwaveJs}"></script>
		 <spring:url value="/resources/js/player.js" var="playerJs" />
	<script src="${playerJs}"></script>
<%-- 	<spring:url value="/resources/js/jquery.jplayer.min.js" var="jplayerJs" />
	<script src="${jplayerJs}"></script> --%>
	
<script>


var player = null;
function clearQueue(){          
	  try {
	      player.pause();
	  }
	  catch(err) {}
	  setTimeout(function() {
	    var myNode = document.getElementById("list");
	    while (myNode.firstChild) {
	        myNode.removeChild(myNode.firstChild);
	    }        
	    document.getElementById("track").innerHTML = "";
	    document.getElementById("duration").innerHTML = "0:00";
	    document.getElementById("timer").innerHTML = "0:00";
	    document.getElementById("progress").style="width: 0.00%";
	    player = null;
	  }, 50);
	}
	

	


function addToQueue(name, url, sid){
	  if(player==null){
	    player = new Player([
	      {
	        title: name,
	        file: url,
	        howl: null,
	        id: sid
	      }
	    ]);
	  }else{
	    player.playlist = player.playlist.concat([
	    {
	      
	      title: name,
	      file: url,
	      howl: null,
	      id: sid
	    }
	    ]);
	    player.refleshQueue();
	  }
	}
	
	
	function changeMode(){
		if(player!=null){
		var normal = document.getElementById("normalMode");
		var repeatone = document.getElementById("loopOneMode");
		var repeatall = document.getElementById("loopAllMode");
		var random = document.getElementById("randomMode");
		if (normal.style.display == "block"){
			normal.style.display = "none";
			repeatone.style.display = "block";
			player.mode = "loopone";
		}else if(repeatone.style.display == "block"){
			repeatone.style.display = "none";
			repeatall.style.display = "block";
			player.mode = "loopall";
		}else if(repeatall.style.display == "block"){
			repeatall.style.display = "none";
			random.style.display = "block";
			player.mode = "random";
		}else{
			random.style.display = "none";
			normal.style.display = "block";
			player.mode = "normal";
		}
		}
	}
	
	function pau(){
	  player.play();
	}

	function loopone(){
	  player.mode = "loopone";
	}

	function loopall(){
	  player.mode = "loopall";
	}

	function random(){
	  player.mode = "random";
	}

	function normal(){
	  player.mode = "normal";
	}


	function setQueue(name, url, sid){
		try {
		      player.skipTo(-1);
		}catch(err) {}
		var myNode = document.getElementById("list");
		while (myNode.firstChild) {
		    myNode.removeChild(myNode.firstChild);
		}        
		document.getElementById("track").innerHTML = "";
		document.getElementById("duration").innerHTML = "0:00";
		document.getElementById("timer").innerHTML = "0:00";
		document.getElementById("progress").style="width: 0.00%";
		player = null;
		player = new Player([
		      {
		        title: name,
		        file: url,
		        howl: null,
		        id: sid
		      }
		    ]);
		player.play();
	}


	function setPlaylistQueue(){
		try {
		      player.skipTo(-1);
		}catch(err) {}
		var myNode = document.getElementById("list");
	    while (myNode.firstChild) {
	        myNode.removeChild(myNode.firstChild);
	    }        
	    document.getElementById("track").innerHTML = "";
	    document.getElementById("duration").innerHTML = "0:00";
	    document.getElementById("timer").innerHTML = "0:00";
	    document.getElementById("progress").style="width: 0.00%";
	    player = null;
		var setQueuelist = document.getElementById("plSongArea").children;
		
		for (var i = 0; i < setQueuelist.length; i++) {
			addToQueue(
					setQueuelist[i].children[8].children[1].value, 
					setQueuelist[i].children[8].children[2].value, 
					setQueuelist[i].children[8].children[0].value
					);
		}
		player.play();
	}
	
	
	function addPlaylistToQueue(){
		var setQueuelist = document.getElementById("plSongArea").children;
		for (var i = 0; i < setQueuelist.length; i++) {
			addToQueue(
					setQueuelist[i].children[8].children[1].value, 
					setQueuelist[i].children[8].children[2].value, 
					setQueuelist[i].children[8].children[0].value
					);
		}
	}
/* function load()
{ 
	$("form[name='loadPL']").on("click",function(e){
 		e.preventDefault();
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		alert("aaaaaaaaaaaaaaaaaaaa");
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

function viewArtist()
{

   $("form[name='loadArtist']").on("click",function(e){
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
} 


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

function viewAL()
{
 	$("form[name='loadAL']").on("click",function(e){
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
}

function loadPlaylist()
{
 	$("form[name='loadPlaylist']").on("click",function(e){
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
}

/* function removeFriend()
{

} */

function loadPlaylistToBar(){
	while (document.getElementById("playlists").firstChild) {
		document.getElementById("playlists").removeChild(document.getElementById("playlists").firstChild);
	}  
	<c:forEach items="${user.playlistCollection}" var="pl">
	var plElement ="<input type='hidden' name='name'  value=${pl.name}><a class='navigation__list__item'><i class='ion-ios-musical-notes'></i><span>${pl.name}</span></a >";
	var plElementForm = document.createElement('form');
	plElementForm.name = 'loadPL';
	plElementForm.action='loadPlaylist';
	plElementForm.method='get';
	plElementForm.innerHTML = plElement;
	plElementForm.onclick = function(e) {
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
	};
	document.getElementById("playlists").appendChild(plElementForm); 
</c:forEach>
}

function setPlaylistQueueOne(data, i){
	setPlaylistQueue(data);
	player.skipTo(i);
}

function doMainSearch(){
	var x = document.getElementById("mainSearch").value;
	$.ajax({
		url: "overAllSearch",
		type: "GET",
		data: {keyWord: x},
		complete: function(json) {
		}
	});
}

function ppLoadSongs(){
	while (document.getElementById("plSongArea").firstChild) {
		document.getElementById("plSongArea").removeChild(document.getElementById("plSongArea").firstChild);
	}  
	<c:forEach items="${currentPlaylist.songCollection}" var="song" varStatus="songIndex">
		var trackdiv = document.createElement('div');
		trackdiv.className = "track";
		trackdiv.innerHTML = "<div class='track__number'>${songIndex.index+1}</div><div class='track__added'><i class='ion-checkmark-round added'></i></div><div class='track__title'>${song.name}</div><div class='track__artist'>${song.artistId.name}</div><div class='track__album'><form name='loadAL' action='viewAlbum' method='get'><input type='hidden' name='id' value=${song.songAlbumId.id}><a onclick=\"viewAL()\">${song.songAlbumId.name}</a></form></div><div class='track__time'>${song.duration}</div><div class='track__more'><div class='dropdown'><button class='button-light' type='button' data-toggle='dropdown'><i class='ion-ios-more'></i></button><ul class='dropdown-menu dropdown-menu-left'><li> <a class='caonima' onclick=\"addToQueue(\'${song.name}\',\'${song.content}\',\'${song.id}\')\">Add to queue</a></li><li><a href='#' onclick=\"removeSongFromPlaylist('${song.id}', '${currentPlaylist.name}')\">delete</a></li><li><a class='test' href='#'>Add to playlist <span class='caret'></span></a></li></ul></div></div>"
		document.getElementById("plSongArea").appendChild(trackdiv);
	</c:forEach>
	
}

function loadFriends()
{
   while (document.getElementById("friendList").firstChild) {
   document.getElementById("friendList").removeChild(document.getElementById("friendList").firstChild);
  } 
 <c:forEach items="${user.userCollection1}" var="fl" varStatus="songIndex">
  var friendRow = document.createElement('div');
  friendRow.className = "row";
  friendRow.setAttribute("id", "FriendRow");
   var friendNameElement = "<div class='col-sm-6'><input type='hidden' name='id' value=${fl.id}><a class='friend'><i class='ion-android-person'></i><span>${fl.nickname}</span></a ></div>";
   var viewFriendForm = document.createElement('form');
  viewFriendForm.name = 'viewFriend';
  viewFriendForm.action='viewFriend';
  viewFriendForm.method='get';
  viewFriendForm.innerHTML = friendNameElement;
  viewFriendForm.onclick = function(e) {
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
  };  
     friendRow.appendChild(viewFriendForm);  
        var friendDelete = "<div class='col-sm-4'><input type='hidden' name='nickname' value=${fl.nickname}><a class='friend'><i class='ion-android-remove-circle'></i></a ></div>"
    var deleteFriendForm = document.createElement('form');  
    deleteFriendForm.name = 'removeFriend';
   deleteFriendForm.action='removeFriend';
   deleteFriendForm.method='post';
   deleteFriendForm.innerHTML = friendDelete;
    deleteFriendForm.onclick = function(e) {
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
      var friendListChildren = document.getElementById("friendList").children;
      var friendListLen = friendListChildren.length;
      
      for (var i = 0; i < friendListLen; i++) {
/*          alert(friendListChildren[i].children[0].children[0].children[1].children[1].innerHTML); */
        var em = friendListChildren[i].children[0].children[0].children[1].children[1].innerHTML;
             if(em == jsonBack.returnName){
/*               alert("yes"); */
                document.getElementById("friendList").removeChild(friendListChildren[i]);
             } 
            }
    }
   });
  };     
 
   friendRow.appendChild(deleteFriendForm); 
  document.getElementById("friendList").appendChild(friendRow); 
 </c:forEach>

}  

function searchMySong(){
	var x = document.getElementById("myPlaylistsInput").value;
    var children = document.getElementById("playlists").children;
    if(x==""){
    		for (var i = 0; i < children.length; i++) {
        		children[i].style.display='block';
        }
    }else{
      for (var i = 0; i < children.length; i++) {
        var c = children[i].children[0].value;
		var re = new RegExp(x,"i");
        var n = c.search(re);
        if(n==-1){
        		children[i].style.display='none';
        }else{
        		children[i].style.display='block';
        }
        
      }
    }
}


function searchMyFriend(){
	var x = document.getElementById("myFriendListInput").value;
    var children = document.getElementById("friendList").children;
    if(x==""){
    		for (var i = 0; i < children.length; i++) {
        		children[i].style.display='block';
        }
    }else{
      for (var i = 0; i < children.length; i++) {
        var c = children[i].children[0].innerHTML;
		var re = new RegExp(x,"i");
        var n = c.search(re);
        if(n==-1){
        		children[i].style.display='none';
        }else{
        		children[i].style.display='block';
        }
        
      }
    }
}


function closeADs(){
	document.getElementById("adsDiv").style.display = "none";
}

function showCloseAdsBtn(){
	document.getElementById("closeAdsBtn").style.display = "block";
}

function hideCloseAdsBtn(){
	document.getElementById("closeAdsBtn").style.display = "none";
}

function changeToAddIcon(songdex){
		var wocaoq = document.getElementById("plSongArea").children;
	var se = songdex.toString();
		for (var i = 0; i < wocaoq.length; i++) {
			if(wocaoq[i].children[0].innerHTML==songdex){
				wocaoq[i].children[2].children[0].style.display = "none";
				wocaoq[i].children[2].children[1].style.display = "block";
				$.ajax({
			      url: 'removeSongFromLibrary',
			      type: 'post',
			      dataType: 'application/json', 
			      data: {id: wocaoq[i].children[8].children[0].value},
			      complete: function(json) {
			        
			      }
			    });
	 		}
		}
	}
function changeToAddedIcon(songdex){
	var wocaoq = document.getElementById("plSongArea").children;
	for (var i = 0; i < wocaoq.length; i++) {
			if(wocaoq[i].children[0].innerHTML==songdex){
				wocaoq[i].children[2].children[0].style.display = "block";
				wocaoq[i].children[2].children[1].style.display = "none";
				  $.ajax({
				      url: 'addSongToLibrary',
				      type: 'post',
				      dataType: 'application/json', 
				      data: {id: wocaoq[i].children[8].children[0].value},
				      complete: function(json) {
				        
				      }
				    });
	 		}
	}
}





$(document).ready(function(){
 	if(${user.type == "general"})
	{
			document.getElementById("upgrade").innerHTML = '${language.upgrade}';
	}
	else
	{
			document.getElementById("upgrade").innerHTML = '${language.downgrade}';
			closeADs();
	} 

	
	
 	$("#up").click(function(event){
 		event.preventDefault();	
 		if(document.getElementById("upgrade").innerHTML == "UPGRADE"|| document.getElementById("upgrade").innerHTML == '${language.upgrade}'){
			$("#content").load(this.href);
			document.getElementById("content").style.background = "white";
 		}
 		else
 		{
 			if (confirm('Are you sure you want to unsubscript?')) {
 				var actionurl = "downgrade";
				var actiontype = "post";
				$.ajax({
					url: actionurl,
					type: actiontype,
					dataType: 'application/json',
					complete: function(json) {
						document.getElementById("upgrade").innerHTML = "UPGRADE";
						var jsonBack = jQuery.parseJSON(json.responseText);
						window.location.href = jsonBack.value;
										
					}
				});
 			}
 		}		
	});	
	

 	
	$( "form[name='searchAll']" ).submit(function(e) {
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
				$("#content").load("loadSearchPage");
				document.getElementById("content").style.background = "#181818";
			}
		});
	});
	
/* 	 $("form[name='removeFriend']").on("click",function(e){
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

				}
			}); 
		});  */
		loadFriends(); 
	loadPlaylistToBar();
 	
	$("form[name='loadPL']").on("click",function(e){
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
	
 	$("form[name='viewFriend']").on("click",function(e){
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
 	
	$("form[name='viewMySongs']").on("click",function(e){
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
				$("#content").load(jsonBack.value, function(){
					mySongsLoadSongs();	
				});
				document.getElementById("content").style.background = "#181818";
			}
		});
	});
	
	$("form[name='viewMyArtists']").on("click",function(e){
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
	
	$("form[name='viewBrowse']").on("click",function(e){
 		e.preventDefault();		
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		$.ajax({
			url: actionurl,
			type: actiontype,
			dataType: 'application/json',
			complete: function(json) {
				var jsonBack = jQuery.parseJSON(json.responseText);
				$("#content").load(jsonBack.value);
				document.getElementById("content").style.background = "#181818";
			}
		});
	});

	$("form[name='viewConcert']").on("click",function(e){
 		e.preventDefault();		
		var actionurl = e.currentTarget.action;
		var actiontype = e.currentTarget.method;
		jQuery.support.cors = true;
		$.ajax({
			url: actionurl,
			type: actiontype,
			dataType: 'application/json',
			complete: function(json) {
				var jsonBack = jQuery.parseJSON(json.responseText);
				$("#content").load(jsonBack.value);
				document.getElementById("content").style.background = "#181818";
			}
		});
	});

	$("form[name='viewMyAlbums']").on("click",function(e){
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

 	$("#profile").click(function(event){
 		event.preventDefault();
		$("#content").load(this.href);
		document.getElementById("content").style.background = "white";
	});
 	
 	$("#private").click(function(event){
 		event.preventDefault();
		$("#content").load(this.href);
		document.getElementById("content").style.background = "white";
	});
	
/*  	$("#browse").click(function(){
 		event.preventDefault();
		$("#content").load("loadMain");
	});
 	 */
 	$("#history").click(function(event){
 		event.preventDefault();
		$("#content").load(this.href);
		document.getElementById("content").style.background = "#181818";
	});
 	 
  	$("#edit").click(function(event){
 		event.preventDefault();
		$("#content").load(this.href);
		document.getElementById("content").style.background = "white";
	});
 	
 	
/*  	$("#addFriendAction").click(function (event) {
         event.preventDefault();
         alert(12312312312);
          $('#friendNameSubmit').val($('#friendName').val()); 
        var inpObj = document.getElementById("friendName");
        if (inpObj.checkValidity() == false) {
        	alert("aaa");
            document.getElementById("addError").innerHTML = inpObj.validationMessage;
        } else {
         	var form = document.getElementById('findFriendForm');
         	var data = new FormData(form); 
	        $.ajax({
	            type: "POST",
	            url: "addFriend",
 	            data: data.serialize(),
 	            complete: function (json) {
	            	alert(json.responseText);
	             	var data = jQuery.parseJSON(json.responseText);
					if(data.value == "Success") {
						alert("sucess");
						
					} 
					
	            }
	        });
        } 
	       
    }); */
     $("#findFriendForm").submit(function (e) {
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
   				var data = jQuery.parseJSON(json.responseText);
   				if(data.value == "Success") {
   					document.getElementById("friendError").innerHTML = "";
   					document.getElementById("friendError").style.display = "none";
   					/* loadFriends(); */
   					var friendRow = document.createElement('div');
   					friendRow.className = "row";
   					friendRow.setAttribute("id", "FriendRow");
   				 	var friendNameElement = "<div class='col-sm-6'><input type='hidden' name='id' value="+data.returnId+"><a class='friend'><i class='ion-android-person'></i><span>"+data.returnName+"</span></a></div>";
   					var viewFriendForm = document.createElement('form');
   					viewFriendForm.name = 'viewFriend';
   					viewFriendForm.action='viewFriend';
   					viewFriendForm.method='get';
   					viewFriendForm.innerHTML = friendNameElement;
   					viewFriendForm.onclick = function(e) {
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
   					}; 
   			   		friendRow.appendChild(viewFriendForm);  
   			      	var friendDelete = "<div class='col-sm-4'><input type='hidden' name='nickname' value="+data.returnName+"><a class='friend'><i class='ion-android-remove-circle'></i></a></div>"
   			  		var deleteFriendForm = document.createElement('form');  
   			  		deleteFriendForm.name = 'removeFriend';
   			 		deleteFriendForm.action='removeFriend';
   			 		deleteFriendForm.method='post';
   			 		deleteFriendForm.innerHTML = friendDelete;
   			 		 deleteFriendForm.onclick = function(e) {
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
   								var friendListChildren = document.getElementById("friendList").children;
   								var friendListLen = friendListChildren.length;
   								
   								for (var i = 0; i < friendListLen; i++) {
   		 							var em = friendListChildren[i].children[0].children[0].children[1].children[1].innerHTML;
   				        			if(em == jsonBack.returnName){
   		  		        				document.getElementById("friendList").removeChild(friendListChildren[i]);
   				        			} 
   				        		}
   						}
   						});
   					};    
   			 
   					friendRow.appendChild(deleteFriendForm);  
   					document.getElementById("friendList").appendChild(friendRow);
   					
				}
   				else
   				{
   					document.getElementById("friendError").innerHTML = data.value;
   					document.getElementById("friendError").style.display = "block";
   					document.getElementById("friendError").style.color = "red";
   				}
   			}
   		});
          document.getElementById("friendName").value = "";
   }); 
 	
 	
	$("#submitBtn").click(function (event) {
	        event.preventDefault();
	        var emptyError = 0;
/* 	        alert($("#plname").val()); */
	        if($("#plname").val()=="")
	        {
	        	$('#createPLE').val("name can't be empty");
				$('#createPLE').addClass("input-p-error");	
	        }
	        else
	        	{
	        	var form = $('#createPlForm')[0];
		        var data = new FormData(form);
		        $("#submitBtn").prop("disabled", true);
		        $.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "createPlaylist",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            success: function (json) {
		                console.log("SUCCESS : ", data);
		                $("#submitBtn").prop("disabled", false);
		            },
		            error: function (e) {
 		                $("#result").text(e.responseText);
		                console.log("ERROR : ", e);
		                $("#submitBtn").prop("disabled", false);

		            },
		            complete: function (json) {
		            	var data = jQuery.parseJSON(json.responseText);
						if(data.status == true) {
							document.getElementById("close1").click();
							var plInput ="<input type='hidden' name='name' value="+data.value+"><a class='navigation__list__item'><i class='ion-ios-musical-notes'></i><span>"+data.value+"</span></a>";
							var plForm = document.createElement('form');
							plForm.name = 'loadPL';
							plForm.action='loadPlaylist';
							plForm.method='get';
							plForm.innerHTML = plInput;
							plForm.onclick = function(e) {
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
							};
							document.getElementById("playlists").appendChild(plForm); 
							$('#createPLE').val("");
							$('#createPLE').addClass("input-p");
							$("#submitBtn").closest('form').find("input[type=text]").val("");
							$("#submitBtn").closest('form').find("textarea").val("");
							$('#playlistCover').attr('src','<c:url value="/resources/images/default.jpeg" />');
							
						}
						else{
							$('#createPLE').val(data.value)
							$('#createPLE').addClass("input-p-error");	
						}
		            }
		        });
	        	
	        	}
	        
	    });
 
/*  	$("form[name='loadPL']").on("click",function(e){
			alert("here");
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
		}); */
/* 		$('form').on("click",function(e){
			alert("loaddddddddddd");
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
		}); */
	    $("#addFriendCancel").click(function() {
	        $("#friendName").val("");
			document.getElementById("friendError").innerHTML = "";
			document.getElementById("friendError").style.display = "none";
	    });
		$("button[id^='close']").click(function() {
			$('#createPLE').removeClass("input-p-error");
			$('#createPLE').val("");
			$('#createPLE').addClass("input-p");
			$(this).closest('form').find("input[type=text]").val("");
			$(this).closest('form').find("textarea").val("");
			$('#playlistCover').attr('src','<c:url value="/resources/images/default.jpeg" />');
		});
});
</script>

</body>
</html>
