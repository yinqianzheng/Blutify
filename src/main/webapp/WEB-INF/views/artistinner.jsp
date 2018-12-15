<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>responsive-admin-menu</title>
<%--     <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>

  <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>

 <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
  <link rel='stylesheet prefetch' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/8.3.0/nouislider.min.css'>

 --%>

</head>
<body>
  <div class="row">
    <div class="col-sm-2" style=" margin-top: 20px">
      	<label for="">artistName</label>
      	 <input type="text" name="artistName" value=${artist.name} >
     </div>
      <div class="col-lg-5" style="margin-left: 10%">
		<label for="">Biography</label>
      	 <textarea id="artistBio" style="width: 800px; height: 400px; font-size: 20px; ">${artistInfo.biography}</textarea>
     </div>
    </div>
<!--       <div class="row" style="margin-top: 100px; margin-left: 50px;">
        <div class="col-sm-3"><button style="color: green; background-color: black;" onclick="save()"> Save </button></div>
        <div class="col-sm-2"><button style="background-color: black; color: white;" onclick="cancel()"> Cancel </button></div>
      </div> -->
<!--     </div>
  </div> -->
<%--   <div class="row">
    <div class="row" style="height: 50px; width: 100%;" >
      <p style="font-size: 24px; padding-left: 40px;">Biography</p>
    </div>
    <div class="row" style="padding-left: 50px;">
      <span><textarea id="artistBio" style="width: 800px; height: 400px; font-size: 20px; ">${artistInfo.biography}</textarea></span>
    </div>
  </div> --%>


<script type="text/javascript">
/*   function save(){
    var info = document.getElementById("artistName").value;
    var info2 = document.getElementById("artistBio").value;
    alert(info);
    // jQuery.support.cors = true;
    $.ajax({
      type:"post",
      url: 'saveArtistEdit',
      dataType: 'application/json',
      data: {artistName: info, artistBio: info2},
      complete: function(json){
         alert(12);
        var jsonBack = jQuery.parseJSON(json.responseText);
      }
    }); 

  } */
</script>










  </body>
  </html>