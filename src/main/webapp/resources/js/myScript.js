// Sliders

var slider = document.getElementById('song-progress');

noUiSlider.create(slider, {
	start: [ 20],
	range: {
		'min': [   0 ],
		'max': [ 100 ]
	}
});

var slider = document.getElementById('song-volume');

noUiSlider.create(slider, {
	start: [ 90 ],
	range: {
		'min': [   0 ],
		'max': [ 100 ]
	}
});


	function changeIcon(){
		alert($(this));
		$(this).toggleClass("ion-plus not-added");
	}	



// Tooltips

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

/*function viewAL()
{
		
 	$("form[name='viewAL']").on("click",function(e){
 		alert("here");
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

				parent.document.getElementById('content').load(jsonBack.value);

			}
		});
	});
}*/

// Viewport Heights

$(window).on("resize load", function(){
  
  var totalHeight = $(window).height();

  var headerHeight = $('.header').outerHeight();
  var footerHeight = $('.current-track').outerHeight();
  var playlistHeight = $('.playlist').outerHeight();
  var nowPlaying = $('.playing').outerHeight();

  var navHeight = totalHeight - (headerHeight + footerHeight + playlistHeight + nowPlaying);
  var artistHeight = totalHeight - (headerHeight + footerHeight);

  console.log(totalHeight);
  
  $(".navigation").css("height" , navHeight);
  $(".artist").css("height" , artistHeight);
  $(".social").css("height" , artistHeight);
  
});
    


  

// Collapse Toggles

$(".navigation__list__header").on( "click" , function() {
  
  $(this).toggleClass( "active" );
  
});


// Media Queries

$(window).on("resize load", function(){
	if ($(window).width() <= 768){	
		
    $(".collapse").removeClass("in");
    
    $(".navigation").css("height" , "auto");
    
    $(".artist").css("height" , "auto");
    
	}	
});

$(window).on("resize load", function(){
	if ($(window).width() > 768){	
		
    $(".collapse").addClass("in");
    
	}	
});

function changeProfileImg(){	
	$("#profileFile").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#profileimage')
					.attr('src', e.target.result)
					.width(250)
					.height(250);
			};
			reader.readAsDataURL(this.files[0]);
		}
	});
}	

/*function load()
{
 	$("form[name='loadPL']").on("click",function(e){
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

				$("#content").load(jsonBack.value);

			}
		});
	});
}*/

function changeImg(){
	$("#file").change(function() {
		if (this.files && this.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#playlistCover')
					.attr('src', e.target.result)
					.width(200)
					.height(200);
			};
			reader.readAsDataURL(this.files[0]);
		}
	});
}


function createPl(){
	$("#submitBtn").click(function (event) {
		event.preventDefault();
		var form = $('#createPlForm')[0];
		var data = new FormData(form);
		$("#submitBtn").prop("disabled", true);
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "createPlaylist",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			success: function (json) {
				console.log("SUCCESS : ", data);
				$("#submitBtn").prop("disabled", false);
			},
			error: function (e) {
				$("#result").text(e.responseText);
				console.log("ERROR : ", e);
	 			$("#submitBtn").prop("disabled", false);
			},
			complete: function (json) {
				var data = jQuery.parseJSON(json.responseText);
				if(data.status == true) {
					$("#left-nav").append("<li><a>"+data.value+"</a></li>");
					$("#submitBtn").closest('form').find("input[type=text]").val("");
					$("#submitBtn").closest('form').find("textarea").val("Playlist Description");
					$('#playlistCover').attr('src','<c:url value="/resources/images/default.jpeg" />');
				}
				else{
					$('#createPLE').val(data.value)
					$('#createPLE').addClass("input-p-error");	
				}
			}
		});
	});
}


function closeCreatePL(){
	$("button[id^='close']").click(function() {
		$('#createPLE').val("") 
		$('#createPLE').addClass("input-p");
		$(this).closest('form').find("input[type=text]").val("");
		$(this).closest('form').find("textarea").val("");
		$('#playlistCover').attr('src','<c:url value="/resources/images/default.jpeg" />');
	});
}


function register_login(){
	$("form").submit(function(e) {
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
				if (data.action == "signUp"){
				   signUphandle(data);
				}else if(data.action=="login"){
				   logInhandle(data);
				}
			}
		 });
	});
}


function signUphandle(data){
	if(data.status == false){
		if(data.email == true){
			$('#signUpErrorE').val("Email existed");
	  		$('#signUpErrorE').after($("#signUp-title"));
	  		$('#signUpErrorE').addClass("input-p-error");
        }
	  	else{
	  		$('#signUpErrorE').removeClass("input-p-error");
	  		$('#signUpErrorE').addClass("input-p");
	  	}
        if(data.nickname == true){
           	$('#signUpErrorN').val("Nick name existed");
           	$('#signUpErrorN').after($("#signUp-title"));
            $('#signUpErrorN').addClass("input-p-error");
        }
	  	else{
	  		$('#signUpErrorN').removeClass("input-p-error");
	  		$('#signUpErrorN').addClass("input-p");
	  	}
	}
	else{
		$('#signUpErrorN').addClass("input-p");
	  	$('#signUpErrorE').val("success");
	  	$('#signUpErrorE').after($("#signUp-title"));
	  	$('#signUpErrorE').addClass("input-p-success"); 
	}
}


function logInhandle(data){
	if(data.status == false){
		$('#loginError').removeClass("input-p");
		$('#loginError').val(data.value);
		$('#loginError').addClass("input-p-error");
	}
	else{
	  	window.location.href = data.value;
	}
}


function close_regi_log_modal(){	  			
	$("button[id^='close']").click(function() {
		$('#signUpErrorN').removeClass("input-p-error");
		$('#signUpErrorE').removeClass("input-p-error");
		$('#signUpErrorE').removeClass("input-p-success");
		$( "#loginError" ).removeClass("input-p-error");
		$('#signUpErrorN').addClass("input-p");
		$('#signUpErrorE').addClass("input-p");
		$( "#loginError" ).addClass("input-p");
		$(this).closest('form').find("input[type=text], input[type=password], input[type=email], input[type=date]").val("");
	});
}