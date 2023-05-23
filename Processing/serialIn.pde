import processing.serial.*;

Serial myport;
float x;
float y;

void setup() {

  size(800, 600);
  
  myport = new Serial(this, "COM3", 9600);
  myport.bufferUntil('\n');
  textSize(30);
}

void draw() {
  background(255);
  fill(0);

  //text(0, width/2-30, height/2);
  //text(0, width/2+30, height/2);
}

void serialEvent(Serial myport) {
  String portData = myport.readString();
  String[] stringData = split(portData, ',');
  float[] values = float(stringData);
  //x = map(values[0], 0, 1023, 0, width);
  //y = map(values[1], 0, 1023, 0, height);
 
  text(values[0], width/2-30, height/2);
  text(values[1], width/2+30, height/2);

  myport.write('s');
}
