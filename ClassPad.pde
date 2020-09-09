class Pad{
  int padX, padY, padWidth, padHeight, padSpeed, boardWidth, boardQuart;
  char knapp1, knapp2, knapp3, knapp4;

  Pad(int x, int y, int psize, int speed, char butt1, char butt2, char butt3, char butt4, int boardW, int quart){
    padX=x;
    padY=y;
    padSize=psize;
    padSpeed=speed;
    knapp2=butt1;
    knapp1=butt2;
    knapp3=butt3;
    knapp4=butt4;
    boardWidth=boardW;
    boardQuart=quart;
  }
  void movePad(){
    if (keyPressed) {
      if (key == knapp1) {
        padY= constrain(padY+padSpeed, (height/2)-(boardHeight/2)+(padSize/2)+padSize/2, (height/2)+(boardHeight/2)-(padSize/2)+(padSize/2));
      } 
      else if (key == knapp2) {
        padY = constrain(padY-padSpeed, (height/2)-(boardHeight/2)+(padSize/2)+padSize/2, (height/2)+(boardHeight/2)-(padSize/2)+(padSize/2));
      }
      else if (key == knapp3) {
        padX = constrain(padX-padSpeed, (width/2)-(boardWidth/2)+boardQuart+padSize/2, (width/2)-padSize+boardQuart+(padSize/2));
      }
      else if (key == knapp4) {
        padX = constrain(padX+padSpeed, (width/2)-(boardWidth/2)+boardQuart+padSize/2, (width/2)-padSize+boardQuart+(padSize/2));
      }}
}
void drawPad() {
    fill(225);
    ellipseMode(CENTER);
    ellipse(padX, padY-(padSize/2), padSize, padSize);
    fill(255,0,0);
    ellipse(padX, padY-(padSize/2), padSize/3, padSize/3);
  }
}
