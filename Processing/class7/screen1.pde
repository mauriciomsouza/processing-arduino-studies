int score1 = 0;
int score2 = 0;
int start = 0;
int player1win = 0;
int player2win = 0;


void screen1() {
  if (p1Up == true) {
    p1.moveUp();
  }
    if (p1Down == true) {
    p1.moveDown();
  }
    if (p2Up == true) {
    p2.moveUp();
  }
    if (p2Down == true) {
    p2.moveDown();
  }
  
  if (score1 == 5 || score2 == 5) {
    println("FIM DE JOGO");
    if (score1 == 5) {
      player1win = 1;
    } else {
      player2win = 1;
    }
    score1 = 0;
    score2 = 0;
    fill(255);
    textFont(bitfont, 16);
    
  }
  if (start == 0) {
    if (player1win == 1) {
      fill(255);
      textFont(bitfont, 16);
      textAlign(CENTER, CENTER);
      text("JOGADOR 1 VENCEU", width/2, 200);
    } else if (player2win == 1) {
      fill(255);
      textFont(bitfont, 16);
      textAlign(CENTER, CENTER);
      text("JOGADOR 2 VENCEU", width/2, 200);
    }
    b = new Ball();
    if (keyPressed) {
      if (key == 'G' || key == 'g') {
         start = 1;
         player1win = 0;
         player2win = 0;
      }
    }
  }  
  fill(color1, color2, color3,99);
  rect(0,0,1280,720);
  if (start == 0) {
    b.display();
    fill(255);
    textFont(bitfont, 16);
    textAlign(CENTER, CENTER);
    text("PRESSIONE A TECLA [G] PARA JOGAR", width/2, height-200);

  } else {
    b.display();
    b.update();
  }

  p1.display();
  p2.display();
  
  fill(255);
  textFont(bitfont, 24);
  textAlign(CENTER, CENTER);
  text(score1, width/2-30, 50);
  text(':', width/2, 50);
  text(score2, width/2+30, 50);
  
  if(checkCollision(p1)) {
    b.applyForce(b.tackleLeft);
    color1 = parseInt(random(0,255));
    color2 = parseInt(random(0,255));
    color3 = parseInt(random(0,255));
  }
  if(checkCollision(p2)) {
    b.applyForce(b.tackleRight);
    color1 = parseInt(random(0,255));
    color2 = parseInt(random(0,255));
    color3 = parseInt(random(0,255));
  }
  
  if (b.location.x < -10) {
    score2++;
    b = new Ball();
    start = 0;
  }
  
    if (b.location.x > width+10) {
    score1++;
    b = new Ball();
    start = 0;
  }
}
