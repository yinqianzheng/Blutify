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
<%--     <style type="text/css">
  <%@ include file="../../resources/css/bootstrap.min.css" %>
  </style>
  <style type="text/css">
  
  </style>
  
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>
  
  <style type="text/css">
  <%@ include file="../../resources/css/style.css" %>
  </style> --%>

  
</head>
<body>
      <div class="row" style="padding-left: 15px;height: 60px;">
      	<div class="col-sm-8">
      	<h3>${language.myartistlibrary}</h3>
      	</div>
      	
      	</div>
      	<hr style="width: 95%">

      <div class="media-cards">
      <c:forEach items="${mainArtists}" var="artist">
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

          
          
          
<script>
/* function viewArtist()
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

      }
    });
  }); 
}  */

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
</script>
</body>
</html>