import java.io.*;
//Library: use sketch / import
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
File file; 
Minim minim; //creates object to access all functions
int numberOfSongs = 3; //Number of Files in Folder, OS to count
int numberOfSoundEffects = 1; //Number of Files in Folder, OS to count
AudioPlayer[] song = new AudioPlayer[ numberOfSongs ]; //creates "Play List" variable holding extensions WAV, AIFF, AU, SND, and MP3
AudioPlayer[] soundEffect = new AudioPlayer[ numberOfSoundEffects ]; //Playlist for Sound Effects
AudioMetaData[] songMetaData = new AudioMetaData[ numberOfSongs ]; //same as above
PFont generalFont;
color purple = #2C08FF;
//
void setup() {
  size (500, 600);
  //display Algorithm
  minim = new Minim(this); //load from data directory, loadFile should also load from
  String pathway = "Music/";
  String directory = sketchPath( pathway ); //Absolute Path
  println("Main directory to Music Folder", directory);
  file = new File(directory);
  int fileCount = file.list().length;
  println("File Count of the Music Folder", fileCount);
  File[] files = file.listFiles();//String of fill directies
  println();
  printArray(files);
  //
  song[0] = minim.loadFile( path );
  songMetaData[0] = song[0].getMetaData();
  generalFont = createFont ("ArialMT", 55); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  //song1.loop(0);
  //
  //Meta Data Println Testing
  //For Prototyping, print all information to the console first
  //Verifying Meta Data, 18 println's 
  //Repeat: println("?", songMetaData1.?() );
  println("File Name", songMetaData[0].fileName() ); //Data Correct, Verified in Console
  //Must use pure Java at OS Level to list fileName before loading Playlist
  println("Song Length (in milliseconds)", songMetaData[0].length() );
  println("Song Length (in seconds)", songMetaData[0].length()/1000 ); 
  println("Song Length (in minutes & seconds)", songMetaData[0].length()/1000/60, "minutes", ( songMetaData1.length()/1000 - ( songMetaData1.length()/1000/60)*60 ), "seconds" ); //Gets Formula
  println("Song Title", songMetaData[0].title() );
  println("Author", songMetaData[0].author() );
  println("Composer", songMetaData[0].composer() );
  println("Orchestra", songMetaData[0].orchestra() );
  println("Album", songMetaData[0].album() );
  println("Disk", songMetaData[0].disc() );
  println("Publisher", songMetaData[0].publisher() );
  println("Date Released", songMetaData[0].date() );
  println("Copyright", songMetaData[0].copyright() );
  println("Comments", songMetaData[0].comment() );
  println("Lyrics", songMetaData[0].lyrics() ); //OPTIONAL: Music App Sing Along
  println("Track", songMetaData[0].track() );
  println("Genre", songMetaData[0].genre() );
  println("Encoded", songMetaData[0].encoded() );
} //Endsetup
//
void draw() {
  // Note: looping funtions
  //Note: logical operators could be nested IFs
  if (song[0].isLooping() && song[0].loopCount()!=-1) println ("there are", song[0].loopCount(), "loops left.");
  if (song[0].isLooping() && song[0].loopCount()==-1) println ("Looping Infinitely");
  if (song[0].isPlaying() && !song[0].isLooping() ) println ("Play Once");
  //
  //debugging fast forward and fast rewind
  //println("song position", song[0].position(), "song Length", song[0].length() );
  //
  // songMetaData1.title()
  rect(width*1/4, height*0, width*1/2, height*3/10); //mistake
  fill(purple); //Ink
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  int size = 10; //Change this font size
  textFont(generalFont, size); //Change the number until it fits, largest font size
  text(songMetaData[0].title(), width*1/4, height*0, width*1/2, height*3/10);
  fill(255); //Reset to white for rest of the program
} //End draw
//
void keyPressed() {
  if (key==' ' ) song[0].play();
  //Note "9" is assumed to be massive! "simulate Infinite"
  println(key);
  if (key>='1' || key<='9') { //Loop Button
    String keystr = String.valueOf(key);
    //println(keystr);
    int loopNum = int(keystr); //Java, strongly formatted need casting
    song[0].loop(loopNum); //Parameter is number of repeats
  }
  if (key=='L' || key=='l') song[0].loop(); //Infinite loop, no pro
  //
  if (key=='M' || key=='m') { //Mute Button
    //Mute Behaviour: stops electricy to speakers, does not stop file
    //Note: mute has no built-in pause button, no built-in rewind button
    //error: is song near end of file, user will not knowsong is at the end
    //known eeror: once song plays, MUTE acts like it doesn't work
    if ( song[0].isMuted()) {
      //ERROR: song might not be playing
      //Catch: ask .isPlaying() or !.isPlaying()
      song[0].unmute();
    } else {
      //posible error: might rewind the song
      song[0].mute();
    }
  }//End Mute
  //
  //possible ERROR: ff rewinds to 1000 milliseconds from song start
  //possible error: ff rewinds to parameter milliseconds from song start
  //how does this get to be a true ff and fr button
  //actual .skip() allows for variable ff & fr
  if ( key=='F' || key=='f' ) song[0].skip( 0 ); //SKIP forward 1 second (1000 milliseconds)
  if ( key=='R' || key=='r' ) song[0].skip( 1000 ); //SKIP  backawrds 1 second, notice negative, (-1000 milliseconds)
  //
  //Simple STOP Behaviour: ask if .playing() & .pause() & .rewind(), or .rewind()
  if ( key=='S' | key=='s' ) {
    if ( song[0].isPlaying() ) {
      song[0].pause(); //auto .rewind()
    } else {
      song[0].rewind(); //Not Necessary
    }
  }
  //
  //Simple Pause Behaviour: .pause() & hold .position(), then PLAY
  if ( key=='Y' | key=='y' ) {
    if ( song[0].isPlaying()==true ) {
      song[0].pause(); //auto .rewind()
    } else {
      song[0].play(); //ERROR, doesn't play
    }
  }
} //End keyPressed
//
void mousePressed() {
} //End mousePressed
//
//End MAIN Program
