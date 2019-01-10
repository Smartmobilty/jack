//Librarys
//----------------------------------------------------------------
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;

import controlP5.*;
ControlP5 cp5;


import processing.serial.*;
import cc.arduino.*;
Arduino arduino;



//Audiofiles ----------------------------------------------------------------
AudioPlayer 
  feedbacksound1, feedbacksound2, feedbacksound3, feedbacksound4, 
  confirmsound1, confirmsound2, confirmsound3, confirmsound4; 



//Variables ----------------------------------------------------------------
float volume1, volume2, volume3, volume4;
float slider1, slider2, slider3, slider4;
boolean start1, start2, start3, start4; 

float slidervalue1, slidervalue2, slidervalue3, slidervalue4; //mapping input values to 0/100

int minvalue = 3; //minimal value before signal is received (0/100)
int maxvalue = 80; //maximal value to start confirm (0/100)
int startvalue = 50; //value to get back to to start again (0/100)

int sensorU= 1;
int sensorD= 2;
int sensorL= 3;
int sensorR= 4;


void setup () {
  size(500, 500);
  noStroke();
  colorMode (100, 100, 100, 100);
  
  arduino = new Arduino(this, "/dev/cu.usbmodem14301", 57600); //sets up arduino
  arduino.pinMode(sensorU, Arduino.INPUT);//setup pins to be input
  arduino.pinMode(sensorD, Arduino.INPUT);
  arduino.pinMode(sensorL, Arduino.INPUT);
  arduino.pinMode(sensorR, Arduino.INPUT);
  

  //Load Audiofiles ----------------------------------------------------------------
  minim = new Minim(this);
  feedbacksound1 = minim.loadFile ("feedback1.wav", 320);  //feedback sound for slider1
  confirmsound1 = minim.loadFile ("confirm1.wav", 320);  //confirm sound for slider1

  feedbacksound2 = minim.loadFile ("feedback1.wav", 320);  //feedback sound for slider2
  confirmsound2 = minim.loadFile ("confirm1.wav", 320);  //confirm sound for slider2

  feedbacksound3 = minim.loadFile ("feedback3.wav", 320);  //feedback sound for slider3
  confirmsound3 = minim.loadFile ("confirm4.wav", 320);  //confirm sound for slider3

  feedbacksound4 = minim.loadFile ("feedback3.wav", 320);  //feedback sound for slider4
  confirmsound4 = minim.loadFile ("confirm2.wav", 320);  //confirm sound for slider4


  //Set starting volumes for the samples ----------------------------------------------------------------
  feedbacksound1.setGain(-25); //set volume to low to avoid glitch at start
  confirmsound1.setGain(-7); //set volume for feedback sound, this one is not affected by slidervalue

  feedbacksound2.setGain(-25); //set volume to low to avoid glitch at start
  confirmsound2.setGain(-7); //set volume for feedback sound, this one is not affected by slidervalue

  feedbacksound3.setGain(-20); //set volume to low to avoid glitch at start
  confirmsound3.setGain(0); //set volume for feedback sound, this one is not affected by slidervalue

  feedbacksound4.setGain(-20); //set volume to low to avoid glitch at start
  confirmsound4.setGain(0); //set volume for feedback sound, this one is not affected by slidervalue
}

void draw () {
  background (80);
  frameRate(5);
  slider1 = arduino.analogRead(sensorU);
  println (slider1);
  slider2 = arduino.analogRead(sensorD);
  println (slider2);
  slider3 = arduino.analogRead(sensorL);
  println (slider3);
  slider4 = arduino.analogRead(sensorR);
  println (slider4);
  println  ("\t");

fill (#D1DBBE);
  //Slider Value #1 ----------------------------------------------------------------
  slidervalue1 = map (slider1, 30, 240, 0, 100); //Mapping slider input1 to slidervalue1 
  float visual1 = map(slidervalue1, 0, 100, 0, height); //Mapping slidervalue1 to canvas height for visualisation
  rect (0, 0, (width/4), (visual1)); //input value visualisation
  
  volume1 = map(slider1, 30, 240, -20, 5); //Mapping slider input1 to volume1
  feedbacksound1.setGain(volume1); //setting volume1 as value for the sound volume
  
  feedback1(); //start feedback loop
  confirm1(); //start confirm loop
 
  
 fill (#99BE7E);
  //Slider Value #2 ----------------------------------------------------------------
  slidervalue2 = map (slider2, 30, 200, 0, 100); //Mapping slider input1 to slidervalue1 
  float visual2 = map(slidervalue2, 0, 100, 0, height); //Mapping slidervalue1 to canvas height for visualisation
  rect ((1*(width/4)), 0, (width/4), (visual2)); //input value visualisation
  

  volume2 = map(slider2, 30, 200, -20, 5); //Mapping slider input1 to volume1
  feedbacksound2.setGain(volume2); //setting volume1 as value for the sound volume

  feedback2(); //start feedback loop
  confirm2(); //start confirm loop
  
   fill (#4F8C6C);
  
  //Slider Value #3 ----------------------------------------------------------------
  slidervalue3 = map (slider3, 40, 135, 0, 100); //Mapping slider input1 to slidervalue1 
  float visual3 = map(slidervalue3, 0, 100, 0, height); //Mapping slidervalue1 to canvas height for visualisation
  rect ((2*(width/4)), 0, (width/4), (visual3)); //input value visualisation
 
  volume3 = map(slider3, 40, 135, -25, -5); //Mapping slider input1 to volume1
  feedbacksound3.setGain(volume3); //setting volume1 as value for the sound volume

  feedback3(); //start feedback loop
  confirm3(); //start confirm loop
  
  
    fill (#6F808C);
  //Slider Value #4 ----------------------------------------------------------------
  slidervalue4 = map (slider4, 50, 190 , 0, 100); //Mapping slider input1 to slidervalue1 
  float visual4 = map(slidervalue4, 0, 100, 0, height); //Mapping slidervalue1 to canvas height for visualisation
  rect ((3*(width/4)), 0, (width/4), (visual4)); //input value visualisation

  volume4 = map(slider4, 50, 190, -25, -5); //Mapping slider input1 to volume1
  feedbacksound4.setGain(volume4); //setting volume1 as value for the sound volume

  feedback4(); //start feedback loop
  confirm4(); //start confirm loop
}
