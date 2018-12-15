

// Cache references to DOM elements.
var elms = ['playHistorylist', 'sliderBtnUnmute', 'sliderBtnMute','track', 'timer', 'duration', 'playBtn', 'pauseBtn', 'prevBtn', 'nextBtn', 'playlistBtn', 'volumeBtn', 'progress', 'bar', 'wave', 'loading', 'playlist', 'list', 'volume', 'barEmpty', 'barFull', 'sliderBtn'];
elms.forEach(function(elm) {
  window[elm] = document.getElementById(elm);
});

/**
 * Player class containing the state of our playlist and where we are in it.
 * Includes all methods for playing, skipping, updating the display, etc.
 * @param {Array} playlist Array of objects with playlist song details ({title, file, howl}).
 */

var Player = function(playlist) {
  this.playlist = playlist;
  this.index = 0;
  this.v = 1;
  this.vFlag = 0;
  this.first = 0;
  this.mode = "normal";
  this.refleshQueue = function(){
	  while (list.firstChild) {
		  list.removeChild(list.firstChild);
	    }  
  // Display the title of the first track.
  track.innerHTML = this.index+1+'. ' + playlist[0].title;
  var count = 0;
  // Setup the playlist display.
  this.playlist.forEach(function(song) {
    var div = document.createElement('div');
    div.className = 'list-song';
    
    count += 1;
    div.innerHTML = count + '.' + song.title;

    var re = count - 1;

/*
    var bt = document.createElement('button');
    bt.className = 'songElements';
    bt.onclick = function(){
      // alert("a");
    }
   */
/*    bt.innerHTML = count +'. '+song.title;
    div.appendChild(bt);*/




    div.onclick = function() {
      player.skipTo(re);
    };
    list.appendChild(div);
  });
  };
  this.refleshQueue();
};
Player.prototype = {
  /**
   * Play a song in the playlist.
   * @param  {Number} index Index of the song in the playlist (leave empty to play the first or current).
   */
  play: function(index) {
    var self = this;
    var sound;
    
    
    
    
    index = typeof index === 'number' ? index : self.index;
    var data = self.playlist[index];

    // If we already loaded this track, use the current one.
    // Otherwise, setup and load a new Howl.
    if (data.howl) {
      sound = data.howl;
    } else {
      sound = data.howl = new Howl({
        // src: ['./audio/' + data.file + '.webm', './audio/' + data.file + '.mp3'],
        src: [data.file],
        html5: true, // Force to HTML5 so that the audio can stream in (best for large files).
        onplay: function() {
          // Display the duration.
          duration.innerHTML = self.formatTime(Math.round(sound.duration()));

          // Start upating the progress of the track.
          requestAnimationFrame(self.step.bind(self));

          // Start the wave animation if we have already loaded
          wave.container.style.display = 'block';
          bar.style.display = 'none';
          pauseBtn.style.display = 'block';
        },
        onload: function() {
          // Start the wave animation.
          wave.container.style.display = 'block';
          bar.style.display = 'none';
          loading.style.display = 'none';
        },
        onend: function() {
          // Stop the wave animation.
          wave.container.style.display = 'none';
          bar.style.display = 'none';
          self.skip('right');
        },
        onpause: function() {
          // Stop the wave animation.
          wave.container.style.display = 'none';
          bar.style.display = 'none';
        },
        onstop: function() {
          // Stop the wave animation.
          wave.container.style.display = 'none';
          bar.style.display = 'none';
        }
      });
    }
    if(player.first==0){
    		$.ajax({
		      type:"post",
		      url: "updateHistory",
		      dataType: 'application/json',
		      data: {songId: self.playlist[self.index].id},
		    }); 
    		var hdiv = document.createElement("div");
  		hdiv.className = "track";
  		today = new Date();
	  	dd = today.getDate();
	  	mm = today.getMonth()+1; 
	  	yyyy = today.getFullYear();
	  	hr = today.getHours();
	  	minute = today.getMinutes();
	  	sec = today.getSeconds();
	  	misec = today.getMilliseconds();
	  	now =  yyyy+"-"+mm+"-"+dd+" "+hr+":"+minute+":"+sec+".0";
  		var hinner = "<div class='track__number'></div><div class='track__added'></div><div class='track__title'>"+self.playlist[self.index].title+"</div><div class='track__artist'>kong</div><div class='track__album'><form name='loadAL' action='viewAlbum' method='get'><input type='hidden' name='id' value=1><a onclick='viewAL()'>zanshikong</a></form></div><div class='track__time' style='width: 20%'>"+now+"</div><br>";			
  		hdiv.innerHTML = hinner;
  		playHistorylist.appendChild(hdiv);
    }
    player.first = 1;
    // Begin playing the sound.
    sound.play();

    // Update the track display.
    track.innerHTML = (index + 1) + '. ' + data.title;

    // Show the pause button.
    if (sound.state() === 'loaded') {
      playBtn.style.display = 'none';
      pauseBtn.style.display = 'block';
    } else {
      loading.style.display = 'block';
      playBtn.style.display = 'none';
      pauseBtn.style.display = 'none';
    }

    // Keep track of the index we are currently playing.
    self.index = index;
  },

  /**
   * Pause the currently playing track.
   */
  pause: function() {
    var self = this;

    // Get the Howl we want to manipulate.
    var sound = self.playlist[self.index].howl;

    // Puase the sound.
    sound.pause();

    // Show the play button.
    playBtn.style.display = 'block';
    pauseBtn.style.display = 'none';
  },

  /**
   * Skip to the next or previous track.
   * @param  {String} direction 'next' or 'prev'.
   */
  skip: function(direction) {
    var self = this;
    var index = 0;

    if(self.mode=="random"){
      // random
      index = Math.round(Math.random()*100000) % self.playlist.length;
    }else if(self.mode=="loopall"){
      // loop all
      if (direction === 'prev') {
        index = self.index - 1;
        if (index < 0) {
          index = self.playlist.length - 1;
        }
      } else {
        index = self.index + 1;
        if (index >= self.playlist.length) {
          index = 0;
        }
      }
    }else if(self.mode=="loopone"){
      // loop one
      index = self.index;
    }else{
      if (direction === 'prev') {
        index = self.index - 1;
        if (index < 0) {
          index = 0;
        }
      } else {
        index = self.index + 1;
        if (index >= self.playlist.length) {
          index = -1;
          playBtn.style.display = 'block';
          pauseBtn.style.display = 'none';
        }
      }
    }
    
    
    

    self.skipTo(index);
  },

  /**
   * Skip to a specific track based on its playlist index.
   * @param  {Number} index Index in the playlist.
   */
  skipTo: function(index) {
    var self = this;
    if(index!=-1){
    		  $.ajax({
    		      type:"post",
    		      url: "updateHistory",
    		      dataType: 'application/json',
    		      data: {songId: self.playlist[self.index].id},
    		    });
    		  var hdiv = document.createElement("div");
    		  hdiv.className = "track";
    		  	today = new Date();
    		  	dd = today.getDate();
    		  	mm = today.getMonth()+1; 
    		  	yyyy = today.getFullYear();
    		  	hr = today.getHours();
    		  	minute = today.getMinutes();
    		  	sec = today.getSeconds();
    		  	misec = today.getMilliseconds();
    		  	now =  yyyy+"-"+mm+"-"+dd+" "+hr+":"+minute+":"+sec+".0";
    		  var hinner = "<div class='track__number'>"+ (index+1) +"</div><div class='track__added'></div><div class='track__title'>"+self.playlist[index].title+"</div><div class='track__artist'>kong</div><div class='track__album'><form name='loadAL' action='viewAlbum' method='get'><input type='hidden' name='id' value=1><a onclick='viewAL()'>zanshikong</a></form></div><div class='track__time' style='width: 20%'>"+ now+"</div><br>";			
    		  hdiv.innerHTML = hinner;
    		  playHistorylist.appendChild(hdiv);
    }
    
    // Stop the current track.
    if (self.playlist[self.index].howl) {
      self.playlist[self.index].howl.stop();
    }

    // Reset progress.
    progress.style.width = '0%';

    // Play the new track.
    self.play(index);
  },

  /**
   * Set the volume and update the volume slider display.
   * @param  {Number} val Volume between 0 and 1.
   */
  volume: function(val) {
    var self = this;

    // Update the global volume (affecting all Howls).
    Howler.volume(val);

    // Update the display on the slider.
    var barWidth = (val * 90) / 100;
    barFull.style.width = (barWidth * 100) + '%';
    sliderBtn.style.left = (window.innerWidth * barWidth + window.innerWidth * 0.05 - 25) + 'px';
  },

  /**
   * Seek to a new position in the currently playing track.
   * @param  {Number} per Percentage through the song to skip.
   */
  seek: function(per) {
    var self = this;

    // Get the Howl we want to manipulate.
    var sound = self.playlist[self.index].howl;

    // Convert the percent into a seek position.
    if (sound.playing()) {
      sound.seek(sound.duration() * per);
    }
  },

  /**
   * The step called within requestAnimationFrame to update the playback position.
   */
  step: function() {
    var self = this;

    // Get the Howl we want to manipulate.
    var sound = self.playlist[self.index].howl;

    // Determine our current seek position.
    var seek = sound.seek() || 0;
    timer.innerHTML = self.formatTime(Math.round(seek));
    progress.style.width = (((seek / sound.duration()) * 100) || 0) + '%';

    // If the sound is still playing, continue stepping.
    if (sound.playing()) {
      requestAnimationFrame(self.step.bind(self));
    }
  },

  /**
   * Toggle the playlist display on/off.
   */
  togglePlaylist: function() {
     var self = this;
     var display = (playlist.style.display === 'block') ? 'none' : 'block';

     setTimeout(function() {
       playlist.style.display = display;
     }, (display === 'block') ? 0 : 50);
     playlist.className = (display === 'block') ? 'fadein' : 'fadeout';
  },

  /**
   * Toggle the volume display on/off.
   */
  toggleVolume: function() {
    var self = this;
    var display = (volume.style.display === 'block') ? 'none' : 'block';

    setTimeout(function() {
      volume.style.display = display;
    }, (display === 'block') ? 0 : 50);
    volume.className = (display === 'block') ? 'fadein' : 'fadeout';
  },

  /**
   * Format the time from seconds to M:SS.
   * @param  {Number} secs Seconds to format.
   * @return {String}      Formatted time.
   */
  formatTime: function(secs) {
    var minutes = Math.floor(secs / 60) || 0;
    var seconds = (secs - minutes * 60) || 0;

    return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
  }
};

// Setup our new audio player class and pass it the playlist.


// Bind our player controls.
playBtn.addEventListener('click', function() {
  player.play();
});
pauseBtn.addEventListener('click', function() {
  player.pause();
});
prevBtn.addEventListener('click', function() {
  player.skip('prev');
});
nextBtn.addEventListener('click', function() {
  player.skip('next');
});
waveform.addEventListener('click', function(event) {
  player.seek(event.clientX / window.innerWidth);
});
playlistBtn.addEventListener('click', function() {
  player.togglePlaylist();
});
/*playlist.addEventListener('click', function() {
  player.togglePlaylist();
});*/
volumeBtn.addEventListener('dblclick', function() {
  player.toggleVolume();
});
volumeBtn.addEventListener('click', function() {
	if(player.vFlag==0){
		player.volume(0);
		player.vFlag = 1;
		sliderBtnUnmute.style.display = "none";
		sliderBtnMute.style.display = "block";
	}else{
		player.volume(player.v);
		player.vFlag = 0;
		sliderBtnUnmute.style.display = "block";
		sliderBtnMute.style.display = "none";
	}
	});
volume.addEventListener('click', function() {
  player.toggleVolume();
});

// Setup the event listeners to enable dragging of volume slider.
barEmpty.addEventListener('click', function(event) {
  var per = event.layerX / parseFloat(barEmpty.scrollWidth);
  player.v=per;
  player.volume(per);
});
sliderBtn.addEventListener('mousedown', function() {
  window.sliderDown = true;
});
sliderBtn.addEventListener('touchstart', function() {
  window.sliderDown = true;
});
volume.addEventListener('mouseup', function() {
  window.sliderDown = false;
});
volume.addEventListener('touchend', function() {
  window.sliderDown = false;
});

var move = function(event) {
  if (window.sliderDown) {
    var x = event.clientX || event.touches[0].clientX;
    var startX = window.innerWidth * 0.05;
    var layerX = x - startX;
    var per = Math.min(1, Math.max(0, layerX / parseFloat(barEmpty.scrollWidth)));
    player.v=per;
    player.volume(per);
  }
};

volume.addEventListener('mousemove', move);
volume.addEventListener('touchmove', move);

// Setup the "waveform" animation.
var wave = new SiriWave({
    container: waveform,
    width: window.innerWidth,
    height: window.innerHeight * 0.3,
    cover: true,
    speed: 0.03,
    amplitude: 0.7,
    frequency: 2
});
// wave.start();

// Update the height of the wave animation.
// These are basically some hacks to get SiriWave.js to do what we want.
var resize = function() {
  var height = window.innerHeight * 0.3;
  var width = window.innerWidth;
  wave.height = height;
  wave.height_2 = height / 2;
  wave.MAX = wave.height_2 - 4;
  wave.width = width;
  wave.width_2 = width / 2;
  wave.width_4 = width / 4;
  wave.canvas.height = height;
  wave.canvas.width = width;
  wave.container.style.margin = -(height / 2) + 'px auto';

  // Update the position of the slider.
  var sound = player.playlist[player.index].howl;
  if (sound) {
    var vol = sound.volume();
    var barWidth = (vol * 0.9);
    sliderBtn.style.left = (window.innerWidth * barWidth + window.innerWidth * 0.05 - 25) + 'px';
  }
};
window.addEventListener('resize', resize);
resize();
