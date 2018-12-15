<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.player{
  width: 600px;
  border: 2px solid #black;

}
.headerPlayer{
  height: 65px;
  background-color: #282828;
  position: relative;
}
.headerPlayerSecond{
  height: auto;
  background-color: #FDAFAA;
  position: relative;
  text-align: left;
  padding: 8px;
}
.headerPlayerSecond h6{
  color:#FF5447;
  margin: 0;
  font-size: 16px;
}
.btonplay{
  border-radius: 100%;
  background-color: #FFFFFF;
  width: 50px;
  height: 50px;
  float: left;
  margin-top: 6px;
  margin-left: 6px;
  cursor: pointer;
}

.btonplay .fa{
      position: relative;
    top: 9px;
    left: 15px;
}

.fa-play{
  color: #FF5447;
}

.headerPlayerLegend{
  float: left;
  margin-left: 12px;
  text-transform: uppercase;
}

.headerPlayerLegend h4{
  margin: 0px;
  margin-top: 13px;
  color:#FFFFFF;
}

.headerPlayerLegend h6{
  margin: 0px;
  color:#FFFFFF;
  opacity: 0.5;
}

.soundcloudLink{
  color:#FFFFFF;
  position: absolute;
  right: 12px;
  top: 8px;
  font-size: 25px;
}

.playerTrack{
  height: 400px;
  width: 100%;
  position: relative;
  padding: 10px;
}

.playerTrack li{
  list-style: none;
  
}
.playerTrack li{
  list-style: none;
  color: #aaaaaa;
  width: 95%;
  border-bottom: 1px solid black;
  padding: 10px 0;
  
}

.playerTrack li .fa-play{
  list-style: none;
  color: #646464;
  margin-right: 15px;
  
}
</style>


</head>
<body>
<div class="player">
  <div class="headerPlayer">
    <div class="btonplay">
      <i class="fa fa-play fa-2x"></i>
    </div>
    <div class="headerPlayerLegend">
      <h4>Play Queue</h4>
      <a class="soundcloudLink" href="#"><i class="fa fa-soundcloud"></i></a>
    </div>
    
  </div>
  <div class="playerTrack">
	  <div id="playlist">
     <div id="list"></div> 
  </div>
  </div>

</div>
</body>
</html>