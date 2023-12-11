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
  size (600, 700);
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
  textFont(createFont("Arial", 12));
} //Endsetup
//
void draw() {
  // Note: looping funtions
  //Note: logical operators could be nested IFs
  if (song1.isLooping() && song1.loopCount()!=-1) println ("there are", song1.loopCount(), "loops left.");
  if (song1.isLooping() && song1.loopCount()==-1) println ("Looping Infinitely");
  if (song1.isPlaying() && !song1.isLooping() ) println ("Play Once");
  //
  //debugging fast forward and fast rewind
  println("song position", song1.position(), "song Length", song1.length() );
  //
} //End draw
//
void keyPressed() {
  if (key==' ' ) song1.play();
  //Note "9" is assumed to be massive! "simulate Infinite"
  println(key);
  if (key>='1' || key<='9') { //Loop Button
    String keystr = String.valueOf(key);
    //println(keystr);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song1.loop(loopNum); //Parameter is number of repeats
  }
  if (key=='L' || key=='l') song1.loop(); //Infinite loop, no pro
  if (key=='M' || key=='m') { //Mute Button
    //Mute Behaviour: stops electricy to speakers, does not stop file
    //Note: mute has no built-in pause button, no built-in rewind button
    //error: is song near end of file, user will not knowsong is at the end
    //known eeror: once song plays, MUTE acts like it doesn't work
    if ( song1.isMuted()) {
      //ERROR: song might not be playing
      //Catch: ask .isPlaying() or !.isPlaying()
      song1.unmute();
    } else {
      //posible error: might rewind the song
      song1.mute();
    }
  }//End Mute
  //
  //possible ERROR: ff rewinds to 1000 milliseconds from song start
  //possible error: ff rewinds to parameter milliseconds from song start
  //how does this get to be a true ff and fr button
  //actual .skip() allows for variable ff & fr
  if ( key=='F' || key=='f' ) song1.skip( 0 ); //SKIP forward 1 second (1000 milliseconds)
  if ( key=='R' || key=='r' ) song1.skip( 1000 ); //SKIP  backawrds 1 second, notice negative, (-1000 milliseconds)
  //
  //Simple STOP behaviour: ask if .playing() & .pause() & .rewind(), or rewind()
  if (key=='S' | key=='s') {
    if ( song1.isPlaying() ) {
      song1.pause(); //auto .rewind()
    } else {
      song1.rewind();//ERROR, doesn't play
    }
  }
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
