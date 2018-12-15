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
  <title>${language.preferences}</title>
</head>
<body>
  <div class="container" style="width: 90%">
    <div class="page-header">
    	<h1 style="color: #1cbd62">${language.setting}</h1>
  	</div>
  	<h3 style="color: #181818; padding-left: 30px">${language.privacy}</h3>
    <div class="row">
       <div class="col-sm-5" style="text-align:center;"><label style="font-size: 18px; color: #808080">${language.playlistname}</label></div>
       <div class="col-sm-2" style="text-align:center;"><label style="font-size: 18px; color: #808080">${language.pUblic}</label></div>
       <div class="col-sm-2" style="text-align:center;"><label style="font-size: 18px; color: #808080">${language.pRivate}</label></div><br>
     </div>
     
     <div class="well card profile" style="" id="Playlistprivacy1" >
		  
      </div>    
      <HR  style="width: 80%; border-top: 1px solid #181818">
        <!-- for general -->

        <div class="well card profile" style="" id="historyPrivacy2" >
             
      </div> 
            <HR style="width: 80%; border-top: 1px solid #181818">
      <div class="language">
      <h3 style="color: #181818; padding-left: 30px;">${language.languages}</h3>
      
        <div class="well card profile" >
       <form class="privacyForms" action="changeLanguage">
			 <div class="col-sm-3">
		    		<span>${language.languages}: 
				    	<select name="language">
				    				<option value=""></option>
							  <option value="English">${language.english}</option>
							  <option value="Chinese">${language.chinese}</option>
					</select>
				</span>
			</div>
			 <div class="col-sm-3" style=" padding-left: 100px;">
	      		<button type="submit">${language.change}</button>
	      	</div>
      	</form>
      	</div> 
      </div>
   </div>
<script>
$(document).ready(function(){
	<c:forEach items="${user.playlistCollection}" var="pl">
	var pf = document.createElement("form");
	pf.className = "privacyForms";
	pf.action = 'setPlaylistPrivacy';
	var pfinner1 = "<div class='row'><div class='col-sm-5' style='text-align:center;'><input name='name' type='hidden' value=${pl.name} ><span style='color: black; font-size: 16px'>${pl.name}</span></div><div class='col-sm-2' style='text-align:center;'>";
	if(${pl.publicStatus!=1}){
		var pfinner2 = "	<input type='radio' name='status' value='public'></div><div class='col-sm-2' style='text-align:center;'><input type='radio' name='status' value='private'  checked></div></div>";
	}else{
		var pfinner2 = "<input type='radio' name='status' value='public' checked></div><div class='col-sm-2' style='text-align:center;'><input type='radio' name='status' value='private'></div></div>";
	}
	var pfinner = pfinner1 + pfinner2;
	pf.innerHTML = pfinner;
	document.getElementById("Playlistprivacy1").appendChild(pf);
 	</c:forEach>


 	var hf = document.createElement("form");
 	hf.className = "privacyForms";
 	hf.action = 'setPrivacy';
 	var hfinner1 = "<div class='row'><div class='col-sm-5' style='text-align:center;'><span style='color: black; font-size: 16px'>${language.history}</span></div>";
	if(${user.privacy!=1}){
		var hfinner2 = "<div class='col-sm-2' style='text-align:center;'><input type='radio' name='status' value='public'></div><div class='col-sm-2' style='text-align:center;'><input type='radio' name='status' value='private'  checked></div></div>";
	}else{
		var hfinner2 = "<div class='col-sm-2' style='text-align:center;'><input type='radio' name='status' value='public' checked></div><div class='col-sm-2' style='text-align:center;'><input type='radio' name='status' value='private'></div></div>";
	}
	var hfinner = hfinner1 + hfinner2;
	hf.innerHTML = hfinner;
	
	document.getElementById("historyPrivacy2").appendChild(hf);
        


$('input[type=radio]').on('change', function() {
	$(this).closest("form").submit();
});



$(".privacyForms").submit(function(e) {
	e.preventDefault();	
	var actionurl = e.currentTarget.action;
	var actiontype = e.currentTarget.method;
	jQuery.support.cors = true;
	$.ajax({
		url: actionurl,
		type: 'post',
		dataType: 'application/json', 
		data: $(this).serialize(),
		complete: function(json) {
			var data = jQuery.parseJSON(json.responseText);
			if(data.action == "changeLanguage"){
				if(data.status==true){

					window.location.href = "main";

				}
					

			}
		}
	});
});

});

</script>
</body>
</html>