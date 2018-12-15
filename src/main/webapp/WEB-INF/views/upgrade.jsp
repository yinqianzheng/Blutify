<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body >
<div class="container" style="margin-left: 20%; padding-top: 10%">
<div class="row" style="min-height: 600px">
<div class="col-xs-3" style="color: #181818; padding-top: 5%;">
<div class="panel panel-default credit-card-box">
<h3>Become a Premium user for ${fee} /month + tax.</h3>
<span>You can cancel anytime.</span>
</div>
</div>
<!-- You can make it whatever width you want. I'm making it full width
on <= small devices and 4/12 page width on >= medium devices -->
<div class="col-xs-12 col-md-4">


<!-- CREDIT CARD FORM STARTS HERE -->
<div class="panel panel-default credit-card-box">
<div class="panel-heading display-table" >
<div class="row display-tr" >
<h3 class="panel-title display-td" style="padding-top: 15px; padding-left: 10px;display: inline; font-weight: bold;  display: table-cell;">Payment Details</h3>
<div class="display-td" >                            
<img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
</div>
</div>                    
</div>
<div class="panel-body">
<form role="form" name="payment-form" action="upgradeAccount" method="post">
<div class="row">
<div class="col-xs-12">
<div class="form-group">
<label for="cardNumber">CARD NUMBER</label>
<div class="input-group">
<input type="number" class="form-control" id="cardNumber" name="cardNumber" placeholder="Valid Card Number" autocomplete="cc-number" onblur="valid_credit_card()" required />
<span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
</div>
</div>                            
</div>
</div>
<div class="row">
<div class="col-xs-7 col-md-7">
<div class="form-group">
<label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
<input type="month" class="form-control" id="txtdate" placeholder="MM / YY" style="padding-left: 5px" required onblur="valid_ex()"/>
</div>
</div>
<div class="col-xs-5 col-md-5 pull-right">
<div class="form-group">
<label for="cardCVC">CV CODE</label>
<input type="number" class="form-control" name="" id="CVS" placeholder="CVC" autocomplete="cc-csc" onblur="valid_cvc()" required/>
</div>
</div>
</div>

<div class="row">
<div class="col-xs-12">
<button id="upSub" class="btn btn-success btn-lg btn-block" style="position: sticky">Start Subscription</button>
</div>
</div>
<div class="row" style="display:none;">
<div class="col-xs-12">
<p class="payment-errors"></p>
</div>
</div>
</form>
</div>
</div>            
<!-- CREDIT CARD FORM ENDS HERE -->


</div>            



</div>
</div>

<!-- 
<script type="text/javascript" src="https://js.stripe.com/v2/"></script> -->
<script>
function valid_credit_card() {
		var flag = 0;
 	    var value = document.getElementById("cardNumber").value; 
	  // accept only digits, dashes or spaces
		if (/[^0-9-\s]+/.test(value)) return false;

		// The Luhn Algorithm. It's so pretty.
		var nCheck = 0, nDigit = 0, bEven = false;
		value = value.replace(/\D/g, "");

		for (var n = value.length - 1; n >= 0; n--) {
			var cDigit = value.charAt(n),
				  nDigit = parseInt(cDigit, 10);

			if (bEven) {
				if ((nDigit *= 2) > 9) nDigit -= 9;
			}

			nCheck += nDigit;
			bEven = !bEven;
		}

		if( (nCheck % 10) == 0)
		{
			document.getElementById("cardNumber").style.background = "white";
			document.getElementById("upSub").disabled=false;
			flag = 1;
		}
		else
		{
			document.getElementById("upSub").disabled=true;
			document.getElementById("cardNumber").style.background = "pink";
			flag = 0
		}
}	



function valid_ex() {
	if(flag == 1){
		flag = 0;
		document.getElementById("upSub").disabled=true;
		var today = new Date();
		var EnteredDate = document.getElementById("txtdate").value; //for javascript
	
	    var date = EnteredDate.substring(0, 2);
	    var month = EnteredDate.substring(3, 5);
	    var year = EnteredDate.substring(6, 10);
	    var myDate = new Date(year, month - 1, date);
		if(myDate > today)
		{
			document.getElementById("txtdate").style.background = "white";
			document.getElementById("upSub").disabled=false;
			flag = 1;
		}
		else
		{
			document.getElementById("txtdate").style.background = "pink";
			flag = 0;
		}
	}
}
function valid_cvc() {
	if(flag == 1){
		document.getElementById("upSub").disabled=true;
		var cvcValue = document.getElementById("CVS").value;
		if(cvcValue.length !=3)
		{
			document.getElementById("CVS").style.background = "pink";	
		}
		else
		{
			document.getElementById("CVS").style.background = "white";
			document.getElementById("upSub").disabled=false;
		}
	}
}

/* $(document).ready(function() {
	$( "form[name='payment-form']" ).submit(function(e) {
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
				window.location.href = jsonBack.value;
			}
		});
	});
}); */
</script>
</body>
</html>