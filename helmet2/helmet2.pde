/**
 * 
 * Created By Wenzy in 2016
 * ziyangwen@gmail.com
 */

ArrayList<PImage> pics = new ArrayList<PImage>();
int seedNum;

void setup() {
  size(400, 400);
  for (int i = 0; i <=4; i++) {
    PImage temp;
    temp = loadImage(str(i)+".png");
    pics.add(temp);
  }
  seedNum = 0;
}

void draw() {

  randomSeed(seedNum); 
  background(random(255), random(255), random(255));

  imageMode(CENTER);
  blendMode(BLEND);
  for (int i = 4; i >= 0; i--) {
    if (i != 4) {
      blendMode(ADD);
    }
    tint(random(255), random(255), random(255), 190);
    if (i == 0) {
      blendMode(MULTIPLY);
      tint(255);
    }
    PImage temp = pics.get(i);
    image(temp, width/2, height/2);
  }
}

void keyPressed() {
  if (key == '1') {
    seedNum++;
  }
  if (key == '2') {
    seedNum--;
  }
  if (key == '3') {
    saveFrame(millis() + ".png");
  }
}