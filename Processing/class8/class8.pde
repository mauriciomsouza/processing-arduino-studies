import processing.serial.*;

Serial myPort;
int val;

void setup() {
   size(800, 600);
    
   //a linha abaixo vai imprimir uma lista de portas seriais disponíveis
   //verificar em qual porta a sua arduino está conectada
   printArray(Serial.list());
   String portName = Serial.list()[0]; //colocar aqui a porta serial
   myPort = new Serial(this, portName, 115200);
}

void draw(){
   if ( myPort.available() > 0) {
      val = myPort.read();
   }
   if (val == 1) {
     println("RIGHT");
   } else if (val == 2) {
     println("LEFT");
   }  else if (val == 3) {
     println("SHOOT");
   }
   myPort.clear();
   val = 0;
   
}
