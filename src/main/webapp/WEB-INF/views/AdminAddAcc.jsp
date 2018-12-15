<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.clearfix:after {
  content: "";
  display: block;
  clear: both;
  visibility: hidden;
  height: 0;
}

.form_wrapper {
  background: #fff;
  width: 400px;
  max-width: 100%;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  padding: 25px;
  margin: 1% auto 0;
  position: relative;
  z-index: 1;
  border-top: 5px solid #f5ba1a;
  -webkit-box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
  -webkit-transform-origin: 50% 0;
  transform-origin: 50% 0;
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  -webkit-transition: none;
  transition: none;
  -webkit-animation: expand 0.8s 0.6s ease-out forwards;
  animation: expand 0.8s 0.6s ease-out forwards;
  opacity: 0;
}

.form_wrapper h2 {
  font-size: 1.5em;
  line-height: 1.5em;
  margin: 0;
}

.form_wrapper .title_container {
  text-align: center;
  padding-bottom: 15px;
}

.form_wrapper h3 {
  font-size: 1.1em;
  font-weight: normal;
  line-height: 1.5em;
  margin: 0;
}

.form_wrapper label {
  font-size: 12px;
}

.form_wrapper .row {
  margin: 10px -15px;
}

.form_wrapper .row > div {
  padding: 0 15px;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}

.form_wrapper .col_half {
  width: 50%;
  float: left;
}

.form_wrapper .col_quarter {
  width: 25%;
  float: left;
}

.form_wrapper .input_field {
  position: relative;
  margin-bottom: 20px;
  -webkit-animation: bounce 0.6s ease-out;
  animation: bounce 0.6s ease-out;
}

.form_wrapper .input_field > span {
  position: absolute;
  left: 0;
  top: 0;
  color: #333;
  height: 100%;
  border-right: 1px solid #cccccc;
  text-align: center;
  width: 30px;
}

.form_wrapper .input_field > span > i {
  padding-top: 10px;
}

.form_wrapper .textarea_field > span > i {
  padding-top: 10px;
}

.form_wrapper input[type="text"], .form_wrapper input[type="email"], .form_wrapper input[type="password"] {
  width: 100%;
  padding: 8px 10px 9px 35px;
  height: 35px;
  border: 1px solid #cccccc;
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
  outline: none;
  -webkit-transition: all 0.30s ease-in-out;
  transition: all 0.30s ease-in-out;
}

.form_wrapper input[type="text"]:hover, .form_wrapper input[type="email"]:hover, .form_wrapper input[type="password"]:hover {
  background: #fafafa;
}

.form_wrapper input[type="text"]:focus, .form_wrapper input[type="email"]:focus, .form_wrapper input[type="password"]:focus {
  -webkit-box-shadow: 0 0 2px 1px rgba(255, 169, 0, 0.5);
  box-shadow: 0 0 2px 1px rgba(255, 169, 0, 0.5);
  border: 1px solid #f5ba1a;
  background: #fafafa;
}

.form_wrapper input[type="submit"] {
  background: #f5ba1a;
  height: 35px;
  line-height: 35px;
  width: 100%;
  border: none;
  outline: none;
  cursor: pointer;
  color: #fff;
  font-size: 1.1em;
  margin-bottom: 10px;
  -webkit-transition: all 0.30s ease-in-out;
  transition: all 0.30s ease-in-out;
}

.form_wrapper input[type="submit"]:hover {
  background: #e1a70a;
}

.form_wrapper input[type="submit"]:focus {
  background: #e1a70a;
}

.form_wrapper input[type="checkbox"], .form_wrapper input[type="radio"] {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.form_container .row .col_half.last {
  border-left: 1px solid #cccccc;
}

.checkbox_option label {
  margin-right: 1em;
  position: relative;
}

.checkbox_option label:before {
  content: "";
  display: inline-block;
  width: 0.5em;
  height: 0.5em;
  margin-right: 0.5em;
  vertical-align: -2px;
  border: 2px solid #cccccc;
  padding: 0.12em;
  background-color: transparent;
  background-clip: content-box;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.checkbox_option label:after {
  border-right: 2px solid #000000;
  border-top: 2px solid #000000;
  content: "";
  height: 20px;
  left: 2px;
  position: absolute;
  top: 7px;
  -webkit-transform: scaleX(-1) rotate(135deg);
          transform: scaleX(-1) rotate(135deg);
  -webkit-transform-origin: left top;
          transform-origin: left top;
  width: 7px;
  display: none;
}

.checkbox_option input:hover + label:before {
  border-color: #000000;
}

.checkbox_option input:checked + label:before {
  border-color: #000000;
}

.checkbox_option input:checked + label:after {
  -webkit-animation: check 0.8s ease 0s running;
  animation: check 0.8s ease 0s running;
  display: block;
  width: 7px;
  height: 20px;
  border-color: #000000;
}

.radio_option {
  position: relative;
  width: 100%;
}

.radio_option div.radio_group {
  display: block;
  height: auto;
  padding: 5px 35px;
  border: 1px solid #cccccc;
}

.radio_option span {
  position: absolute;
  left: 0;
  top: 0;
  color: #333;
  height: 100%;
  border-right: 1px solid #CCC;
  width: -moz-fit-content;
  float: left;
}

.radio_option label {
  margin-right: 1em;
}

.radio_option label:before {
  content: "";
  display: inline-block;
  width: 0.5em;
  height: 0.5em;
  margin-right: 0.5em;
  border-radius: 100%;
  vertical-align: 3px;
  border: 2px solid #cccccc;
  padding: 0.15em;
  background-color: transparent;
  background-clip: content-box;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.radio_option input:hover + label:before {
  border-color: #000000;
}

.radio_option input:checked + label:before {
  background-color: #000000;
  border-color: #000000;
}

.select_option {
  position: relative;
  width: 100%;
}

.select_option select {
  display: inline-block;
  width: 100%;
  height: 35px;
  padding: 0px 15px;
  cursor: pointer;
  color: #7b7b7b;
  border: 1px solid #cccccc;
  border-radius: 0;
  background: #fff;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  -webkit-transition: all 0.2s ease;
  transition: all 0.2s ease;
}

.select_option select::-ms-expand {
  display: none;
}

.select_option select:hover, .select_option select:focus {
  color: #000000;
  background: #fafafa;
  border-color: #000000;
  outline: none;
}

.select_arrow {
  position: absolute;
  top: calc(50% - 4px);
  right: 15px;
  width: 0;
  height: 0;
  pointer-events: none;
  border-width: 8px 5px 0 5px;
  border-style: solid;
  border-color: #7b7b7b transparent transparent transparent;
}

.button {
  background: #f5ba1a;
  height: 35px;
  line-height: 35px;
  width: 100%;
  border: none;
  outline: none;
  cursor: pointer;
  color: #fff;
  font-size: 1.1em;
  margin-bottom: 10px;
  -webkit-transition: all 0.30s ease-in-out;
  transition: all 0.30s ease-in-out;
}

.button:hover {
  background: #e1a70a;
}

.button:focus {
  background: #e1a70a;
}

.select_option select:hover + .select_arrow, .select_option select:focus + .select_arrow {
  border-top-color: #000000;
}

.credit {
  display: none;
  position: relative;
  z-index: 1;
  text-align: center;
  padding: 15px;
  color: #f5ba1a;
}

.credit a {
  color: #e1a70a;
}

@-webkit-keyframes check {
  0% {
    height: 0;
    width: 0;
  }
  25% {
    height: 0;
    width: 7px;
  }
  50% {
    height: 20px;
    width: 7px;
  }
}

@keyframes check {
  0% {
    height: 0;
    width: 0;
  }
  25% {
    height: 0;
    width: 7px;
  }
  50% {
    height: 20px;
    width: 7px;
  }
}

@-webkit-keyframes expand {
  0% {
    -webkit-transform: scale3d(1, 0, 1);
    opacity: 0;
  }
  25% {
    -webkit-transform: scale3d(1, 1.2, 1);
  }
  50% {
    -webkit-transform: scale3d(1, 0.85, 1);
  }
  75% {
    -webkit-transform: scale3d(1, 1.05, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    opacity: 1;
  }
}

@keyframes expand {
  0% {
    -webkit-transform: scale3d(1, 0, 1);
    transform: scale3d(1, 0, 1);
    opacity: 0;
  }
  25% {
    -webkit-transform: scale3d(1, 1.2, 1);
    transform: scale3d(1, 1.2, 1);
  }
  50% {
    -webkit-transform: scale3d(1, 0.85, 1);
    transform: scale3d(1, 0.85, 1);
  }
  75% {
    -webkit-transform: scale3d(1, 1.05, 1);
    transform: scale3d(1, 1.05, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
    opacity: 1;
  }
}

@-webkit-keyframes bounce {
  0% {
    -webkit-transform: translate3d(0, -25px, 0);
    opacity: 0;
  }
  25% {
    -webkit-transform: translate3d(0, 10px, 0);
  }
  50% {
    -webkit-transform: translate3d(0, -6px, 0);
  }
  75% {
    -webkit-transform: translate3d(0, 2px, 0);
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    opacity: 1;
  }
}

@keyframes bounce {
  0% {
    -webkit-transform: translate3d(0, -25px, 0);
    transform: translate3d(0, -25px, 0);
    opacity: 0;
  }
  25% {
    -webkit-transform: translate3d(0, 10px, 0);
    transform: translate3d(0, 10px, 0);
  }
  50% {
    -webkit-transform: translate3d(0, -6px, 0);
    transform: translate3d(0, -6px, 0);
  }
  75% {
    -webkit-transform: translate3d(0, 2px, 0);
    transform: translate3d(0, 2px, 0);
  }
  100% {
    -webkit-transform: translate3d(0, 0, 0);
    transform: translate3d(0, 0, 0);
    opacity: 1;
  }
}

@media (max-width: 600px) {
  .form_wrapper .col_half {
    width: 100%;
    float: none;
  }
  .bottom_row .col_half {
    width: 50%;
    float: left;
  }
  .form_container .row .col_half.last {
    border-left: none;
  }
  .remember_me {
    padding-bottom: 20px;
  }
}

    </style>
</head>
<body>
  <div class="form_wrapper">
	<div class="form_container">
		<div class="title_container">
			<h2>Admin add account</h2>
			<span id="addError" style="display:none"></span>
		</div>
		<div class="row clearfix">
			<div class="">
				<form id='register-form' name="register-form" autocomplete="off" action="addAccount" method="post">
					<div class="row clearfix">
						<div class="col_half">
							<div class="input_field"> 
								<span>
									<i aria-hidden="true" class="fa fa-user"></i>
								</span>
								<input type="text" name="firstname" placeholder="First Name" />
							</div>
						</div>
						<div class="col_half">
							<div class="input_field"> 
								<span>
									<i aria-hidden="true" class="fa fa-user"></i>
								</span>
								<input type="text" name="lastname" placeholder="Last Name" />
							</div>
						</div>
					</div>
					<div class="input_field"> 
						<span>
							<i aria-hidden="true" class="fa fa-address-card"></i>
						</span>
						<input type="text" name="nickname" placeholder="Nickname *" required />
					</div>
					<div class="input_field"> 
						<span>
							<i aria-hidden="true" class="fa fa-envelope"></i>
						</span>
						<input type="email" name="email" placeholder="Email *" required />
					</div>
					<div class="input_field"> 
						<span><i aria-hidden="true" class="fa fa-lock">
							</i>
						</span>
						<input type="password" id="password" name="password" placeholder="Password" required />
					</div>
					<div class="input_field"> 
						<span>
							<i aria-hidden="true" class="fa fa-lock"></i>
						</span>
						<input type="password" id="rePW" name="" placeholder="Re-type Password" onblur="pwCheck()" required />
					</div>

					<div class="input_field radio_option">
						<span class='radio_icon'>
							<i class="fa fa-user-circle-o" aria-hidden="true"></i>
						</span>
						<div class='radio_group'>
							<input type="radio" name="type" id="gender-m" value="general"  checked="true">
							<label for="gender-m">General</label>

							<input type="radio" name="type" value="premium"  id="gender-f">
							<label for="gender-f">Premium</label>
						</div>
					</div>
					

<!--					<div class="input_field checkbox_option">
						<input type="checkbox" id="cb1">
						<label for="cb1">I agree with terms and conditions</label>
					</div>
					<div class="input_field checkbox_option">
						<input type="checkbox" id="cb2">
						<label for="cb2">I want to receive the newsletter</label>
					</div>
					<button id='check-data' class='button'>
						Check Data
					</button>
-->					<input id='submit-data' class="button" type="submit" value="Add" />
				</form>
			</div>
		</div>
	</div>
</div>
  <script src='https://use.fontawesome.com/723b3db6c5.js'></script>
  <script>
  /* Utility functions*/
  function _(id) {
  	return document.getElementById(id);
  }
  const formToJSON = elements => [].reduce.call(elements, (data, element) => {

  	data[element.name] = element.value;
  	return data;

  }, {});

  /* Handler Functions*/
  function checkData(event) {
  	event.preventDefault();
  }

  function submitData(event) {
  	event.preventDefault();
  }

  function registerForm(event) {
  	event.preventDefault();
  	var form = -('register-form');
  	var data = formToJSON(form.elements);
  }

  function countryList(event) {
  	var el = event.target;
  	_('country-error').innerText = "";
  	if (el.value.length < 1) {
  		_('country-datalist').innerHTML = "";
  		return false;
  	}
  	var cicon = _('country-icon');
  	cicon.classList.remove('fa-globe');
  	cicon.classList.add('fa-spinner', 'fa-fw');
  	console.log(el.value);
  	var request = new Request(window.location.protocol + '//www.pattaya-golfer.com/api.php',{
  		method: 'PUT',
  		mode: 'cors',
  		headers: new Headers({
  			'Content-Type': 'application/json'
  		}),
  		body: JSON.stringify({
  			action: 'countrylist',
  			query: el.value
  		})
  	});
  	
  	fetch(request).then(function(response){
  		return response.json();
  	}).then(function(jsonobj){
  		if (jsonobj.success === true){
  			var cdl = _('country-datalist');
  			cdl.options = {};
  			
  			var countries = jsonobj.countries;
//  			var countries = JSON.parse(jsonobj.countries);
//  			_('country-datalist').options = jsonobj.countries;
  /**/
  			while (cdl.firstChild) {
  				cdl.removeChild(cdl.firstChild);
  			}
  			countries.forEach(function(country){
  				console.log(country.name,'Country');

  				var op = document.createElement('option');
  				op.id = 'country-' + country.code;
  				op.value = country.name;
//  				op.text = country.name;
  				cdl.appendChild(op);
  			});
  /**/
  		}
  		else {
  			_('country-error').innerText = jsonobj.message;
  		}
  	}).catch(function(error){
  		_('country-error').innerText = "Catch: " + error;
  	});
  	cicon.classList.remove('fa-spinner', 'fa-fw');
  	cicon.classList.add('fa-globe');
  	
  }
  /* Document Ready Handler */
  document.addEventListener('DOMContentLoaded', function() {

  	var countrylist = _('country-list');
  	countrylist.addEventListener('input',countryList);
  	countrylist.addEventListener('click',function(event){
  		event.preventDefault();
  	});
  	/**
  	countrylist.addEventListener('focus',function(event){
  		event.target.value = '';
  	});
  	**/
/*   	_('check-data').addEventListener('click',checkData);
  	_('submit-data').addEventListener('click',submitData);
  	_('register-form').addEventListener('submit',registerForm); */
  });
  
function pwCheck()
{
	document.getElementById("submit-data").disabled=true;
	if (document.getElementById('password').value == document.getElementById('rePW').value) {
		document.getElementById("submit-data").disabled=false;
		document.getElementById('password').style.background = "white";
		document.getElementById('rePW').style.background = "white"; 
		document.getElementById('addError').innerHTML = "";
		document.getElementById('addError').style.display = "none";
		document.getElementById('addError').style.color = "black";

		document.getElementById("submit-data").style.background="#f5ba1a";
	} else {
		document.getElementById('password').style.background = "pink";
		document.getElementById('rePW').style.background = "pink"; 
		document.getElementById('addError').innerHTML = "Password not match";
		document.getElementById('addError').style.display = "block";
		document.getElementById('addError').style.color = "red";
		document.getElementById("submit-data").disabled=true;
		document.getElementById("submit-data").style.background="#e1a70a";
	}
}
  
  $("#register-form").submit(function (event) {
       event.preventDefault(); 
	  jQuery.support.cors = true;
		$.ajax({
			url: "addAccount",
			type: "post",
			dataType: 'application/json', 
			data: $(this).serialize(),
			complete: function(json) {
				var data = jQuery.parseJSON(json.responseText);
				if(data.status == false){
					if(data.email == true){
						document.getElementById('addError').innerHTML = "Email existed";
						document.getElementById('addError').style.display = "block";
						document.getElementById('addError').style.color = "red";
					}
					else{
						document.getElementById('addError').innerHTML = "";
						document.getElementById('addError').style.display = "none";
						document.getElementById('addError').style.color = "black";
					}
					if(data.nickname == true){
					    document.getElementById('addError').innerHTML = "Nick name existed";
						document.getElementById('addError').style.display = "block";
						document.getElementById('addError').style.color = "red";
					}
					else{
						document.getElementById('addError').innerHTML = "";
						document.getElementById('addError').style.display = "none";
						document.getElementById('addError').style.color = "black";
					}
				}
				else{
					document.getElementById('addError').innerHTML = "success";
					document.getElementById('addError').style.display = "block";
					document.getElementById('addError').style.color = "green";
				}

			}
		});
  });
  </script>
</body>
</html>