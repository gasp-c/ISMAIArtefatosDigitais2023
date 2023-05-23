int posX;
int posY;
int brushSize = 4;

color fillVal = color(126);


void setup() {

  size(800, 500);
  posX = width/2;
  posY = height/2;
  
  fill(0);
  noStroke();
  background(255);
  
  frameRate(240);
}



void draw() {

  rect(posX, posY, brushSize, brushSize);
}




void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      posY = posY - brushSize ;
    } else if (keyCode == DOWN) {
      posY = posY + brushSize ; 
    } else if (keyCode == LEFT) {
      posX = posX - brushSize ; 
    } else if (keyCode == RIGHT) {
      posX = posX + brushSize ; 
    } 
}
}
