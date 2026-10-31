//declaring an image variable clef = bass clef photo
PImage clef;

//will only be executed once in the entire code
void setup() {
  //setup size & colour of the canvas
  size(800, 300);
  background(255);
  //initialising clef = bass clef
  clef = loadImage("bass_clef-removebg-preview.png");
}

//will loop 60x a second when code is executed
void draw() {
  //draw in stave
  stroke (0);
  strokeWeight(1.5);
  //using a loop to draw the 5 stave lines
  for (int i = 0; i<5; i++) {
    //setting the y position of the start of each stave line
    float y = 60 + i * 37;
    //drawing the lines between 2 points
    line(40, y, 760, y);
  }

  //insert bass clef photo
  image(clef, 50, 59, clef.width * 0.3, clef.height * 0.3);
}
