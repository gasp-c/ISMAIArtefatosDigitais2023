int pot0Val; 
int pot1Val;
int pinPot0 = A0;
int pinPot1 = A1;

void setup() {
Serial.begin(9600);
}
void loop() {
  
    
    //read potentiometers
    pot0Val = analogRead(pinPot0);
    pot1Val = analogRead(pinPot1);
    Serial.println(pot0Val,pot1Val);
    }
