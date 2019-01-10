void confirm2 () {
  //is the slidervalue is higher then the maxvalue & the confirmsound is not allready playing the confirmsound is played
  //after being played the slidervalue needs to be below the maxvalue to rewind
  if (slidervalue2 > maxvalue && (confirmsound2.isPlaying()==false) && feedbacksound2.isPlaying() ==true) {
    feedbacksound2.pause();
    confirmsound2.play();
    start2 = false;
  }
  if (slidervalue2<maxvalue) {
    confirmsound2.pause();
    confirmsound2.rewind();
  }

}


void feedback2 () {
  //define startvalue to go back to after confirmation before getting a signal again
  //if the slidervalue is larger then the startvalue and the feedback sound is not playing
  //this happens because the confirm command pauzes the feedback sound while the slidervalue is high
  if (slidervalue2 > startvalue && (feedbacksound2.isPlaying() == false)) { 
    start2 = false;
  } else {
    start2 = true;
  }

  //rewind sample if it is done playing
  if (feedbacksound2.position() == feedbacksound2.length()) {
    feedbacksound2.rewind();
    start2 = true;
    feedbacksound2.play();
  } 

  //define the value between which the sound is playing
  if (slidervalue2 > minvalue && start2 == true) {
    feedbacksound2.play();
  } else {
    feedbacksound2.pause();
  }
}
