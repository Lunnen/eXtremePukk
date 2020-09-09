void menu(){

  if(!singleOn && !menuOn && !aboutOn && !hostOn && !joinOn){

    LaddaPartikel();
    introText();
    
    if(!LoadOnceSound1){
    song[0].play();
    LoadOnceSound1=true;
    }

    if(frameCount>300 || keyCode==ENTER){ //show intro until 300 frames has gone or enter is pushed.
      menuOn=true;
    }
  }
  else if(menuOn && !singleOn && !aboutOn && !hostOn && !joinOn){
    menuChoice(); //a menu were you can choose single, host, join..
  }
  else if(singleOn || hostOn || joinOn){
    GameGo(); //start gamecode
    
    if(!LoadOnceSound2){
    song[0].pause();
    song[1].loop();
    LoadOnceSound2=true;
    }
    
  }
  else if(aboutOn){
    background(aboutIMG);
  }
}
void menuChoice(){

  background(c); //load board and audience.

  if(mousePressed && mouseX>255 && mouseX<505 && mouseY>215 && mouseY<260){ //when singleplayer pushed.
    menuOn=false; 
    aboutOn=false; 
    joinOn=false; 
    hostOn=false;
    singleOn=true; 
  }
  else if(mousePressed && mouseX>255 && mouseX<505 && mouseY>265 && mouseY<310){ //when host game pushed.
    menuOn=false; 
    singleOn=false; 
    aboutOn=false; 
    joinOn=false;
    hostOn=true; 
  }
  else if(mousePressed && mouseX>255 && mouseX<505 && mouseY>315 && mouseY<365){ //when join game pushed. 
    menuOn=false; 
    singleOn=false; 
    hostOn=false; 
    aboutOn=false; 
    joinOn=true; 
  }  
  else if(mousePressed && mouseX>255 && mouseX<505 && mouseY>375 && mouseY<415){ //when about pushed. 
    menuOn=false; 
    singleOn=false; 
    joinOn=false; 
    hostOn=false;
    aboutOn=true; 
  }
  else if(mousePressed && mouseX>255 && mouseX<505 && mouseY>420 && mouseY<455){ //when exit is pushed.
    exit(); //Exits the application.
  }
}
void GameGo(){
  frameRate(55); //frames per second
  background(b); //draws board and audiance.
  gameScore();

  for(int i=0;i<kontroll.length;i++){ //Draws all Pads and makes them move.
    kontroll[i].movePad();
    kontroll[i].drawPad();
  }
  moveBall();
  drawBall();
  checkForPad(); 
}


