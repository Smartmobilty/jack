void confirm1 () {
  //is the slidervalue is higher then the maxvalue & the confirmsound is not allready playing the confirmsound is played
  //after being played the slidervalue needs to be below the maxvalue to rewind
  if (slidervalue1 > maxvalue && (confirmsound1.isPlaying()==false) && feedbacksound1.isPlaying() ==true) {
    feedbacksound1.pause();
    confirmsound1.play();
    start1 = false;
  }
  if (slidervalue1<maxvalue) {
    confirmsound1.pause();
    confirmsound1.rewind();
  }

}


void feedback1 () {
  //define startvalue to go back to after confirmation before getting a signal again
  //if the slidervalue is larger then the startvalue and the feedback sound is not playing
  //this happens because the confirm command pauzes the feedback sound while the slidervalue is high
  if (slidervalue1 > startvalue && (feedbacksound1.isPlaying() == false)) { 
    start1 = false;
  } else {
    start1 = true;
  }

  //rewind sample if it is done playing
  if (feedbacksound1.position() == feedbacksound1.length()) {
    feedbacksound1.rewind();
    start1 = true;
    feedbacksound1.play();
  } 

  //define the value between which the sound is playing
  if (slidervalue1 > minvalue && start1 == true) {
    feedbacksound1.play();
  } else {
    feedbacksound1.pause();
  }
}
