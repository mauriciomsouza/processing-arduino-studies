int sinalPhoto = 0;
int pinoSensor = A0;
int pinoLed = 3;
int sinalLed = 0;
int luminosidade = 0;
int adapt = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  sinalPhoto = analogRead(pinoSensor);
  luminosidade = map(sinalPhoto, 0, 1023, 0, 255); 
  adapt = map(luminosidade, 110, 212, 0, 255);
  Serial.println(adapt, DEC);
  if (adapt < 0) {
    
  } else {
    analogWrite(pinoLed, adapt);
  }
  delay(10);
}
