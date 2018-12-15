<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.blue.model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <style type="text/css">
	<%@ include file="../../resources/css/bootstrap.min.css" %>
	</style>
<style>
.tableOuter {
  position: absolute;
  width: 100%;
  top: 10px;
  height: 100%;
  left: 30px;
  border: 1px solid black;
}
.wocaole {
  position: absolute;
  width: 100%;
  height: 40px;
  border: 1px solid red;
  
}
.number {
  width: 10%;
  height: inherit;
  left: 0;
  border: 1px solid green;
    position: relaive;
}
.title {
  width: 10%;
  height: inherit;
  left: 0;
  top: 0;
  margin: auto;
  position: relaive;
  border: 1px solid green;
}
.artist {
  background-image: url();
  width: 20px;
  height: 20px;
  left: 0;
  top: 50%;
  margin: -17.5px auto;
  background-size: 100%;
  background-repeat: no-repeat;
  position: relaive;
}
</style>
</head>
<body>
<div class="row">
    <div class="col-sm-1 " style="border: 1px solid green; text-align: center">1 </div>
    <div class="col-md-4 " style="border: 1px solid blue">asdasdasddsadsadasdasdsaasdas </div>
    <div class="col-md-2" style="border: 1px solid red">asdasdasdasasdasdadsadsadsasdsa </div>
    <div class="col-md-1" style="border: 1px solid yellow">asdasddsadas </div>
    <div class="col-md-1" style="border: 1px solid grey">adsasd </div>
   </div>

           

      </div>
</body>
</html>