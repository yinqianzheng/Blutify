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
<div id="adminAccountList" style=" border-bottom:1px #e8e8e8 solid;background-color:#f3f3f3;padding:8px;font-size:13px;font-weight:700;color:#45484d;">
							Account list
							<div class="searchbar" >
								<input type="text" id="accoutManagementSearch" placeholder="Filter" oninput="adminFilterAccount()">
	  						</div>
	  						<div style="padding:15px;">
								<div class="col-sm-1">ID</div>
    								<div class="col-sm-2" >NickName</div>
    								<div class="col-sm-6" >Email</div>
	  						</div>
	  						<div id="AccountAppendList" style="padding:15px;">
	  							<c:forEach items="${accounts}" var="account">
	  								<div style="padding:10px;">
	  									<div class="col-sm-1" >${account.id}</div>
	  									<div class="col-sm-2" >${account.nickname}</div>
	  									<div class="col-sm-4" >${account.email}</div>
	  									
	  									<div class="col-sm-1" >
	  										<form class="AccountManageForms" action='adminBanAccount' method='post'>
	  											<input type='hidden' name='email'  value='${account.email}'/>
	  											<button  type='submit' style="background: white;">${account.ban}</button>
	  										</form>
	  									</div>
	  									<div class="col-sm-1" >
	  										<form class="AccountManageForms" action='adminDeleteAccount' method='post'>
	  											<input type='hidden' name='email'  value='${account.email}'/>
	  											<button  type='submit' style="background: white;">Delete</button>
	  										</form>
	  									</div>
	  									<hr>
	  								</div>
								</c:forEach>
							</div>
	  					</div>
<script>
function adminChangeBanColor(){
	var children = document.getElementById("AccountAppendList").children;
	var len = children.length;
	for (var i = 0; i < len; i++) {
		var em = children[i].children[3].children[0].children[1].innerHTML;
			if(em=="BANNED"){
				
				children[i].children[3].children[0].children[1].style.color='red';
			}
		}
}

function adminFilterAccount(){
	var x = document.getElementById("accoutManagementSearch").value;
	var children = document.getElementById("AccountAppendList").children;
	if(x==""){
		for (var i = 0; i < children.length; i++) {
    			children[i].style.display='block';
    		}
	}else{
		for (var i = 0; i < children.length; i++) {
			var c = children[i].children[2].innerHTML;
			var d = children[i].children[1].innerHTML;
			var re = new RegExp(x,"i");
			var n1 = c.search(re);
			var n2 = d.search(re);
			if(n1==-1 && n2==-1){
				children[i].style.display='none';
			}else{
				children[i].style.display='block';
			}
		}
	}
}

$(document).ready(function(){
	adminChangeBanColor();
	$(".AccountManageForms").submit(function(e) {
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
				var data1 = jQuery.parseJSON(json.responseText);
				if(data1.action=="adminDeleteAccount"){
					var children = document.getElementById("AccountAppendList").children;
					var len = children.length;
					for (var i = 0; i < len; i++) {
		        			var em = children[i].children[2].innerHTML;
		        			if(em==data1.value){
		        				document.getElementById("AccountAppendList").removeChild(children[i]);
		        			}
		        		}
				}else if(data1.action=="ban"){
					var children = document.getElementById("AccountAppendList").children;
					var len = children.length;
					for (var i = 0; i < len; i++) {
	        			var em = children[i].children[2].innerHTML;
		        			if(em==data1.value){
		        				children[i].children[3].children[0].children[1].innerHTML = data1.ban;
		        				if(data1.ban=="BANNED"){
		        					children[i].children[3].children[0].children[1].style.color='red';
				        		}else{
				        			children[i].children[3].children[0].children[1].style.color='black';
					        	}
		        				
		        			}
	        			}
				}else{

				}
				
			}
		});
	});
});
</script>
</body>
</html>