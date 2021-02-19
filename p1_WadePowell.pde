/*This program creates a makeshift touchscreen microwave interface*/

//import comtrolP5
import controlP5.*;


ControlP5 b0;
ControlP5 b1;

//set constants
int timer = 0;
int dor = 0;
int ctime = 0;
int cookS=0;
int cookM = 0;
int timerC=0;

//setup is called on startup
void setup() {
  
  b0 = new ControlP5(this);
  PFont p = createFont("Times New Roman",20); 
  ControlFont font = new ControlFont(p);
  b0.setFont(font);
  size(1000, 525);
  background(0);

  //door screen
  fill(87);
  stroke(200);
  rect(50, 50, 600, 425, 7);
  
  // GUI / door border
  fill(255);
  stroke(0,0);
  rect(690,2,2,550);
  //buttons for key pad
  b0.addButton("0")
     .setValue(0)
     .setPosition(810,355)
     .setSize(70,60);
     
  b0.addButton("8")
     .setValue(0)
     .setPosition(810,290)
     .setSize(70,60);
     
  b0.addButton("5")
     .setValue(0)
     .setPosition(810,225)
     .setSize(70,60);
     
  b0.addButton("1")
     .setValue(0)
     .setPosition(730,160)
     .setSize(70,60);
     
  b0.addButton("2")
     .setValue(0)
     .setPosition(810,160)
     .setSize(70,60);
     
  b0.addButton("3")
     .setValue(0)
     .setPosition(890,160)
     .setSize(70,60);
     
 b0.addButton("4")
     .setValue(0)
     .setPosition(730,225)
     .setSize(70,60);
     
 b0.addButton("6")
     .setValue(0)
     .setPosition(890,225)
     .setSize(70,60);
     
 b0.addButton("7")
     .setValue(0)
     .setPosition(730,290)
     .setSize(70,60);
    
 b0.addButton("9")
     .setValue(0)
     .setPosition(890,290)
     .setSize(70,60);
//create teh other buttons that are not in the key pad
b1 = new ControlP5(this);
  PFont q = createFont("Times New Roman",15); 
  ControlFont fon = new ControlFont(q);
  b1.setFont(fon);
     
 b1.addButton("Time\nCook")
     .setValue(0)
     .setPosition(730,355)
     .setSize(70,60);
 
b1.addButton("Start\n(30 Sec)")
     .setValue(0)
     .setPosition(890,355)
     .setSize(70,60);
     
b1.addButton("Cancel")
     .setValue(0)
     .setPosition(890,425)
     .setSize(70,60);
  
b1.addButton("Open")
     .setValue(0)
     .setPosition(730,425)
     .setSize(150,60);

}  
  
// draw is called after setup
void draw() {
  
  //println(mouseX + "," + mouseY);
    
  //timer
  fill(87);
  rect(805, 60, 80, 40, 7);
  fill(255, 0, 0);
  textSize(24);
  String minsec[] = countdown();
  text(minsec[1] + ":" + minsec[0], 812, 90);

}

String[] countdown(){
  
//secC, minC, timerC are the timer variables for cook time
  int secC = timerC/60;
  println(secC);
  int minC = 0;
  
  if(secC>=60){
    minC = (timerC/60)/60;
    secC = secC%60;
  }
  
  if(minC>=60){
    minC=minC%60;
  }
  
 //these are teh variables for teh regular "express" cook
  int mil = timer%60;
  int secs = timer/60;
  int min = 0;
  
  if(secs>=60){
    min = (timer/60)/60;
    secs = secs%60;
  }
  
  if(min>=60){
    min=min%60;
  }
 
  String str_secs = String.valueOf(secs);
  String str_mil = String.valueOf(mil);
  String str_min = String.valueOf(min);
  //decrements the time and keep the time format of a typical microwave
  if (timer > 0){
    timer=timer-1;
  }
  if (secs < 10){
    str_secs = "0" + secs;
  }
  if (min < 10){
    str_min = "0" + min;
  }
  
  if(dor==1){
    timer=0;
  }
  
    
  
  
//if the user is using cooketime this will be used
  if(ctime == 1){
   str_secs = String.valueOf(secC);
   str_min = String.valueOf(minC);
    
  if (secC < 10){
    str_secs = "0" + secC;
  }
  if (minC < 10){
    str_min = "0" + minC;
  }
  
  if(dor==1){
    timerC=0;
  }
   
}
  //outputs the minutes and seconds left to cook
  String minsec[] = {str_secs, str_min};
  return minsec;

}
//this maps out the button and assigns an action when theyre clicked
void mouseClicked(){
 
  if(mouseX> 730 && mouseX < 800 && mouseY>160 && mouseY<220){ 
   /*if ctime ==1 checks if the use is inputing with coook time or not. Cook time lets them enter the amount of seconds
   The default settind deals in minutes. It does this for every numbered button.
   */
  if(ctime==1){
    timerC=(timerC*10)+((3600/60)/10);
  }
  else if(ctime==0){
    timer += 3600; 
   }
  }
  if(mouseX> 810 && mouseX < 880 && mouseY>160 && mouseY<220){ 
  if(ctime==1){
    timerC=(timerC*10)+((3600/60)*2);
  }
  else if(ctime==0){
     timer += (3600*2); 
   }
  }
  if(mouseX> 890 && mouseX < 960 && mouseY>160 && mouseY<220){ 
   if(ctime==1){
    timerC=(timerC*10)+((3600*3)/60);
  }
  else{
     timer += (3600*3); 
   }
  }
  if(mouseX> 730 && mouseX < 800 && mouseY>225 && mouseY<285){ 
    if(ctime==1){
    timerC=(timerC*10)+((3600*4)/60);
  }
  else{
  timer += (3600*4);
   }
  }
  if(mouseX> 810 && mouseX < 880 && mouseY>225 && mouseY<285){ 
   if(ctime==1){
    timerC=(timerC*10)+((3600*5)/60);
  }
  else{
  timer += (3600*5); 
   }
  }
  if(mouseX> 890 && mouseX < 960 && mouseY>225 && mouseY<285){ 
   if(ctime==1){
    timerC=(timerC*10)+((3600*6)/60);
  }
  else{
  timer += (3600*6); 
   }
  }
  if(mouseX> 730 && mouseX < 800 && mouseY>290 && mouseY<350){ 
  if(ctime==1){
    timerC=(timerC*10)+((3600*7)/60);
  }
  else{
  timer += (3600*7); 
   }
  }
  if(mouseX> 810 && mouseX < 880 && mouseY>290 && mouseY<350){ 
  if(ctime==1){
    timerC=(timerC*10)+((3600*8)/60);
  }
  else{
  timer += (3600*8); 
   }
  }
  if(mouseX> 890 && mouseX < 960 && mouseY>290 && mouseY<350){ 
  if(ctime==1){
    timerC=(timerC*10)+((3600*9)/60);
  }
  else{
  timer += (3600*9); 
   }
  }
  if(mouseX> 730 && mouseX < 800 && mouseY>160 && mouseY<220){ 
  if(ctime==1){
     timerC=(timerC*10);
   }
  }
  //this is the start button 
  if(mouseX> 890 && mouseX < 960 && mouseY>355 && mouseY<415){ 
  if(ctime == 1){
    timer = timerC;
    ctime = 0;
  }
  else{
  timer += (3600/2); 
   }
  }
  
  //if the cancel button is clicked the timers are set to 0
  if(mouseX> 890 && mouseX < 960 && mouseY>425 && mouseY<465){ 
  ctime = 0;
  timerC = 0;
  timer = 0; 
   
  }
  //if the door button is clicked a white screen will be displayed representing an open door
  if(mouseX> 730 && mouseX < 880 && mouseY>425 && mouseY<465){ 
    
     if(dor == 1){
      fill(0);
      stroke(200);
      rect(0, 0, 690, 550);
      
      fill(87);
      stroke(0);
      rect(50, 50, 600, 425, 7);
      dor = 0;
     }
     else if(dor == 0){
      fill(255);
      stroke(0);
      rect(0, 0, 690, 550);
      dor=1;
      timer = 0;
     }
      
  }
  /*if cooktime is clicked it will set ctime to 1. This will then allow the program to run through the code with the cook time setting
  so the user can run the microwave in terms of specific seconds as opposed to minutes*/
 if(mouseX> 730 && mouseX < 800 && mouseY>355 && mouseY<415){ 
   ctime = 1;
 }

}
