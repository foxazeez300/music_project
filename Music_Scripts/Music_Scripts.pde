//Library: use sketch / import
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
Minim minim; //creates object to acces all functions
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SN
//
void setup() {
  size(600, 700);
  //display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from
  String pathway = "../ Music/";
  String Pentatonix = "Pentatonix - Carol of the Bells.mp3";
  String extension = ".mp3";
  String path = sketchPath( pathway + Pentatonix ); //Absolute Path
  song1 = minim.loadFile(pathway + Pentatonix);
  println(path);
  song1 = minim.loadFile( path );
  //song1.loop(0);
} //Endsetup
//
void draw() {} //End draw 
//
void keyPressed() {
  if (key==' ' || key==' ') song1.play();
  //song1.loop(0);
  //if () .play(); //Parameter is milli-seconds from start of audio file to start playing (illustrate with examples)
} //EndPressed
//
void mousePressed() {

} //End mousePressed
// 
//End MAIN Program
