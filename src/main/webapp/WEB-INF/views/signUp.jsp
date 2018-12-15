<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>


<meta charset=utf-8 />
<title>JS Bin</title>
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<style>
  article, aside, figure, footer, header, hgroup, 
  menu, nav, section { display: block; }
</style>
<script> 
$(document).ready(function () {

	$("#submitBtn").click(function (event) {
	        event.preventDefault();
	        var form = $('#createPlForm')[0];
	        var data = new FormData(form);
	        $("#submitBtn").prop("disabled", true);
	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "uploadFile",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            complete: function (json) {
	         		alert("a");
	            }
	        });
	    });

});
</script>
</head>
<body>



	<input type="text" value = ${defautImage}/>

   <form id="fileUploadForm" action="uploadFile" method = "post" enctype="multipart/form-data">
         
         <img id ="blah"  src="<c:url value="/resources/images/add.jpg" />">
  		<input type='file' name= "image" onchange="readURL(this);" />
  		 <input type="text" name="name" />
  		 <input type="text" name="description" />
         <input  id="btnSubmit" type="submit" value = "submit"/>
    </form>

<img  src="<c:url value="/resources/FileSystem/wocaole@gmail.com/wocaole.jpeg" />">





  <script>
 function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>