<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="com.blue.model.User" %>
<html>
  <head>
    <title>AmplitudeJS Testing</title>

    <!-- Include Resource Stylesheets -->
<!-- 		<link rel="stylesheet" type="text/css" href="../resources/css/foundation.min.css"/> -->
	<style type="text/css">
	<%@ include file="../../resources/css/foundation.min.css" %>
	</style>

    <!-- Include font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:400,400i" rel="stylesheet">

		<!--
			Include Resource Javascript
			NOTE: These are for handling things outside of the scope of AmplitudeJS
		-->
		<!-- <script type="text/javascript" src="../resources/js/jquery.js"></script> -->
	<spring:url value="/resources/js/jquery.js" var="jqueryJs" />
	<script src="${jqueryJs}"></script>
	
		<!-- <script type="text/javascript" src="../resources/js/foundation.min.js"></script> -->
	<spring:url value="/resources/js/foundation.min.js" var="foundationJs" />
	<script src="${foundationJs}"></script>
		<!-- Include Amplitude JS -->
<!-- 		<script type="text/javascript" src="../../dist/amplitude.js"></script> -->
	<spring:url value="/resources/js/amplitude.js" var="amplitudeJs" />
	<script src="${amplitudeJs}"></script>

		<!--
			Include UX functions JS
			NOTE: These are for handling things outside of the scope of AmplitudeJS
		-->
<!-- 		<script type="text/javascript" src="js/functions.js"></script> -->
	<spring:url value="/resources/js/functions.js" var="functionsJs" />
	<script src="${functionsJs}"></script>
		<!-- Include Style Sheet -->
<!-- 		<link rel="stylesheet" type="text/css" href="css/styles.css"/> -->
		
	<style type="text/css">
	<%@ include file="../../resources/css/styles.css" %>
	</style>
  </head>
 <body>
    <div class="row">
      <div class="large-4 medium-6 small-12 large-centered medium-centered columns">
        <div id="flat-black-player-container">
            <div id="list-screen" class="slide-in-top">

              <div id="list-screen-header" class="hide-playlist">
                <img id="up-arrow" src="img/up.svg"/>
                Hide Playlist
              </div>

              <div id="list">
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="0">
                  <span class="song-number-now-playing">
                    <span class="number">1</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Risin' High (feat Raashan Ahmad)</span>
                    <span class="song-artist-album">Ancient Astronauts - We Are to Answer</span>
                  </div>

                  <span class="song-duration">
                    3:30
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="1">
                  <span class="song-number-now-playing">
                    <span class="number">2</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">The Gun</span>
                    <span class="song-artist-album">Lorn - Ask The Dust</span>
                  </div>

                  <span class="song-duration">
                    3:16
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="2">
                  <span class="song-number-now-playing">
                    <span class="number">3</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Anvil</span>
                    <span class="song-artist-album">Lorn - Anvil</span>
                  </div>

                  <span class="song-duration">
                    3:32
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="3">
                  <span class="song-number-now-playing">
                    <span class="number">4</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">I Came Running</span>
                    <span class="song-artist-album">Ancient Astronauts - We Are to Answer</span>
                  </div>

                  <span class="song-duration">
                    3:30
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="4">
                  <span class="song-number-now-playing">
                    <span class="number">5</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">First Snow</span>
                    <span class="song-artist-album">Emancipator - Soon It Will Be Cold Enough</span>
                  </div>

                  <span class="song-duration">
                    5:12
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="5">
                  <span class="song-number-now-playing">
                    <span class="number">6</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Terrain</span>
                    <span class="song-artist-album">pgs.lost - Key</span>
                  </div>

                  <span class="song-duration">
                    5:29
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="6">
                  <span class="song-number-now-playing">
                    <span class="number">7</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Vorel</span>
                    <span class="song-artist-album">Russian Circles - Guidance</span>
                  </div>

                  <span class="song-duration">
                    5:29
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="7">
                  <span class="song-number-now-playing">
                    <span class="number">8</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Intro / Sweet Glory</span>
                    <span class="song-artist-album">Jimkata - Die Digital</span>
                  </div>

                  <span class="song-duration">
                    2:39
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="8">
                  <span class="song-number-now-playing">
                    <span class="number">9</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Offcut #6</span>
                    <span class="song-artist-album">Little People - We Are But Hunks of Wood Remixes</span>
                  </div>

                  <span class="song-duration">
                    1:00
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="9">
                  <span class="song-number-now-playing">
                    <span class="number">10</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Dusk To Dawn</span>
                    <span class="song-artist-album">Emancipator - Dusk To Dawn</span>
                  </div>

                  <span class="song-duration">
                    5:25
                  <span>
                </div>
                <div class="song amplitude-song-container amplitude-play-pause" amplitude-song-index="10">
                  <span class="song-number-now-playing">
                    <span class="number">11</span>
                    <img class="now-playing" src="img/now-playing.svg"/>
                  </span>

                  <div class="song-meta-container">
                    <span class="song-name">Anthem</span>
                    <span class="song-artist-album">Emancipator - Soon It Will Be Cold Enough</span>
                  </div>

                  <span class="song-duration">
                    5:40
                  <span>
                </div>
              </div>

              <div id="list-screen-footer">
                <div id="list-screen-meta-container">
                  <span amplitude-song-info="name" amplitude-main-song-info="true" class="song-name"></span>

                  <div class="song-artist-album">
                    <span amplitude-song-info="artist" amplitude-main-song-info="true"></span>
                  </div>
                </div>
                <div class="list-controls">
                  <div class="list-previous amplitude-prev"></div>
                  <div class="list-play-pause amplitude-play-pause" amplitude-main-play-pause="true"></div>
                  <div class="list-next amplitude-next"></div>
                </div>
              </div>
            </div>
            <div id="player-screen">
              <div class="player-header down-header">
                <img id="down" src="img/down.svg"/>
                Show Playlist
              </div>
              <div id="player-top">
                <img amplitude-song-info="cover_art_url" amplitude-main-song-info="true"/>
              </div>
              <div id="player-progress-bar-container">
                <progress id="song-played-progress" class="amplitude-song-played-progress" amplitude-main-song-played-progress="true"></progress>
                <progress id="song-buffered-progress" class="amplitude-buffered-progress" value="0"></progress>
              </div>
              <div id="player-middle">
                <div id="time-container">
                  <span class="amplitude-current-time time-container" amplitude-main-current-time="true"></span>
                  <span class="amplitude-duration-time time-container" amplitude-main-duration-time="true"></span>
                </div>
                <div id="meta-container">
                  <span amplitude-song-info="name" amplitude-main-song-info="true" class="song-name"></span>

                  <div class="song-artist-album">
                    <span amplitude-song-info="artist" amplitude-main-song-info="true"></span>
                  </div>
                </div>
              </div>
              <div id="player-bottom">
                <div id="control-container">

                  <div id="shuffle-container">
                    <div class="amplitude-shuffle amplitude-shuffle-off" id="shuffle"></div>
                  </div>

                  <div id="prev-container">
                    <div class="amplitude-prev" id="previous"></div>
                  </div>

                  <div id="play-pause-container">
                    <div class="amplitude-play-pause" amplitude-main-play-pause="true" id="play-pause"></div>
                  </div>

                  <div id="next-container">
                    <div class="amplitude-next" id="next"></div>
                  </div>

                  <div id="repeat-container">
                    <div class="amplitude-repeat" id="repeat"></div>
                  </div>

                </div>

                <div id="volume-container">
                  <img src="img/volume.svg"/><input type="range" class="amplitude-volume-slider" step=".1"/>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script type="text/javascript">
		Amplitude.init({
      "bindings": {
        37: 'prev',
        39: 'next',
        32: 'play_pause'
      },
			"songs": [
				{
					"name": "Risin' High (feat Raashan Ahmad)",
					"artist": "Ancient Astronauts",
					"album": "We Are to Answer",
					"url": "https://freemusicarchive.org/file/music/WFMU/AWOL/AWOL_-_A_Way_Of_Life/AWOL_-_03_-_Food.mp3",
					"cover_art_url": "../album-art/we-are-to-answer.jpg"
				}
			]
		});
	</script>
</html>