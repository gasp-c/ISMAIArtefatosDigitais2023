import processing.serial.Serial;
float[] vals = {};
float valx;
float valy;

float ballx;
float bally;

void setup() {

  size(800, 800);
  new Serial(this, "COM5", 9600).bufferUntil(ENTER);
  noStroke();
  background(0);
}

void draw() {

  valx=vals[0];
  valy=vals[1];

  ballx= map(valx, 0, 63, 0, width-10);
  bally= map(valy, 0, 63, 0, height-10);

  ellipse(ballx, bally, 10, 10);
  
  println(vals);
  
}

void serialEvent(final Serial s) {

  vals = float(splitTokens(s.readString()));
  redraw();
}
