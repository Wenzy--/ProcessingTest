PImage brushPic;
float r, brushDist;
float lastX, lastY;

void setup() {
  size(700, 400);
  background(0);
  r = 50;
  brushDist = 4;
  brushPic=loadImage("brush.png");
}

void draw() {
}

void mousePressed() {
  if (lastX == 0 && lastY == 0) {
    lastX = mouseX;
    lastY = mouseY;
  }
}

void mouseDragged() {

  imageMode(CENTER);
  int brushNum;
  float dist = dist(mouseX, mouseY, lastX, lastY);
  float angle = atan2(mouseY - lastY, mouseX - lastX);


  if (dist > brushDist) {
    brushNum = int(dist/brushDist);
    float newX = 0;
    float newY = 0;
    for (int i = 1; i <= brushNum; i++) {
      float l = i * brushDist;
      newX = lastX + cos(angle) * l;
      newY = lastY + sin(angle) * l;
      colorMode(HSB);
      blendMode(ADD);
      tint(random(255), 255, 255, random(50, 160));
      pushMatrix();
      translate(newX, newY);
      rotate(random(2 * PI));
      float randomSize = random(1);
      image(brushPic, 0, 0, r * 2 * randomSize, 
            r * 2  * brushPic.height/(float)brushPic.width * randomSize);
      popMatrix();
    }
    lastX = newX;
    lastY = newY;
  }
}

void mouseReleased() {
  lastX = 0;
  lastY = 0;
}

void keyPressed() {
  background(0);
}