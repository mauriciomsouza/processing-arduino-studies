int Analog_Pin = A0; 

int val;
  
void setup ()
{
  pinMode(Analog_Pin, INPUT);
       
  Serial.begin(9600); 
}
  
void loop ()
{
    
  val = analogRead(Analog_Pin);
     
  Serial.println(val, DEC);  
  delay (10);
}
