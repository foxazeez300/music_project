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
  String pathway = "Music/";
  String Pentatonix = "Pentatonix - Carol of the Bells.mp3";
  String extension = ".mp3";
  String path = sketchPath( pathway + Pentatonix ); //Absolute Path
  song1 = minim.loadFile(pathway + Pentatonix);
  println(path);
  song1 = minim.loadFile( path );
  //song1.loop(0);
} //Endsetup
//
void draw() {
  //Note: logical operators could be nested IFs
  if (song1.isLooping() && song1.loopCount()!=-1) println("there are", song1.loopCount(), "loops left.");
  if (song1.isLooping() && song1.loopCount()==-1) println("Looping Infinitely");
} //End draw 
//
void keyPressed() {
  if (key=='P' || key=='p') song1.play();
  //Note "9" is assumed to be massive! "simulate Infinite"
  println(key);
  if (key=='1' || key=='9'){ //Loop Button
  String keystr = String.valueOf(key);
  println(keystr);
  int loopNum = int(keystr);
  song1.loop(loopNum); //Parameter is number of repeats
  }
  if (key=='l' || key=='L') song.loop(); //Infinite loop, no pro
} //EndPressed
//
void mousePressed() {

} //End mousePressed
// 
//End MAIN Program
