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
          <div role="tabpanel" class="tab-pane" id="related-artists">

            <div class="media-cards">


			<c:forEach items="${mainAlbums}" var="album">
	 			<div class="media-card">
	 			<form id="loadAL" name="loadAL" action="viewAlbum" method="get">
				<input id="loadName" type="hidden" name="id" value=${album.id} >
                <div class="media-card__image" style="background-image: url(${album.imageUrl});">

                </div>

                <a class="media-card__footer" id="loadA" onclick="viewAL()">${album.name}</a>
				</form>
              </div>
	 		</c:forEach>
           

            </div>

          </div>
          
          
          
<script>
/*  function viewAL()
{
	 
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
} */
</script>
</body>
</html>