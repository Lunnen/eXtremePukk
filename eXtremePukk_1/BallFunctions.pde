void moveBall() { //moves the puck/ball.
  x = x + dx;  
  if(x+(ballSize/2) > ((width/2)+(boardWidth/2)) && !(y-(ballSize/2) > (height/2)-(goalHeight/2) && y+(ballSize/2) < (height/2)+(goalHeight/2))  
    || x-(ballSize/2) < ((width/2)-(boardWidth/2)) && !(y-(ballSize/2) > (height/2)-(goalHeight/2) && y+(ballSize/2) < (height/2)+(goalHeight/2))){ 
    //if ball out of boardArea, change direction.
    dx = dx * -1;
  }
  y = y + dy;
  if (y+(ballSize/2) > (height/2)+(boardHeight/2) || y-(ballSize/2) < (height/2)-(boardHeight/2)) {
    dy = dy * -1;  
  } 
 //Here´s the goalCode ;)
  if((x-ballSize/2-1) > (width/2)+(boardWidth/2) &&  //Goal 2
          y > (height/2)-(goalHeight/2)-100 && y < (height/2)+(goalHeight/2)+100){
    numOne++;
    afterGoal();
  }
  if((x+ballSize/2+1) < (width/2)-(boardWidth/2) &&  //Goal 1
          y > (height/2)-(goalHeight/2)-100 && y < (height/2)+(goalHeight/2)+100){   
    numTwo++;
    afterGoal();
  }
}
void drawBall() { //Draws the puck/ball.
  imageMode(CENTER);
  image(ball, x, y);
}
void afterGoal(){
    dx=0; dy=0;
    song[1].pause();
    song[2].play(); //goalsound 
    delay(4000); //delays 4 seconds.
    song[2].rewind();
    song[1].loop();
    x=(width/2); y=(height/2);
    dx=ballStartSide[(int)random(ballStartSide.length)]; //random ball left/right
    dy=ballStartY[(int)random(ballStartY.length)];  //random ball up/down
}
void checkForPad() { //Checks if the puck/ball touches the controllers
  for(int i=0;i<kontroll.length;i++){
    if (distans(kontroll[i].padX, kontroll[i].padY, x, y) <= ((ballSize/2)+(padSize/2)) ) {
      dx=dx*-1;
      
     if((int)random(0,1)==1){ //if random is 1, change Y-direction(on ballhit)
      dy=dy*-1;
      }}}
}
void gameScore(){
  fill(250,255,0);
  textFont(font);
  text(numOne, width/2-50, 60); 
  text(numTwo, width/2+20, 60); 
}
float distans(float x1, float y1, float x2, float y2) { 
  float dx = x1 - x2;
  float dy = y1 - y2;				
  float d = sqrt(dx*dx + dy*dy);
  return d;
}
void InitiateBall(){
   if(!ballInit && singleOn && !hostOn && !joinOn || ClientJoined==1 && !ballInit){ //initiate ballsped NOW.
   dx=ballStartSide[(int)random(ballStartSide.length)];
   dy=ballStartY[(int)random(ballStartY.length)];
   ballInit=true;
  }
}
