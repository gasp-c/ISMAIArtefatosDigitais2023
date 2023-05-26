import processing.serial.Serial;
float[] vals = {};

float ballX;
float ballY;

int ballSize = 10;
float stepX=ballSize;
float stepY=ballSize;

float posP1;
float posP2;

float valPot0;
float valPot1;


int playerSize = 5;


void setup() {

  new Serial(this, "COM5", 9600).bufferUntil(ENTER);

  size(800, 500);
  ballX = width/2;
  ballY = height/2;

  posP1 = height/2 - (height/playerSize/2);
  posP2 = height/2 - (height/playerSize/2);

  frameRate(24);
  fill(0);
  noStroke();
  background(255);
}


void draw() {

  background(255);
  rect(ballX, ballY, ballSize, ballSize);



  //animacao ball
  stepX = stepX*1.001;
  stepY = stepY*1.001;

  ballX = ballX + stepX ;
  ballY = ballY + stepY ;



  valPot0= vals[0];
  valPot1= vals[1];

  posP1=map(valPot0, 1, 63, 0, height);
  posP2=map(valPot1, 1, 63, 0, height);





  //P1
  rect(0, posP1, 10, height/playerSize);

  //P2
  rect(width-10, posP2, 10, height/playerSize);




  //colisao jogador 2

  if (ballX >= width-20) {
    if (ballY <= posP2 || ballY >= posP2 + height/playerSize) {
      reset();
    } else {
      stepX = stepX * -1;
    }
  }

  //colisao jogador 1
  if (ballX <= 10) {
    if (ballY <= posP1 || ballY >= posP1 + height/playerSize) {
      reset();
    } else {
      stepX = stepX * -1;
    }
  }


  //colisao limites verticais

  if ( ballY >= height || ballY <= 0) {
    stepY = stepY * -1;
  }
}


void serialEvent(final Serial s) {

  vals = float(splitTokens(s.readString()));
  redraw();
}


void reset() {
  ballX = width/2;
  ballY = width/2;
  stepX = ballSize/2;
  stepY = ballSize/2;
}





//void keyPressed() {
//  if (key == CODED) {
//    if (keyCode == UP) {
//      posP2 = posP2 - 3*ballSize ;
//    } else if (keyCode == DOWN) {
//      posP2 = posP2 + 3*ballSize ;
//    }
//  }


//  if (key == 'w' || key == 'W') {
//    posP1 = posP1 - 3*ballSize ;
//  } else if (key == 's' || key == 'S') {
//    posP1 = posP1 + 3*ballSize ;
//  }
//}
