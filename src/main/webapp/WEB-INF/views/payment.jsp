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
<div class="container" style="width: 90%">
    <div class="page-header">
    	<h1 style="color: #1cbd62">Payment History</h1>
  	</div>
	<div class="row" style="width: 100%; padding-left: 20px">
		 <form class="userPaymentHistoryForm" method="get" action="monthlyPaymentHistory" style="width: 80%">
		 <div class="col-sm-3">
	    	<span>Month: 
	    	<select name="month">
				  <option value="01">January</option>
				  <option value="02">February</option>
				  <option value="03">March</option>
				  <option value="04">April</option>
				  <option value="05">May</option>
				  <option value="06">June</option>
				  <option value="07">July</option>
				  <option value="08">August</option>
				  <option value="09">September</option>
				  <option value="10">October</option>
				  <option value="11">November</option>
				  <option value="12">December</option>
				</select>
			</span>
		</div>
		 <div class="col-sm-3">
	    	<span>Year: 
	    		<select name="year">
	    		  <option value="2017">2017</option>
				</select>
			</span>
		</div>
		 <div class="col-sm-5" style=" padding-left: 100px;">
      		<button>Get Monthly Report</button>
      	</div>
      	</form>
      	<form class="userPaymentHistoryForm" style="width: 20%" action="allPaymentHistory" method="get">
      		<button>Get All</button>
      	</form>
     </div>
     <hr>
     <div id="paymentDetail">   	
     </div>
</div>


<script>
function appendPaymentHistoryList(){
	var myNode = document.getElementById("paymentDetail");
    while (myNode.firstChild) {
        myNode.removeChild(myNode.firstChild);
    }
    <c:forEach items="${monthlyPayment}" var="obj" varStatus="songIndex">
		var num = "**** **** **** " + '${obj[3].toString().substring(12, 16)}';
		var div = document.createElement("div");
		var inner = "<div class='col-sm-4' style='border-bottom: 1px solid grey; padding-top: 5px;'><p>Date:</p><p>Description:</p><p>Credit Card Number:</p><p>Total:</p></div><div class='col-sm-6' style='border-bottom: 1px solid grey; padding-top: 5px;'><p>${obj[1]}</p><p>${obj[4]}</p><p>**** **** **** ${obj[3].toString().substring(12, 16)}</p><p>${obj[2]}</p></div>";  	
		div.innerHTML = inner;
		document.getElementById("paymentDetail").appendChild(div);
	</c:forEach>
}

function clearPaymentHistoryList(){
	var myNode = document.getElementById("paymentDetail");
    while (myNode.firstChild) {
        myNode.removeChild(myNode.firstChild);
    }
}


$(document).ready(function() {	
	$(".userPaymentHistoryForm").submit(function(e) {
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
				var data = jQuery.parseJSON(json.responseText);
				if(data.status){
					$("#content").load("viewHistory", function(){
						appendPaymentHistoryList();
				    });
					
				}else{
					clearPaymentHistoryList();
					document.getElementById("paymentDetail").innerHTML = data.value;
				}
				
			}
		});
	});
});
</script>
</body>
</html>