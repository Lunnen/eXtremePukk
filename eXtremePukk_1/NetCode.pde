void oscEvent(OscMessage theOscMessage) { //Receive-code from network
  if(hostOn && serverOn){ //if game is hosted, receive these values from client.

  kontroll[1].padX = theOscMessage.get(0).intValue();
  kontroll[1].padY = theOscMessage.get(1).intValue();
  ClientJoined = theOscMessage.get(2).intValue();
  }
  else if(joinOn && clientOn){ //if joining a game, receive these values from the host.
  numOne = theOscMessage.get(0).intValue();
  numTwo = theOscMessage.get(1).intValue();
  x = theOscMessage.get(2).intValue();
  y = theOscMessage.get(3).intValue();
  kontroll[0].padX = theOscMessage.get(4).intValue();
  kontroll[0].padY = theOscMessage.get(5).intValue();
  }
  
}
void NetCodeHost(){
  if(hostOn && !serverOn){ //load server-engine
  oscP5 = new OscP5(this,12001);  //denna dator
  myRemoteLocation = new NetAddress(ClientIP,12000);  //motsatt dator
  serverOn=true;
  }
  if(hostOn && serverOn){
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(new int[] {numOne, numTwo, x, y, kontroll[0].padX, kontroll[0].padY}); /* add an int array to the osc message */

  oscP5.send(myMessage, myRemoteLocation); /* send the message */
  }
}
void NetCodeClient(){
  if(joinOn && !clientOn){ //load client-engine

  oscP5 = new OscP5(this,12000);  //denna dator
  myRemoteLocation = new NetAddress(ServerIP,12001);  //motsatt dator
  clientOn=true;
  }
  if(joinOn && clientOn){ //client-sendinginformation
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(new int[] { kontroll[1].padX,  kontroll[1].padY, 1}); /* add an int array to the osc message */
  oscP5.send(myMessage, myRemoteLocation); 
  }
}
  
  
