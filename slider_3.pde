void confirm3 () {
  //is the slidervalue is higher then the maxvalue & the confirmsound is not allready playing the confirmsound is played
  //after being played the slidervalue needs to be below the maxvalue to rewind
  if (slidervalue3 > maxvalue && (confirmsound3.isPlaying()==false) && feedbacksound3.isPlaying() ==true) {
    feedbacksound3.pause();
    confirmsound3.play();
    start3 = false;
  }
  if (slidervalue3<maxvalue) {
    confirmsound3.pause();
    confirmsound3.rewind();
  }

}


void feedback3() {
  //define startvalue to go back to after confirmation before getting a signal again
  //if the slidervalue is larger then the startvalue and the feedback sound is not playing
  //this happens because the confirm command pauzes the feedback sound while the slidervalue is high
  if (slidervalue3 > startvalue && (feedbacksound3.isPlaying() == false)) { 
    start3 = false;
  } else {
    start3 = true;
  }

  //rewind sample if it is done playing
  if (feedbacksound3.position() == feedbacksound3.length()) {
    feedbacksound3.rewind();
    start3 = true;
    feedbacksound3.play();
  } 

  //define the value between which the sound is playing
  if (slidervalue3 > minvalue &&  start3 == true) {
    feedbacksound3.play();
  } else {
    feedbacksound3.pause();
  }
}
