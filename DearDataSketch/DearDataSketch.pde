String[] messages = {"Haha... hi there :) You might want to click on the screen", "Ok so you must've figured out the fact that this is for the Dear Data Project already. My project is about my favourite artist!! My friends say I listen to Tame Impala too much.. so lets find out if I really do listen to him that much :/"};
int stage = 0;     // 0 = first text, 1 = second text, 2 = stave + clef
float x;           // x position of the text

//declaring an image variable clef = bass clef photo
PImage clef;

//will only be executed once in the entire code
void setup() {
  size(800, 300);
  textSize(32);
  x = width;       // start just off the right edge

  //initialising clef = bass clef
  clef = loadImage("bass_clef-removebg-preview.png");
}

//will loop 60x a second when code is executed
void draw() {
  background(255); // redraw the background every frame so the text doesn't smear

  if (stage < 2) {
    // scrolling text (stage 0 or 1)
    fill(0);
    text(messages[stage], x, height/2);

    x -= 3;

    // once the text has fully left the screen, loop back to the right
    if (x < -textWidth(messages[stage])) {
      x = width;
    }
  } else {
    // stage 2: draw the stave and clef
    stroke(0);
    strokeWeight(1.5);
    for (int i = 0; i < 5; i++) {
      float y1 = 60 + i * 37;
      line(40, y1, 760, y1);
    }

    image(clef, 50, 59, clef.width * 0.3, clef.height * 0.3);
  }
}

void mousePressed() {
  if (stage < 2) {
    stage++;       // move to the next stage
    x = width;     // restart the text from the right edge
  }
}
