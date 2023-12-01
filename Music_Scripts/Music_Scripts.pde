//Library: use sketch / import

//
//Global Variables
Minim minim; //creates object to acces all functions
AudioPlayer song1; //creates "Play List" variable holding extensions WAV, AIFF, AU, SN
//
void setup() {
  //size() or fullscreen()
  //display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from
  String pathway = "../ Music/";
  String Pentatonix = "Pentatonix - Carol of the Bells.mp3";
  String extension = ".mp3";
  song1 = minim.loadFile(pathway + Pentatonix);
} //Endsetup
//
void draw() {} //End draw 
//
void keyPressed() {
  song1.loop(0);
} //EndPressed
//
void mousePressed() {

} //End mousePressed
// 
//End MAIN Program
