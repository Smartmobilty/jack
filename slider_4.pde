void confirm4 () {
  //is the slidervalue is higher then the maxvalue & the confirmsound is not allready playing the confirmsound is played
  //after being played the slidervalue needs to be below the maxvalue to rewind
  if (slidervalue4 > maxvalue && (confirmsound4.isPlaying()==false) && feedbacksound4.isPlaying() ==true) {
    feedbacksound4.pause();
    confirmsound4.play();
    start4 = false;
  }
  if (slidervalue4<maxvalue) {
    confirmsound4.pause();
    confirmsound4.rewind();
  }

}


void feedback4() {
  //define startvalue to go back to after confirmation before getting a signal again
  //if the slidervalue is larger then the startvalue and the feedback sound is not playing
  //this happens because the confirm command pauzes the feedback sound while the slidervalue is high
  if (slidervalue4 > startvalue && (feedbacksound4.isPlaying() == false)) { 
    start4 = false;
  } else {
    start4 = true;
  }

  //rewind sample if it is done playing
  if (feedbacksound4.position() == feedbacksound4.length()) {
    feedbacksound4.rewind();
    start4 = true;
    feedbacksound4.play();
  } 

  //define the value between which the sound is playing
  if (slidervalue4 > minvalue &&  start4 == true) {
    feedbacksound4.play();
  } else {
    feedbacksound4.pause();
  }
}
