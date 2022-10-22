Dots[] one;
Walker you;

void setup(){
  size(800,800);
  you = new Walker();
  one = new Dots[150]; 
  for(int i = 0; i < one.length; i++)
    one[i] = new Dots();
}

void draw(){
  //translate(width/2-you.myX, height/2-you.myY);
  frameRate(200);
  background(255,255,255);
  for(int i = 0; i < one.length; i++){
    one[i].show();
  }
  you.walk();
  you.eat();
  you.show();
}

class Dots{
  int mySize, x, y, myColor; // member variables
  
  Dots(){ //constructor to initialize random positions
    mySize = (int)(Math.random()*60+10);
    x = (int)(Math.random()*1000);
    y = (int)(Math.random()*1000);
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  
  void show(){
    noStroke();
    fill(myColor);
    ellipse(x, y, mySize, mySize);    
  }
}//end of dot class

class Walker{
  int myX, myY, mySize, myColor;
  
  Walker(){
    mySize = 40;
    myX = myY = 400;
    myColor = color(255,0,0);
  }
  void walk(){
   if(mouseX > myX && mouseY < myY){
     myX = myX + (int)(Math.random()*5)+5;
     myY = myY + (int)(Math.random()*5)-5;
   }
   if(mouseX > myX && mouseY > myY){
     myX = myX + (int)(Math.random()*5)+5;
     myY = myY + (int)(Math.random()*5)+5;
   }
   if(mouseX < myX && mouseY < myY){
     myX = myX + (int)(Math.random()*5)-5;
     myY = myY + (int)(Math.random()*5)-5;
   }
   if(mouseX < myX && mouseY > myY){
     myX = myX + (int)(Math.random()*5)-5;
     myY = myY + (int)(Math.random()*5)+5;
   }
  }
  void eat(){
    for(int i = 0; i < one.length; i++){
      if(dist(you.myX, you.myY, one[i].x, one[i].y) < you.mySize/2 + one[i].mySize/2){
        if(you.mySize > one[i].mySize){
          you.mySize += 1;
          one[i].x = one[i].y = 0;
        }
      }
    }
  }
  void show(){
    stroke(0);
    strokeWeight(2);
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}//end of walker classs
