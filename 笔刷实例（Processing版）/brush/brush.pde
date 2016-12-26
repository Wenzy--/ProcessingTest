PImage brushPic;
float r;

void setup() {
  size(700, 400);
  background(255);
  r = 50;
  brushPic=loadImage("brush.png");
}

void draw() {
}

void mouseDragged() {
  tint(0);
  imageMode(CENTER);
  image(brushPic, mouseX, mouseY, r * 2, r * 2);
}

