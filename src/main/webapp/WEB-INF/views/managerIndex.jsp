<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
	<style>
html, body {
  background: #eee;
  height: 100%;
  margin: 0;
}

.container {
  display: flex;
  width: 100%;
  height: 100%;
  align-items: center;
}

.form-login-wrapper {
  width: 100%;
  height: 100%；
}

.form-login {  
  background-color: #fff;
  margin: 0 auto;
  max-width: 380px;
  padding: 40px 40px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.form-login form input:first-of-type {
  margin-top: 20px;
}

.form-login form input {
  margin-top: 10px;
}

.form-login form button {
  margin-top: 10px;
}
</style>
</head>

<body>
<div class="container">
    <div class="form-login-wrapper">
    <div class="form-login">
      <form action="#" method="">    
        <h3 class="form-login-heading">Server Manager login</h3>
        <input type="text" class="form-control" name="username" placeholder=""/>
        <input type="password" class="form-control" name="password" placeholder="" />
        <button class="btn btn-lg btn-primary btn-block">Log in</button>
      </form>
    </div>    
  </div>
</div>
</body>
</html>