<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<%@ include file="../../resources/css/admin.css" %>
	</style>

</head>

<body>
	 <section class="header">

  <!--
  <div class="window__actions">
    <i class="ion-record red"></i>
    <i class="ion-record yellow"></i>
    <i class="ion-record green"></i>
  </div>
  -->


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
      
        <span class="first">Admin Name</span>

      </span>

    </div>

    <div class="user__actions">

      <div class="dropdown">
        <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          <i class="ion-chevron-down"></i>
        </button>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
          <li><a href="#">Private Session</a></li>
          <li><a data-toggle="modal" data-target="#editProfit">Account</a></li>
          <li><a href="#">Settings</a></li>
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


			<a href="" title="Account" class="submenu" name="account-sub"><i class="fa fa-user-circle" aria-hidden="true"></i><span> 
			Account Management</span></a>
			<!-- account Sub Menu -->
				<div id="account-sub" style="display: none;">
					<a href="adminAddAccount" id="addAcc" title="Add Account"><i class="fa fa-user-plus" aria-hidden="true"></i><span>  
					Add Account</span></a>
					<a href="manageAccount" id="manageAcc" title="Edit User Profile"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></i><span>  
					Edit User Profile</span></a>	
				</div>
			<!-- account Sub Menu -->

			<a href="" title="Artist" class="submenu" name="artist-sub"><i class="fa fa-music" aria-hidden="true"></i><span> Artists</span></a>
			<!-- artist Sub Menu -->
				<div id="artist-sub" style="display: none;">
					<a href="adminAddArtist" id="addArtist" title="Add Artist"><i class="fa fa-user-plus" aria-hidden="true"></i><span>  
					Add Artist</span></a>
					<a href="" title="Edit Artist"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><span>  
					Edit Artist Bios</span></a>
					<a href="" title="Delete Artist"><i class="icon-remove-sign"></i><span>  
					Delete Artist</span></a>
				</div>
			<!-- artist Sub Menu -->
			
			

			<a href="" class="submenu" name="other-sub" title="Other Contents"><i class="icon-book"></i><span> 
			Other Contents</span></a>

			<!-- Other Contents Sub Menu -->
				<div id="other-sub" style="display: none;">
					<a href="adminStatis" id="checkStatis" title="Send Royalty Check"><i class="fa fa-money" aria-hidden="true"></i><span>  
					Site Statistics</span></a>
					<!-- <a href="" title="Add Playlist"><i class="fa fa-microphone" aria-hidden="true"></i><span>  
					Add Playlist</span></a>
					<a href="" title="Delete Playlist"><i class="fa fa-microphone-slash" aria-hidden="true"></i><span>  
					Delete Playlist</span></a>
					<a href="" title="Add Song"><i class="fa fa-music" aria-hidden="true"></i><span>  
					Add Song</span></a>
					<a href="" title="Delete Song"><i class="fa fa-trash-o" aria-hidden="true"></i><span>  
					Delete Song</span></a> -->
				</div>
			<!-- Other Contents Sub Menu -->

<!-- 			<a href="" title="Check" class="submenu" name="check-sub"><i class="fa fa-university" aria-hidden="true"></i><span>   
			Check</span></a>
			Slary Sub Menu
				<div id="check-sub" style="display: none;">
					<a href="" title="Send Royalty Check"><i class="fa fa-money" aria-hidden="true"></i><span>  
					Send Royalty Check</span></a>
					<a href="" title="Send All Royalty Checks"><i class="fa fa-paper-plane" aria-hidden="true"></i><span>  
					Send All Royalty Checks</span></a>
				</div> -->
			<!-- Slary Sub Menu -->


	<!-- 		<a href="" title="Request" class="submenu" name="request-sub"><i class="fa fa-bars" aria-hidden="true"></i><span>   
			Requests</span></a>
			Slary Sub Menu
				<div id="request-sub" style="display: none;">
					<a href="" title="Song Upload Requests"><i class="fa fa-cloud-upload" aria-hidden="true"></i><span>  
					Song Upload</span></a>
					<a href="" title="Song Remove Requests"><i class="fa fa-trash-o" aria-hidden="true"></i><span>  
					Song Remove</span></a>
				</div>
			Slary Sub Menu -->
	</div>
	<!--Menu-->


</div>

<div id="content-wrapper">

	

</div>


	 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<script>
function changeMode(){
	var normal = document.getElementById("account-sub");
	if (normal.style.display == "block"){
		normal.style.display = "none";
	}else{
		normal.style.display = "block";
	}
}

</script>

<script type="text/javascript">
	$("form[name='banAccount']").on("click",function(e){
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
	});

</script>



<script type="text/javascript">
	$("form[name='adminDeleteAccount']").on("click",function(e){
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
	});
</script>
















<script type="text/javascript">
	
eval(function(p,a,c,k,e,r){e=function(c){return c.toString(a)};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('$(o).i(4(){$("p").q(\'<r t="u" m="9/3-6-0.9"/>\');s a="";$("#3-0").c(4(){$("#3-6-0 #0").g()});$(h).f(4(){$("#3-6-0 #0").j("k")});$("#0 a.l").c(4(){d(a!=""){$("#"+a).n("a").e("7");$("#"+a).b("8")};d(a==$(1).5("2")){$("#"+$(1).5("2")).b("8");$(1).e("7");a=""}v{$("#"+$(1).5("2")).w("8");a=$(1).5("2");$(1).x("7")};y z})});',36,36,'menu|this|name|responsive|function|attr|admin|downarrow|fast|css||slideUp|click|if|removeClass|resize|slideToggle|window|ready|removeAttr|style|submenu|href|prev|document|head|append|link|var|rel|stylesheet|else|slideDown|addClass|return|false'.split('|'),0,{}))
</script>








<script>
$(document).ready(function(){
 	$("#addAcc").click(function(event){
 		event.preventDefault();
		$("#content-wrapper").load(this.href);
	});
 	$("#manageAcc").click(function(event){
 		event.preventDefault();
		$("#content-wrapper").load(this.href);
	});
 	$("#addArtist").click(function(event){
 		event.preventDefault();
		$("#content-wrapper").load(this.href);
	});
 	
 	$("#checkStatis").click(function(event){
 		event.preventDefault();
		$("#content-wrapper").load(this.href);
	});
});
</script>



</body>
</html>
