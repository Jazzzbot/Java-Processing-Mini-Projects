/** Author: Yasaman Hosseini
 *
 * Using recursion to produce fractal shapes that increase or decrease with the arrow keys.
 *
 */

int angle=60; //the angle that new circles are made
int circleCount=4; //the number iterations of circles
int upORdown=0; //the change in iterations
int leftORright=0; //the change in angles
float size; //size of the outer circle
float color1=0; //opacity of the circles
float color2=0; //color of circles
void setup() { // Called once at the beginning and defines size
  size(640, 480);
  stroke(0, 0, 0);
  size=height*9/10;
}

void draw() {
  background(0); // Start painting a new background
  circleCount+=upORdown; //adds or subtracts from the number of the circles depending on which key is pressed
  angle+=leftORright; //adds or subtracts from the angle of the circles depending on which key is pressed
  noFill();
  drawCircle(width/2, height/2, size, circleCount); //calls the fucntion to draw the circles
  leftORright=0; //resets the key pressed values
  upORdown=0;
}

void drawCircle(float posx, float posy, float diameter, float n) { //the function takes x and y positions, size and number of the circles
  color1=((float)n/circleCount);
  color2=(((float)circleCount-n)/circleCount);
  stroke(color2*255, 255, 128, 10+color1*90); //changes colors depending on the number of circles going from low opacity to higher opacity
  noFill();
  circle(posx, posy, diameter); //draws the outer circle
  if (n>1) { //checks if the counter is greater than one
    for (int i=0; i<360; i=i+angle) { //produces circles inside of circles
      drawCircle(posx+(diameter/4)*cos(PI*i/180), posy-(diameter/4)*sin(PI*i/180), diameter/2, n-1);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && circleCount<10) { //assigns the value 1 if the up key is pressed and limits the number to 10 to prevent errors
      upORdown=1;
    } else if (keyCode == DOWN && circleCount>1) { //assigns the value -1 if the down key is pressed
      upORdown=-1;
    }
    if (keyCode == RIGHT && angle<360) { //assigns the value 1 if the right key is pressed
      leftORright=1;
    } else if (keyCode == LEFT && angle>1) { //assigns the value -1 if the left key is pressed
      leftORright=-1;
    }
  }
}
void mousePressed() { //saves a screenshot when mouse is pressed
  saveFrame("task_6_recursion.tif");
}
