/**
 * 
 * Created By Wenzy in 2016
 * ziyangwen@gmail.com
 */

import java.util.Date;

ArrayList<PImage> mulPics = new ArrayList<PImage>();
ArrayList<PImage> normalPics = new ArrayList<PImage>();
color myColors[];
int colorNum, mode; 
PImage pickPic;

void setup() {

  size(417, 700);
  mode = 1; // 0:randomPick 1;randomFromPic
  myColors = new color[0];

  File[] files = listFiles(sketchPath() + "/loadPic");
  for (int i = 0; i < files.length; i++) {
    File f = files[i];   
    String strArray[] = splitTokens(f.getName(), ".");
    String suffix = strArray[strArray.length-1];
    if (suffix.equals("png")||suffix.equals("jpg")||suffix.equals("jpeg")) {
      pickPic = loadImage("loadPic/" + f.getName());
    }
  }

  files = listFiles(sketchPath() + "/multiply");
  for (int i = 0; i < files.length; i++) {
    File f = files[i];   
    String strArray[] = splitTokens(f.getName(), ".");
    String suffix = strArray[strArray.length-1];
    if (suffix.equals("png")) {
      PImage temp = loadImage("multiply/" + f.getName());
      mulPics.add(temp);
    }
  }

  files = listFiles(sketchPath() + "/normal");
  for (int i = 0; i < files.length; i++) {
    File f = files[i];   
    String strArray[] = splitTokens(f.getName(), ".");
    String suffix = strArray[strArray.length-1];
    if (suffix.equals("png")) {
      PImage temp = loadImage("normal/" + f.getName());
      normalPics.add(temp);
      color tempColor = pickPic.get(int(random(0, pickPic.width)), 
        int(random(0, pickPic.height)));
      myColors = append(myColors, tempColor);
    }
  }
  colorNum = normalPics.size();
}


void draw() {
  background(255);
  imageMode(CENTER);
  blendMode(BLEND);

  for (int i = normalPics.size() - 1; i >= 0; i--) {
    tint(myColors[i]);
    PImage temp = normalPics.get(i);
    image(temp, width/2, height/2);
  }
  blendMode(MULTIPLY);
  for (int i = mulPics.size() - 1; i >= 0; i--) {
    tint(255);
    PImage temp = mulPics.get(i);
    image(temp, width/2, height/2);
  }
}

void keyPressed() {
  //  保存图片
  if (key == 's') {
    saveFrame(millis() + ".png");
  }
}

void mousePressed() {
  resetColor();
}

void mouseDragged() {
  resetColor();
}

void resetColor() {
  if (mode == 0) {
    myColors = new color[0];
    for (int i = 0; i < colorNum; i++) {
      color tempColor = color(random(255), random(255), random(255));
      myColors = append(myColors, tempColor);
    }
  }
  if (mode == 1) {
    myColors = new color[0];
    for (int i = 0; i < colorNum; i++) {
      color tempColor = pickPic.get(int(random(0, pickPic.width)), 
        int(random(0, pickPic.height)));
      myColors = append(myColors, tempColor);
    }
  }
}

File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    return null;
  }
}