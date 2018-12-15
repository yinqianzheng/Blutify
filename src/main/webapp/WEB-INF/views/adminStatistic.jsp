<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.subfee {
    background-color: white;
    border: 1px solid #DFE2E2;
    border-radius: 3px;
    border-bottom-width: 2px;
    border-top-width: 0;
    padding: 15px;
}
@import url(https://fonts.googleapis.com/css?family=Roboto:400,300,500,700);

* {
  -webkit-box-sizing: border-box;
          box-sizing: border-box;
}


.content {
  min-width: 1000px;
  width: 100%;
  max-width: 1200px;
  height: 700px;
  background: #222;
  border-radius: 6px;
  margin: 20px auto;
}
.stats {
  height: 200px;
}

.col {
  width: 33.33%;
  height: 200px;
  float: left;
  padding: 10px;
  position: relative;
}

.middle:before, .middle:after {
  content: "";
  height: 80%;
  border: 1px solid #333;
  position: absolute;
  top: 0; bottom: 0;
  margin: auto;
}
.middle:before {
  left: 0;
}
.middle:after {
  right: 0;
}

.matchStats {
  float: right;
  width: 300px;
  height: 240px;
  position: relative;
}
#gameStats, #roleStats {
  position: absolute;
  top: 0; bottom: 0; right: 20px;
  margin: auto;
}
#champData {
  position: absolute;
  top: 0; bottom: 0; right: -10px;
  margin: auto;
}
#timeData {
  position: absolute;
  top: 0; bottom: 0; left: 0; right: 0;
  margin: auto;
}

.mainInfo {
  height: 240px;
  padding: 10px;
  width: calc(100% - 600px);
  float: left;
}
.mainInfo span {
  color: #999;
}

.mainInfo .aboutMe {
  font-size: 12px;
  color: #999;
}
h1 {
  color: #fff;
  font-size: 40px;
  margin: 0;
  padding: 0;
}
h2 {
  color: #FDB45C;
  font-size: 20px;
  margin: 0;
  padding: 0;
  margin-left: 5px;
  display: block;
  position: absolute;
  top: -5px; left: 10px;
}
h3 {
  display: block;
  font-size: 24px;
  margin: 0;
  margin-bottom: 10px;
  padding-top: 10px;
  border-bottom: 2px solid #333;color: #FDB45C;
}
.clearFix {
  clear: both;
}

.playerStats {
  margin: auto;
  padding: 0;
  list-style: none;
  margin: 6px;
}
.playerStats li {
  display: block;
  height: 30px;
  line-height: 30px;
  color: #fff;
}
.playerStats li span {
  display: inline-block;
  width: 60%;
  color: #999;
}

.backgroundText {
  width: 100%;
  height: 100%;
  font-size: 56px;
  color: rgba(255, 255, 255, 0.2);
  -webkit-transform: rotate(-90deg);
          transform: rotate(-90deg);
  text-transform: uppercase;
  letter-spacing: 0px;
  text-align: center;
}

.resizing {
  position: relative;
  width: 90%;
  height: 100%;
  padding: 0;
  position: absolute;
  left: 0; right: 0;
  margin: auto;
  bottom: 0;
}

.profitStats {
  margin: auto;
  padding: 0;
  list-style: none;
  margin: 6px;
  font-size: 14px;
}
.profitStats li {
  display: block;
  height: 30px;
  line-height: 30px;
  color: #fff;
}
.profitStats li span {
  display: inline-block;
  width: 60%;
  color: #aaaaaa;
  font-size: 16px;
}
.webStats {
  margin: auto;
  padding: 0;
  list-style: none;
  margin: 6px;
  font-size: 14px;
}
.webStats li {
  display: block;
  height: 30px;
  line-height: 30px;
  color: #fff;
}
.webStats li span {
  display: inline-block;
  width: 30%;
  color: #aaaaaa;
  font-size: 16px;
}

.songStats {
  margin: auto;
  padding: 0;
  list-style: none;
  margin: 6px;
  font-size: 14px;
}
.songStats li {
  display: block;
  height: 30px;
  line-height: 30px;
  color: #fff;
}
.songStats li span {
  display: inline-block;
  width: 60%;
  color: #aaaaaa;
  font-size: 16px;
}

</style>
</head>
<body>
<div class ="row">
<!-- left -->
<div class="col-lg-10">
<div class="content">
  <div class="mainInfo">
    <h1>Blue</h1>
      <span>CSE308</span>
      <div style="width:250px;">
      <div class="aboutMe" style="width: 250%;">
        <h3 style="padding-bottom: 5px">Data For Blue</h3>
        <ul class="webStats" >
          <li><span>Total # of User:</span> ${totalUser}</li>
          <li><span>Total # of Artist:</span> ${totalart}</li>
          <li><span>Total # of Albums</span> ${totalal}</li>
          <li><span>Total # of Songs</span> ${totalsong}</li>
        </ul>
      </div>
    

   
    </div>
    
  <hr width="100%" align="left" style="border-top: 1px solid #333">
  </div>
  <div class="matchStats">
    <div class="backgroundText">GENRE</div>
    <canvas id="gameStats" width="180" height="180"/>
  </div>

  <div class="matchStats">
    <div class="backgroundText">Roles</div>
    <canvas id="roleStats" width="180" height="180"/>
  </div>

  <div class="clearFix"></div>





  <div class="col" style="width: 100%; height: 100px; margin-top: -10%">
    <h2>Monthly Profit</h2>
     <ul class="profitStats">
      <li><span>Income:</span> ${resultprofit[0]}</li>
      <li><span>Expense:</span> ${resultprofit[1]}</li>
      <li><span>Profit:</span> ${resultprofit[2]}</li>
    </ul>
    <div class="resizing">
      <canvas id="champData"/>
    </div>
    <hr width="200%" align="left" style="border-top: 1px solid #333">
topArtist
    <div>
      <h2 style="position: relative; margin-left: -5px;">Top3 Artist</h2>
     <ul class="songStats">
      <li><span>Name</span> Play Count</li>
      <li><span>${topArtist[0][0]} </span> ${topArtist[0][1]}</li>
      <li><span>${topArtist[1][0]} </span> ${topArtist[1][1]}</li>
      <li><span>${topArtist[2][0]} </span> ${topArtist[2][1]}</li>
    </ul>
    <div class="resizing">
      <canvas id="champData"/>
    </div>


    </div>

    <div class="resizing">
      <canvas id="champData"/>
    </div>

  </div>


<div class="col" style="width: 15%;">

  </div>

  <div class="col" style="width: 25%;">
    <h2>Top-5 Popular Genre</h2>
    <ul class="playerStats">
      <li><span>${gennrStat[0][0]}:</span>${gennrStat[0][1]}</li>
      <li><span>${gennrStat[1][0]}:</span>${gennrStat[1][1]}</li>
      <li><span>${gennrStat[2][0]}:</span>${gennrStat[2][1]}</li>
      <li><span>${gennrStat[3][0]}:</span>${gennrStat[3][1]}</li>
      <li><span>${gennrStat[4][0]}:</span>${gennrStat[4][1]}</li>
    </ul>
  </div>
  
  


  <div class="col middle" style="width: 25%;">
    <h2>Membership Type</h2>
    <label style="color: gray; margin-top: 30px; position: absolute;">Premium:</label>
    <label style="color: gray; margin-top: 60px; position: absolute;">General:</label>
    <input style="background: #F7464A; width: 80px; margin-top: 60px; margin-left: 90px; position: absolute;">
    <input style="background: #46BFBD; width: 80px; margin-top: 30px; margin-left: 90px; position: absolute;">
  </div>

</div>



</div>
<!-- right -->
<div class="col-lg-2" style="margin-top:10%">
	<div class="subfee" >
	<div style="padding-bottom: 20px">
	Current Subscription fee: $<span id="needToChange"></span></div>
	<div >
	<form id="changeFee" name="changeFee" action="changeFee" method="post">
		<span>
			<i class="fa fa-money" aria-hidden="true"></i>	<input style="border-radius: 20px" name="changefee">
		</span>
		<div style="text-align: center; padding-top: 20px">
				<button  type='submit' >Change</button>
		</div>
	</form>
	</div>
	</div>
</div>


</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js'></script>
<script>
$(document).ready(function(){
	  var x = ${subfee};
	  var n = x.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	  document.getElementById("needToChange").innerHTML = n;
	  $("#changeFee").submit(function (event) {
       event.preventDefault(); 
       var actionurl = event.currentTarget.action;
	   var actiontype = event.currentTarget.method;
	  jQuery.support.cors = true;
		$.ajax({
			url: actionurl,
			type: actiontype,
			dataType: 'application/json', 
			data: $(this).serialize(),
			complete: function(json) {
				var data = jQuery.parseJSON(json.responseText);
				x = data.value;
				n = x.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
				document.getElementById("needToChange").innerHTML = n;
			}
		});
	}); 
});
</script>
<script type="text/javascript">
  var roleStats = [
    {
        value: ${userStat[0][1]},
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "GERENAL"	
    },
    {
        value: ${userStat[1][1]},
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "PREMIUM"
    }
  ];

  var gameStats = [
    {
      value: ${gennrStat[0][1]},
      color:"#F7464A",
      highlight: "#FF5A5E",
      label: '${gennrStat[0][0]}'
    },
    {
      value: ${gennrStat[1][1]},
      color: "#46BFBD",
      highlight: "#5AD3D1",
      label: '${gennrStat[1][0]}'
    },
    {
      value: ${gennrStat[2][1]},
      color: "#FDB45C",
      highlight: "#FFC870",
      label: '${gennrStat[2][0]}'
    },
    {
      value: ${gennrStat[3][1]},
      color: "#4D5360",
      highlight: "#616774",
      label: '${gennrStat[3][0]}'
    },
    {
        value: ${gennrStat[4][1]},
        color: "#949FB1",
        highlight: "#A8B3C5",
        label: '${gennrStat[4][0]} '
      }
  ];
</script>
	<spring:url value="/resources/js/index.js" var="indexJs" />
	<script src="${indexJs}"></script>
</body>
</html>