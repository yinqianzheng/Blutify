<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>responsive-admin-menu</title>
    <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>

  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>

 <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>
  
	<style type="text/css">
	<%@ include file="../../resources/css/style.css" %>
	</style>

	<style type="text/css">
	<%@ include file="../../resources/css/admin.css" %>
	</style>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
</head>
<body>
 <section class="header">
  <div class="page-flows">

    <span class="flow">
  	<i class="fa fa-spotify" aria-hidden="true"></i>
 	</span>

    <span class="flow">
      <i class="ion-chevron-left"></i>
    </span>

    <span class="flow">
      <i class="ion-chevron-right"></i>
    </span>

  </div>

  <div class="search">

    <input type="text" placeholder="Search" />

  </div>

  <div class="user">

    <div class="user__notifications">

      <i class="ion-android-notifications"></i>

    </div>

    <div class="user__inbox">

      <i class="ion-archive"></i>

    </div>

    <div class="user__info">

      <span class="user__info__img">
      	<i class="fa fa-user-o" aria-hidden="true"></i>
        
      </span>

      <span class="user__info__name">
      
        <span class="first">Artist Name</span>

      </span>

    </div>

    <div class="user__actions">

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          <i class="ion-chevron-down"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
          <li>
          	<form action="logout" method="post">
				<button class="buttonLink" type="submit">Log out</button>
			</form>
          </li>
        </ul>
      </div>

    </div>

  </div>
  </section>


  <div id="responsive-admin-menu">
	<div id="responsive-menu">
		<div class="menuicon">≡</div>
	</div>
	
	<div id="logo"></div>

	<!--Menu-->
	<div id="menu">

				<a id="aritstbrowse" href="loadArtistOverview">
				<i class="ion-ios-browsers" aria-hidden="true"></i><span>  
				Browse</span></a>

			
<!-- 			<form id="viewArtistPage"  name="viewArtistPage">
				<input type="hidden" name="id" value="1">
				<a title="viewArtistPage" onclick="showArtistPage()">
				<i class="fa fa-pencil-square-o" aria-hidden="true"></i><span>  
				Edit Infomation</span></a>
			</form> -->

			<form id="viewArtistRoyalties" name="viewArtistRoyalties">
			<input type="hidden" name="id" value=${artist.id}>
			<a title="viewArtistRoyalties" onclick="showArtistRoyalties()">
			<i class="fa fa-money" aria-hidden="true"></i></i><span> Royalties</span></a>
			</form>

			<form id="viewSongsStatics" name="viewSongsStatics">
			<input type="hidden" name="id" value=${artist.id}>
			<a title="viewSongsStatics" onclick="showSongsListWindow()">
			<i class="fa fa-area-chart" aria-hidden="true"></i><span> Song Statistics</span></a>
			</form>
			

			<a href="" name="other-sub" title="Other Contents"><i class="icon-book"></i><span> 
			Add Concert</span></a>

	</div>
</div>

<div id="content-wrapper" style="background-color: #282828">
<div id="content-parent" >
		<div id="infocontent" >
			<jsp:include page="artistOverview.jsp"></jsp:include>
		</div>

		<!-- royalties -->

		<!-- royalties -->

		<!-- songStatics -->
<!-- 		<div id="songListTitle" style="padding:20px; display: none;">
			<div class="row" style="padding-left: 18px">
				<div class="col-sm-1">ID</div>
				<div class="col-sm-4" >Title</div>
				<div class="col-sm-2" >Duration</div>
				<div class="col-sm-1" >Listeners</div>
			</div>
			<div id="artistSongsList"></div>
		</div> -->
		<!-- songStatics -->
</div>
</div>




 	<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>





<script>
		function showSongsListWindow(){ 
		  jQuery.support.cors = true;
		  $.ajax({
		   url: "viewSongsStatics",
		   type: "get",
		   dataType : 'application/json',
		   data: $("#viewSongsStatics").serialize(),
		   complete: function(json) {
				var jsonBack = jQuery.parseJSON(json.responseText);
	        	$("#infocontent").load(jsonBack.value);	
			   	
		   }
		  });
		 } 
</script>

 <script type="text/javascript">
	function showArtistRoyalties(){
		  jQuery.support.cors = true;
		  $.ajax({
		   url: "viewArtistRoyalties",
		   type: "get",
		   dataType : 'application/json',
		   data: $("#viewArtistRoyalties").serialize(),
		   complete: function(json) {
			   var jsonBack = jQuery.parseJSON(json.responseText);
	        	$("#infocontent").load(jsonBack.value);	
/* 		   	var royatiesListDiv = document.getElementById("royaltiesIncome");
		   	while(royatiesListDiv.firstChild){
		   		royatiesListDiv.removeChild(royatiesListDiv.firstChild);
		   	}
		    <c:forEach items="${songsRoyalties}" var="royalty">
		     var adiv = document.createElement('div');
		     adiv.style ="padding:10px;";
		     var divid = document.createElement('div');
		     divid.className = "col-sm-1";
		     divid.innerHTML = '${royalty.id}';
		     adiv.appendChild(divid);

		     var divsname = document.createElement('div');
		     divsname.className = "col-sm-5";
		     divsname.innerHTML = "${royalty.name}".toString();
		     adiv.appendChild(divsname);
		     
		     var divsongClickCount = document.createElement('div');
		     divsongClickCount.className = "col-sm-2";
		     divsongClickCount.innerHTML = '${royalty.songClickCount}';
		     adiv.appendChild(divsongClickCount);

		     var divsongIncome = document.createElement('div');
		     divsongIncome.className = "col-sm-2";
		     divsongIncome.innerHTML = '$'+ "${royalty.income}".toString();
		     adiv.appendChild(divsongIncome);

		     adiv.appendChild(document.createElement('hr'));
		     document.getElementById("royaltiesIncome").appendChild(adiv);
		    </c:forEach> */
		   }
		  });
		 }
</script> 

<script type="text/javascript">
/*  	function showArtistPage(){ */
/* 		  document.getElementById("songListTitle").style.display = "none"; */
		  // document.getElementById("artistSongsList").style.display = "none";
/* 		  document.getElementById("royaltiesTitle").style.display = "none"; */
		  // document.getElementById("royaltiesIncome").style.display = "none";
/* 		  document.getElementById("infocontent").style.display = "block"; */
/*		  jQuery.support.cors = true;
		  $.ajax({
			url: "viewArtistPage",
			type: "get",
			dataType : 'application/json',
			data: $("#viewArtistPage").serialize(),
			complete: function(json) {
		 		var jsonBack = jQuery.parseJSON(json.responseText);
	        	$("#infocontent").load(jsonBack.value);		   
		    }
		  });
		 } */

</script>

<script>
$("form[name='viewArtistPage']" ).submit(function(e) {
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
        	$("#infocontent").load(jsonBack.value);	
		}
	});
});

$("form[name='editArtist']").on("click", function(e) {
	e.preventDefault();		
    var info = document.getElementById("artistName").value;
    var info2 = document.getElementById("artistBio").value;
    // jQuery.support.cors = true;
    $.ajax({
      type:"post",
      url: 'saveArtistEdit',
      dataType: 'application/json',
      data: {artistName: info, artistBio: info2},
      complete: function(json){
        var jsonBack = jQuery.parseJSON(json.responseText);
      }
    }); 
});
</script>






</body>
</html>