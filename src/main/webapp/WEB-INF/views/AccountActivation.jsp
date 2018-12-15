<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Activation</title>
</head>
<body>
<h1 style="color: #1ed748; text-align: center">Congratulations! Your account have been activated. You are a member of Blue family now.</h1>
<h5 style="font-size: 20px; text-align: center">Click <a id="aIndex" href="index">here</a> to index page.</h5>

<script>
$(document).ready(function(){
  	$("#aIndex").click(function(event){
 		event.preventDefault();
		window.location.href = this.href;
	});
});
</script>
</body>
</html>