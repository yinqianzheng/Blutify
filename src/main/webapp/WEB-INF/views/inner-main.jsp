<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
	<style type="text/css">
	<%@ include file="../../resources/css/inner-main.css" %>
	</style>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-fluid">
    <div class="col-12">
      <img src="<c:url value="/resources/images/banner.jpg" />">
    </div>

<nav class="navbar navbar-expand-lg navbar-light bg-faded ">
    <div class="container">
      <a class="nav-item nav-link active" href="#">OVERWIEW <span class="sr-only">(current)</span></a>
      <a class="nav-item nav-link" href="#">CHARTS</a>
      <a class="nav-item nav-link" href="#">GENRES_MOODS</a>
      <a class="nav-item nav-link" href="#">NEW RELESE</a>
      <a class="nav-item nav-link" href="#">DISCOVER</a>
      <a class="nav-item nav-link" href="#">CONCERTS</a>
    </div>
</nav>

<div class="col-12">
<table class="table">
<!--
  <thead>
    <tr>
      <th>Happy Saturday</th>
    </tr>
  </thead>
-->
  <tbody>
    <tr>
      <td><img src = "http://www.billboard.com/files/styles/900_wide/public/media/Green-Day-American-Idiot-album-covers-billboard-1000x1000.jpg" class="img-big"></td>
      <td><img src = "http://www.billboard.com/files/styles/900_wide/public/media/David-Bowie-Aladdin-Sane-album-covers-billboard-1000x1000.jpg" class="img-big"></td>
      <td><img src = "http://www.billboard.com/files/styles/900_wide/public/media/Public-Enemy-Fear-of-a-Black-Planet-album-covers-billboard-1000x1000.jpg" class="img-big"></td>
      <td><img src = "http://www.billboard.com/files/styles/900_wide/public/media/Elvis-Presley-Elvis-Presley-album-covers-billboard-1000x1000.jpg" class="img-big"></td>
    </tr>
    <tr>
      <td><p>Green Day, 'American Idiot' (2004)</p></td>
      <td><p>David Bowie, 'Aladdin Sane' (1973)</p></td>
      <td><p>Public Enemy, 'Fear of a Black Planet' (1990)</p></td>
      <td><p>Elvis Presley, 'Elvis Presley' (1956)</p></td>
    </tr>
    <tr>
     <td><p>Like the album itself, the art for 2004’s American Idiot is hardly subtle. A heart-shaped hand grenade, bleeding and designed to mimic Communist propaganda, was an integral part of Green Day’s angsty tribute to the nation’s post-9/11 political turmoil. </p></td>
      <td><p>While this isn't the album that introduced the world to Bowie's space-man alter ego, when music fans think of Ziggy Stardust, this is the image they see. The lightning-bolt eye makeup, the red mullet -- this is quintessential Bowie.</p></td>
      <td>A nod to the Afrofuturism of artists like Sun Ra, the artwork for Fear of a Black Planet was conceived by Chuck D, who imagined the titular black planet eclipsing earth. Appropriately, given the interplanetary concept, the group hired NASA illustrator B.E. Johnson to draw the final design.</td>
      <td>Elvis knew what a killer combo green and neon pink were some 20 years before the Clash copped the cover style for London Calling. There’s something about that mid-strum snapshot of a vocal howl that gets us every time -- it visually introduced rock n' roll to an unsuspecting America even before the needle hit the vinyl. </td>
    </tr>

  </tbody>
</table>
</div>
</div>
 

</body>
</html>
