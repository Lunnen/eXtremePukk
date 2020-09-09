void introText(){ //Load the intro text "Group 1 productions".

  fill(0,0,240);
  textFont(intro1);
  text("Group1", 80, height/2+20); 
  textFont(intro2);
  text("productions", 100, height/2+70); 
}
void Partikel(){ 
  for(int i=0; i<p.length; i++){ // amount of particles 
    p[i]= new Particle (random(height),random(width),5,5,0,.999,0,color(242,204,47),color(255,0,0));     
  } 
  for(int i=0; i< attractor.length; i++){  
    attractor[i]= new Particle (random(height),random(width),5,5,30,.999,0,color(245,245,245),color(255)); 
  } 
  for (int i = 0; i < staticAttractor.length; i++) 
  { 
    float q = i; 
    staticAttractor[i] = new Particle(0.333*width,(q/staticAttractor.length)*height,1,1,0,.999,0,color(0),color(0)); 
  } 
}
void LaddaPartikel(){
  fill(0,15); 
  noStroke(); 
  rect(0,0, width, height); 
  stroke(255); 
  frameRate(15); 

  for(int i=0; i<p.length; i++) 
  { 
    p[i].xp=100; 
    p[i].yp=100;    
    float distance = sqrt(pow(mouseX-p[i].pos.x, 2) + pow(mouseY - p[i].pos.y, 2)); 
    
    if(distance < 100){       
      p[i].colorT+=.01; 
    } 
    else{ 
      p[i].colorT-=.01; 
    } 
    p[i].newAttract(attractor); 
    p[i].findClosestAttractor(attractor); 
    p[i].checkColor(); 
    p[i].drawParticle();   
  } 
  //loops through every attractor and draws it to screen 
for (int i = 0; i < attractor.length; i++){ 
 
    attractor[i].newAttract(staticAttractor); 
    attractor[i].findClosestAttractor(staticAttractor); 
    attractor[i].checkColor(); 
    attractor[i].drawParticle(); 
  } 
  for (int i = 0; i < staticAttractor.length; i++){ 
    staticAttractor[i].drawParticle();  
  } 
  //println(frameCount); 
 
} //end function
