PFont font;
int count;
PImage background, bottle, boss, bone, gold;


void setup() {
  size(700, 400);
  font = createFont("SourceHanSansCN-Medium", 50);

  bottle = loadImage("bottle.png");
  background = loadImage("background.png");
  boss = loadImage("boss.png");
  bone = loadImage("bone.png");
  gold = loadImage("gold.png");

  count = 0;
}

void draw() {
  background(0);
  textFont(font, 50);
  textSize(20);

  //绘制背景
  fill(255);
  imageMode(CENTER);
  image(background, width/2, height/2, 700, 400);

  //绘制文字后的半透明背景
  fill(0, 150);
  rect(0, 250, 700, 80);
  rect(0, 350, 700, 40);

  if (count == 0) {
    fill(255);
    text("你為了尋找傳說中的寶藏，进入了黑暗森林。", 30, 280);
    text("突然，你和你的小伙伴在路上看见一个神秘药瓶，你打算怎么做。", 30, 310);
    fill(150, 150, 255);
    text("1.踢飞它", 30, 380);
    text("2.自己喝了", 180, 380);
    text("3.怂恿小伙伴喝了", 330, 380);

    fill(255);
    image(bottle, width/2, height/3, 100, 100);
  }

  if (count == 1) {
    fill(255);
    text("水壶翻倒了，突然一股浓烟冒出。", 30, 280);
    text("终极 Boss 直接出现到面前 …(⊙_⊙;)，你准备", 30, 310);
    fill(150, 150, 255);
    text("1.情况不妙，闪", 30, 380);
    text("2.我是勇者我进攻！", 240, 380);
    text("3.陪它聊聊天", 500, 380);

    fill(255);
    image(boss, width/2, height/3, 100, 100);
  }

  if (count == 2) {
    fill(255);
    text("突然间，你拥有了超能力。", 30, 280);
    text("感应到宝藏的呼唤，来到了终极 Boss 的面前，你准备", 30, 310);
    fill(150, 150, 255);
    text("1.不啰嗦，直接进攻", 30, 380);
    text("2.陪它聊聊天", 250, 380);

    fill(255);
    image(boss, width/2, height/3, 100, 100);
  }

  if (count == 3) {
    fill(255);
    text("小伙伴痛苦地跪倒在地上。", 30, 280);
    text("化身成终极 Boss 站到你的面前 …(⊙_⊙;)，你准备", 30, 310);
    fill(150, 150, 255);
    text("1.情况不妙，闪", 30, 380);
    text("2.我是勇者我进攻！", 240, 380);
    text("3.陪它聊聊天", 500, 380);

    fill(255);
    image(boss, width/2, height/3, 100, 100);
  }

  if (count == 4) {
    fill(255, 0, 0);
    imageMode(CENTER);
    image(background, width/2, height/2, 700, 400);
    fill(255);
    text("你的速度太慢了，Boss 向你扔了一个火球", 30, 280);
    text("由于实力的差距，你无法抵挡.....", 30, 310);
    fill(150, 150, 255);
    text("游戏结束", 30, 380);

    fill(255);
    image(bone, width/2, height/3, 100, 100);
  }

  if (count == 5) {
    fill(255);
    text("Boss 被你的气势打倒了", 30, 280);
    text("宝藏出现", 30, 310);
    fill(150, 150, 255);
    text("你和小伙伴带着宝藏逃离黑暗森林，通关成功！", 30, 380);

    fill(255);
    image(gold, width/2, height/3, 170, 150);
  }

  if (count == 6) {
    fill(255, 0, 0);
    imageMode(CENTER);
    image(background, width/2, height/2, 700, 400);
    fill(255);
    text("Boss 拒绝你的请求,并向你扔了个火球", 30, 280);
    text("由于实力的差距，你无法抵挡.....", 30, 310);
    fill(150, 150, 255);
    text("游戏结束", 30, 380);

    fill(255);
    image(bone, width/2, height/3, 100, 100);
  }
}

void keyPressed() {
  if (count == 0) {
    if (key == '1') {
      count = 1;
    }
    if (key == '2') {
      count = 2;
    }
    if (key == '3') {
      count = 3;
    }
  } else if (count == 1 || count == 3) {
    if (key == '1') {
      count = 4;
    }
    if (key == '2') {
      count = 5;
    }
    if (key == '3') {
      count = 6;
    }
  } else if (count == 2) {
    if (key == '1') {
      count = 5;
    }
    if (key == '2') {
      count = 6;
    }
  }
}

