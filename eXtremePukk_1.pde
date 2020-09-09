/*---------------------------------------------------------------------
         -[  Made by Group 1:  ]-
-----------------------------------------------------------------------
          -> Andreas Lönnholm
          -> Tommi Toivanen
          -> Andreas Hansson
          -> Karl Wallenius
 
         --->> Hässleholm <<---
 -> Datasystemmanagement HT08 (2008-11-14 to 2009-01-16)
-----------------------------------------------------------------------
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program (see gpl-30.txt in the program folder).  
If not, see <http://www.gnu.org/licenses/>.
---------------------------------------------------------------------*/

//import fullscreen.*; //Load the FullScreen API
//FullScreen fs; //names fullscreenCommand "fs"
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

import ddf.minim.*; //Laddar biblioteket Minim för ljud.
AudioPlayer[] song = new AudioPlayer[3];

Minim minim;

PFont font, intro1, intro2; //loads fonts
PImage b, c, ball, aboutIMG; //Loads images

int[] ballStartSide = {-7,7}, ballStartY = {-3,3};  ;

int ClientJoined=0, ballSize=32, dx=0, dy=0, padX, padY=2, padSize=40, padSpeed=6, boardWidth=600, boardHeight=400, goalHeight=140, 
numOne=0, numTwo=0, x = 400, y = 300; //All integer values, at the end (ball appear at start ( x & y-coordinate))

boolean aboutOn=false, menuOn=false, singleOn = false, joinOn = false, hostOn = false, padOn=false, serverOn=false, clientOn=false, 
ballInit=false, LoadOnceSound1=false, LoadOnceSound2=false; //functions for chosen alternative in the menu.

Pad[] kontroll = new Pad[2]; //Initiate controllerArray

Particle[] p = new Particle[40], attractor = new Particle [5], staticAttractor = new Particle[5]; //arrays for introCode

String ServerIP = "127.0.0.1";
String ClientIP = "127.0.0.1";

void setup(){
  size(800,600); // set size to 800x600

  b = loadImage("board.png"); c = loadImage("menu.png"); ball = loadImage("puck.png"); aboutIMG = loadImage("about.png"); 

  font = loadFont("Stencil-36.vlw"); intro1 = loadFont("ImprintMT-Shadow-200.vlw"); intro2 = loadFont("ImprintMT-Shadow-72.vlw");
  
  //fs = new FullScreen(this); // Create the fullscreen object
  //fs.enter(); // enter fullscreen mode
  
  Partikel(); //run intro-engine
  padY = (height/2);// position pad somewhere
  
  minim = new Minim(this);
  song[0] = minim.loadFile("intro.mp3");
  song[1] = minim.loadFile("ingame.mp3");
  song[2] = minim.loadFile("goal.wav"); 
}
void draw() { //Main loop of them all :)
 
  CreatePads(); //creates the controllers/pads (has to be in draw)
  menu(); //runs the menu, which runs the game when the mode is chosen.
  
  NetCodeHost(); //Networkcode for the host
  NetCodeClient(); //Networkcode for the client
  
  InitiateBall(); //Makes the ball move on gameStart
}
void CreatePads(){
  char UpKeyHost=' ', DownKeyHost=' ', LeftKeyHost=' ', RightKeyHost=' ',  //hostkeys
       UpKeyClient=' ', DownKeyClient=' ', LeftKeyClient=' ', RightKeyClient=' '; //clientkeys
       
  if(hostOn && !singleOn && !joinOn){ //If hosting a game, deactivate client keys.
  UpKeyHost='w'; DownKeyHost='s'; LeftKeyHost='a'; RightKeyHost='d';
  }
  else if(joinOn && !singleOn && !hostOn){ //If joining a game, deactivate host keys.
  UpKeyClient='u'; DownKeyClient='j'; LeftKeyClient='h'; RightKeyClient='k';
  }
  else if(singleOn && !joinOn && !hostOn){
  UpKeyHost='w'; DownKeyHost='s'; LeftKeyHost='a'; RightKeyHost='d'; 
  UpKeyClient='u'; DownKeyClient='j'; LeftKeyClient='h'; RightKeyClient='k';
  }
  //If not, its a singleplayer game.
  if(!padOn){ //first initiation of pads. (these two codes ARE NEEEDED for the controls to work properly in multiplayergames)
  kontroll[0] = new Pad(130,padY, padSize,6, UpKeyHost, DownKeyHost, LeftKeyHost, RightKeyHost, boardWidth,0);  //Controller number1
  kontroll[1] = new Pad(665,padY, padSize,6, UpKeyClient, DownKeyClient, LeftKeyClient, RightKeyClient, boardWidth,(boardWidth/2)); //Controller number2
  padOn=true;
  }
  else if(padOn){ //The other needed code <----
  kontroll[0] = new Pad(kontroll[0].padX,kontroll[0].padY, padSize,6, UpKeyHost, DownKeyHost, LeftKeyHost, RightKeyHost, boardWidth,0);  //Controller number1
  kontroll[1] = new Pad(kontroll[1].padX,kontroll[1].padY, padSize,6, UpKeyClient, DownKeyClient, LeftKeyClient, RightKeyClient, boardWidth,(boardWidth/2)); //Controller number2
  }
}
