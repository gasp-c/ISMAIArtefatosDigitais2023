int sensorPin0 = A0;
int sensorPin1 = A1;
int sensorValue0;
int sensorValue1;
int LEDVal0;
int LEDVal1;
int LEDPin0 = 9;
int LEDPin1 = 10;

void setup() {
  Serial.begin(9600);
  pinMode(LEDPin0, OUTPUT);
  pinMode(LEDPin1, OUTPUT);
}

void loop() {
  sensorValue0 = analogRead(sensorPin0) >> 2;
  sensorValue1 = analogRead(sensorPin1) >> 2;


  LEDVal0 = map(sensorValue0, 0, 1024, 0, 255);
  LEDVal1 = map(sensorValue1, 0, 1024, 0, 255);

  analogWrite(LEDPin0, LEDVal0);
  analogWrite(LEDPin1, LEDVal1);


  // print out the value you read:
  Serial.print(LEDVal0);
  Serial.print(" ");
  Serial.println(LEDVal1);
  delay(10);  
}
