<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<div id="royaltiesTitle" style="font-size: 16px; color:white">
			<div class="row" style="width: 70%; padding-bottom: 10px">
				<div class="col-sm-1">ID</div>
				<div class="col-sm-5" >Title</div>
				<div class="col-sm-2" >Listeners</div>
				<div class="col-sm-2" >Income</div>
				<div class="col-sm-2"><a onclick="showMethodDetail()">Detail</a></div>
			</div>
			<div id="royaltiesIncome">
			<c:forEach items="${songsRoyalties}" var="royalty">
				<div class="row" style="border-bottom: 1px solid #aaaaaa; width: 70%">
					<div class="col-sm-1">${royalty.id}</div>
					<div class="col-sm-5" >${royalty.name}</div>
					<div class="col-sm-2" >${royalty.songClickCount}</div>
					<div class="col-sm-2"><span>$</span>${royalty.income}</div>
									<!-- <hr style="color: #aaaaaa; width: 80%; left:0; height: 1px;"> -->
				</div>
				</c:forEach>
			</div>
			<div class="row" style="width: 70%">
				<div style="margin-left: 60% ">
					<h3> Total salary = $<span>${totalsalary}</span></h3>
				</div>
			</div>
			<div class="row" id="method" style="display: none; ">
			    <div class="col-sm-7">
			      <h3>Income method: </h3><br>
			      <h5>Total Income = Total number of Premium * Permium Fee</h5><br>
			      <h5>Per Listener Fee To Artist = Total Income * 0.5 / Total number of listeners</h5><br>
			      <h5>Artist's Per Song Salary = Per Song Salary * Number of Listeners</h5><br>
			      <h5>Artist's Total Salary = Sum of Artist's Per Song Salary</h5><br>
			    </div>
<%-- 			    <div class="col-sm-3"><h3> Total salary = $<span>${totalsalary}</span></h3></div> --%>
			   </div>
		</div>
<script>
function showMethodDetail()
{
	var method = document.getElementById("method");
	if (method.style.display === "none") {
		method.style.display = "block";
    } else {
    	method.style.display = "none";
    }
}
</script>
</body>
</html>