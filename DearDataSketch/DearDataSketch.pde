String[] messages = {"Haha... hi there :) You might want to click on the screen", "Ok so you must've figured out the fact that this is for the Dear Data Project already. My project is about my favourite artist!! My friends say I listen to Tame Impala too much.. so lets find out if I really do listen to him that much :/"};

String warning = "Warning: none of the following contents are musically accurate. This has been made for fun and hopefully won't be viewed as something sacrilegious.. Please click to continue.";

int stage = 0;     // 0 = 1st text, 1 = 2nd text, 2 = flash warning, 3 = stave
float x;           // x position of text

//adding images
PImage clef;
PImage semib;

//will only be executed once
void setup() {
  size(800, 300);
  textSize(32);
  x = width;       // start just off the right edge

  //initialising images
  clef = loadImage("bass_clef-removebg-preview.png");
  semib = loadImage("sb-removebg-preview.png");
  ;
}

//will loop 60x a second when code is executed
void draw() {
  background(255); // redraw the background every frame so text doesn't smear

  if (stage < 2) {
    // scrolling text (stage 0 or 1)
    fill(0);
    text(messages[stage], x, height/2);

    x -= 3;

    // looping text
    if (x < -textWidth(messages[stage])) {
      x = width;
    }
  } else if (stage == 2) {
    // stage 2: flashing warning
    // frameCount/30 changes every half a second, so this is on for 30 frames & off for 30
    if ((frameCount / 30) % 2 == 0) {
      pushStyle(); // saves current style setting

      // warning message triangle w/ "!"
      fill(255, 0, 0);
      noStroke();
      triangle(400, 15, 365, 75, 435, 75);
      fill(255);
      textAlign(CENTER, CENTER);
      textSize(30);
      text("!", 400, 55);

      // warning message (wrapped inside a box)
      fill(255, 0, 0);
      textSize(26);
      text(warning, 50, 90, 700, 190);

      popStyle(); // restores prior settings
    }
  } else {
    // stage 3: draw the stave
    stroke(0);
    strokeWeight(1.5);
    for (int i = 0; i < 5; i++) {
      float y1 = 60 + i * 37;
      line(40, y1, 760, y1);
    }
    image(clef, 50, 60, clef.width * 0.3, clef.height * 0.3);

    {
      // stage 3: sb
      pushStyle();
      imageMode(CENTER);   // x&y in centre

      float lineGap = 37;       // matches stave spacing
      float bottomLine = 208;   // y of the bottom stave line

      for (int n = 0; n < 10; n++) {
        float x2 = 200 + n * 54;
        float y2 = bottomLine - n * (lineGap / 2);
        image(semib, x2, y2, semib.width * 0.15, semib.height * 0.15);
      }
      popStyle();
    }
  }
}


void mousePressed() {
  if (stage < 3) {
    stage++;       // move to next stage
    x = width;     // restart text from the right edge
  }
}
