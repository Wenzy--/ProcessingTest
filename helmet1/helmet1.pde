/**
 * 
 * Created By Wenzy in 2016
 * ziyangwen@gmail.com
 */

PImage outLine,pic1,pic2,pic3,pic4;
int seedNum;

void setup(){
  size(400,400);
  outLine = loadImage("0.png");
  pic1 = loadImage("1.png");
  pic2 = loadImage("2.png");
  pic3 = loadImage("3.png");
  pic4 = loadImage("4.png");
  seedNum = 0;
}

void draw(){
  
  randomSeed(seedNum); 
  background(random(255),random(255),random(255));
 
  blendMode(BLEND);
  imageMode(CENTER);
  tint(random(255),random(255),random(255)); 
  image(pic4,width/2,height/2);
  tint(random(255),random(255),random(255)); 
  image(pic3,width/2,height/2);
  tint(random(255),random(255),random(255)); 
  image(pic2,width/2,height/2);
  tint(random(255),random(255),random(255)); 
  image(pic1,width/2,height/2);
 
  blendMode(MULTIPLY);
  tint(255);
  image(outLine,width/2,height/2); 
}

void keyPressed(){
  if(key == '1'){
    seedNum++; 
  }
  if(key == '2'){
    seedNum--;
  }
  if(key == 's'){
    saveFrame(millis() + ".png"); 
  }
}