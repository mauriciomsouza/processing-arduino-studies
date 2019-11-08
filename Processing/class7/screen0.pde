void screen0() {
  if (keyPressed) {
    if (key == ENTER) {
       screen = 1;
    }
  }
  fill(color1, color2, color3,99);
  rect(0,0,1280,720);
  imageMode(CENTER);
  image(logo, width/2, 300);
  if(s%2 == 0) {
    fill(255);
    textFont(bitfont, 16);
    textAlign(CENTER, CENTER);
    text("PRESSIONE ENTER PARA INICIAR", width/2, height-200);
  }
}
