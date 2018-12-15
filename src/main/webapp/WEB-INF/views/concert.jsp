<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"> -->
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="https://libraries.wmgartistservices.com/songkick/widget.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
  <script src="//widget.songkick.com/widget.js"></script>
</head>
<body>
<div style="text-align: center; margin-top: 10px">
		<input type="text" id="concertSearch" name="name" style="width: 60%;
		font-size: 20px;
		border: 1px solid #ddd;
		
		border-radius: 15px;
		background-color: #333;">
		<button onclick="loadConcert()">Search</button>
</div>
<hr style="width: 90%">

<div id="default" style="">
<a href="http://www.songkick.com/artists/3181021" class="songkick-widget" data-page="5" data-date-format="month/dd" data-display-limit="5"  data-theme="light" data-detect-style="true" data-font-color="#181818" data-link-color="#ff0040" data-background-color="#fff">Upcoming Concert</a>
</div>

<div id="concertMSG"></div>
<div id="ShowEventDiv" style = "height: 800px; width: 100%;"></div>

  <script>
function loadConcert() {
	var name = document.getElementById("concertSearch").value;
	if(name.trim() == "")
	{
		
	}
	else
		{
		document.getElementById("default").style.display = "none";
		var url = "http://api.songkick.com/api/3.0/search/artists.json?apikey=io09K9l3ebJxmxe2&query=" + name;
		$.getJSON(url,
		function(data){
			if(data.resultsPage.status=='ok'&& data.resultsPage.totalEntries>0){
				var id = data.resultsPage.results.artist[0].id;
				var displayName = data.resultsPage.results.artist[0].displayName;
				var ifrm = document.createElement('iframe');
				ifrm.setAttribute('id', 'ifrm'); // assign an id
				ifrm.setAttribute('style', "height: 100%; width: 100%;");
				document.getElementById("ShowEventDiv").innerHTML = '';
				document.getElementById("concertMSG").innerHTML = '<h1 style="color: white; font-size: 30px">Upcoming event for '+ displayName + ': </h1>';
				document.getElementById("ShowEventDiv").appendChild(ifrm); // to place at end of document
				var iframeSrcStr = 'http://widget.songkick.com/songkick-widget.html?artist=' + id;
				ifrm.setAttribute('src', iframeSrcStr);

			}else{
				document.getElementById("ShowEventDiv").innerHTML = '';
				document.getElementById("concertMSG").innerHTML = 'No upcoming event for '+ name;
			}
			
		});
		}

}
</script>
</body>
</html>