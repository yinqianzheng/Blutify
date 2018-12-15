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
  <title>Spotify Artist Page UI</title>
    <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>
  
	<style type="text/css">
	<%@ include file="../../resources/css/style.css" %>
	</style>
	
	<style>
	/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #181818;
    background-color: #181818;
}

div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 14px;
    color: #aaaaaa;
    border-radius: 0px;
}


div.tab button:hover {
    background-color: #ddd;
}


div.tab button.active {
    color: white;
    background: none;
    border: none;
    border-bottom: 4px solid #1ed760;
} 
.tabcontent {
    display: none;
    padding: 6px 12px;
    border-top: none;
} 
</style>
</head>
<body>
 <div class="artist is-verified">

      <div class="artist__header">

        <div class="artist__info">

          <div class="profile__img">

            <img src=${currentFriend.imageUrl} />

          </div>

          <div class="artist__info__meta">


            <div class="artist__info__name">${currentFriend.nickname} </div>

            <div class="artist__info__actions">

              <button class="button-light">Follow</button>

              <button class="button-light more">
                <i class="ion-ios-more"></i>
              </button>

            </div>

          </div>


        </div>

        <div class="artist__listeners">

          <div class="artist__listeners__count">15,662,810</div>
        </div>

      </div>
		
		<div class="tab">
				       
		<div class="artist__navigation">
            <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
              <button class="tablinks" onclick="changeNav(event, 'Friends')">His/Her Friends</button>
            </li>
             <li role="presentation">
               <button class="tablinks" onclick="changeNav(event, 'PlayList')">His PlayList</button>
            </li>
            
<!--             <li role="presentation">
              <button class="tablinks" onclick="changeNav(event, '')"></button>
            </li> -->


          </ul>
          </div>
</div>

<div id="Friends" class="tabcontent">
<c:forEach items="${currentFriend.friendCollection}" var="fl">
          <div role="tabpanel" class="tab-pane active" id="artist-overview">
            <div class="overview">
              <div class="overview__artist">
                  <div class="related-artists">
                  <a href="#" class="related-artist">
                    <span class="related-artist__img">                
                      <img src=${fl.imageUrl} />       
                    </span>
                    <span class="related-artist__name">${fl.nickname} </span>
                  </a>  
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
</div>

<div id="PlayList" class="tabcontent">
   <div class="media-cards">

              <div class="media-card">

                <div class="media-card__image" style="background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/7022/hoodie.jpg);">

                  <i class="ion-ios-play"></i>

                </div>

                <a class="media-card__footer">Hoodie Allen</a>

              </div>
            </div>
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>
    </div>



    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
       <spring:url value="/resources/js/myScript.js" var="mainJs" />
	<script src="${mainJs}"></script>    
<script>
function changeNav(evt, tagName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tagName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
</body>
</html>