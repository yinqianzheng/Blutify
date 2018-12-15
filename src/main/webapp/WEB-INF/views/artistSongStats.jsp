<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Song Song Statis</h2>
		<div id="songListTitle" style="font-size: 16px; color:white">
			<div class="row" style="width: 70%; padding-bottom: 10px">
				<div class="col-sm-1">ID</div>
				<div class="col-sm-5" >Title</div>
				<div class="col-sm-4" >Duration</div>
				<div class="col-sm-2" >Listeners</div>
			</div>
			<div id="artistSongsData" >
				<c:forEach items="${songsList}" var="songs">
				<div class="row" style="border-bottom: 1px solid #aaaaaa; width: 70%">
					<div class="col-sm-1">${songs.id}</div>
					<div class="col-sm-5" >${songs.name}</div>
					<div class="col-sm-4" >${songs.duration}</div>
					<div class="col-sm-2" >${songs.songClickCount}</div>
									<!-- <hr style="color: #aaaaaa; width: 80%; left:0; height: 1px;"> -->
				</div>

				</c:forEach>
			</div>
		</div>

		
		
<script>
/* function loadData()
{
	var songListDiv = document.getElementById("artistSongsData");
   	while(songListDiv.firstChild){
   		songListDiv.removeChild(songListDiv.firstChild);
   	}
    <c:forEach items="${songsList}" var="songs">
     var adiv = document.createElement('div');
      adiv.style ="padding:10px;";
     var divid = document.createElement('div');
     divid.className = "col-sm-1";
     divid.innerHTML = '${songs.id}';
     adiv.appendChild(divid);
     var divsname = document.createElement('div');
     divsname.className = "col-sm-4";
     divsname.innerHTML = "${songs.name}".toString();
     adiv.appendChild(divsname);

     var divduration = document.createElement('div');
     divduration.className = "col-sm-2";
     divduration.innerHTML = '${songs.duration}';
     adiv.appendChild(divduration);
     
     var divsongClickCount = document.createElement('div');
     divsongClickCount.className = "col-sm-1";
     divsongClickCount.innerHTML = '${songs.songClickCount}';
     adiv.appendChild(divsongClickCount);

     adiv.appendChild(document.createElement('hr'));
     document.getElementById("artistSongsData").appendChild(adiv);
    </c:forEach>
} */
$(document).ready(function(){
});
</script>
</body>
</html>