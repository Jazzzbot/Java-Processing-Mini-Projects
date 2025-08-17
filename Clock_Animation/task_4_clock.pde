/** Author: Yasaman Hosseini
 *
 * Drawing of an analog clock
 * Solution to: Programming 1, task 4
 *
 */
float hourAngel=0; // The angel of the hour hand
float minuteAngel=5; // The angel of the minute hand
int d=300; // The diameter of the clock
int clr=255; // The initial fill color of the clock
int count=0;
void setup() { // Called once at the beginning and defines size
  size(640, 480);
  stroke(100, 0, 200);
}
void draw() { // Called with up to 60fps
  background(255); // Start painting a new background
  stroke(0);
  fill(clr - (float) mouseY / (float) height*200); // The color of the clock which is affected by the movement of the mouse in Y-direction
  circle(width/2, height/2, d + (float) mouseX/ (float) width*200); // The size of the clock which is affected by the movement of the mouse in X-direction
  stroke((float) mouseY / (float) height*200);
  line(width/2, height/2, width/2 +(d/3)*cos(hourAngel), height/2 + (d/3)*sin(hourAngel)); // Draws the hour hand
  hourAngel=hourAngel+0.005; // Changes the speed of the hour hand
  if (hourAngel==360) { // Checks if the hour hand has traced the clock completely
    hourAngel=0;
  }
  stroke((float) mouseY / (float) height*200);
  line(width/2, height/2, (width/2) +(d/2)*cos(minuteAngel*PI/180), height/2 + (d/2)*sin(minuteAngel*PI/180)); // Draws the minute hand
  minuteAngel=minuteAngel+0.05; // Changes the speed of the minute hand
  if (minuteAngel==360) { // Checks if the minute hand has traced the clock completely
    minuteAngel=0;
  }
  for (int count=0; count<360; count=count+30) { // In a loop makes 12 circles on the clock that are 30 degrees apart from each other
    fill((float) mouseY / (float) height*200); // Changes the colors of the circles in contrast to the color of the clock
    circle( width/2 + (d/2)*cos(count*PI/180), height/2 + (d/2)*sin(count*PI/180), 10); //Draws each circle
  }
}
void mousePressed() {
  saveFrame("task_4_clock.tif"); // when mouse is pressed saves frame in .tif format
}
