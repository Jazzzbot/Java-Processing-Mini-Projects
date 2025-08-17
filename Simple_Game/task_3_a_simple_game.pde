/** Author: Yasaman Hosseini
 *
 * A simple game that will give you points for how many times you can click on the ball
 * Solution to: Programming 1, task 3
 *
 */
float borderY = 240;  // Circle y position
float borderX = 320;  // Crcle x position
float xspeed = 1.4;  // Speed of the shape
float yspeed = 1.6;  // Speed of the shape
float Acc = 1;        // Acceleration
int xdirection = 1;  // Left to Right
int ydirection = 1;  // Top to Bottom
int diameter = 50; //diameter of the shape
int score=0;
int highscore=0;
int fill=100; //Shape fill color
void setup() {      // Called once at the beginning and defines size
  size(640, 480);
  stroke(0, 0, 0);
}
void draw() { // Called with up to 60fps
  background(255);   // Paint a new background
  fill(fill, 0, fill);
  textSize(32);        // set text size
  text("Score:"+score, 400, 450); // draw text at (x=50, y=200)
  text("High Score:"+highscore, 400, 400); // draw text at (x=50, y=200)
  circle(borderX, borderY, diameter); // Draw a circle
  Acc = random(-1.0, 1.0); // Assign acceleration a random number between -1 and 1
  if (borderY+(yspeed*ydirection)>(480-diameter/2) || borderY+(yspeed*ydirection)<(diameter/2)) { // Not let the circle go over the border
    ydirection=-ydirection; // Reverse direction
    yspeed=yspeed+Acc;
    xspeed=xspeed+Acc;
    fill=100;
  }
  if (borderX+(xspeed*xdirection)>(640-diameter/2) || borderX+(xspeed*xdirection)<(diameter/2)) { // Not let the circle go over the border
    xdirection=-xdirection; // Reverse direction
    xspeed=xspeed+Acc;
    yspeed=yspeed+Acc;
    fill=100;
  }
  borderY = borderY +(yspeed*ydirection); // Change position of the circle based on speed and direction
  borderX = borderX +(xspeed*xdirection);
  fill=100;
}

void mousePressed() {
  if (mouseX > borderX-25 && mouseX < borderX+25 &&
    mouseY > borderY-25 && mouseY < borderY+25) { // When mouse is pressed on the circle add to score
    if (mousePressed) {
      score=score+1;
      println("score:", score);
    }
    if (score>highscore) { //hold the highest score
      highscore=score;
    }
    println("highscore:", highscore);
    fill=200; //change color when mouse is pressed on the circle
  }
  if (mouseX < borderX-25 || mouseX > borderX+25 ||
    mouseY < borderY-25 || mouseY > borderY+25) { //When mouse is pressed anywhere else turn the score zero
    if (mousePressed) {
      score=0;
    }
  }
}
