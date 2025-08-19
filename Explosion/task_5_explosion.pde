/** Author: Yasaman Hosseini
 *
 * An Explosion of shapes based on mouse pressure.
 *
 */
int n=200; //number of shapes
float[] xcircle=new float[n]; // x position of the circle
float[] ycircle=new float[n]; // y position of the circle
float[] xsquare=new float[n]; // x position of the square
float[] ysquare=new float[n]; // y position of the square
float[] xtri=new float[n]; // x position of the triangle
float[] ytri=new float[n]; // y position of the triangle
float[] xSpeedCircle=new float[n]; // x speed of the circle
float[] ySpeedCircle=new float[n]; // y speed of the circle
float[] xSpeedSquare=new float[n]; // x speed of the square
float[] ySpeedSquare=new float[n]; // y speed of the square
float[] xSpeedTri=new float[n]; // x speed of the triangle
float[] ySpeedTri=new float[n]; // y speed of the triangle
float[] r=new float[n];
int[] fillColor1=new int[n];
int[] fillColor2=new int[n];
int[] fillColor3=new int[n];
int[] shapes=new int[n];
int counter=0;
boolean flag=false;

void setup() {  // Called once at the beginning and defines size
  size(640, 480);
  stroke(0, 0, 0);
}

void draw() { // Called with up to 60fps
  background(255); // Start painting a new background
  if (mousePressed) { //checks if the mouse is being pressed
    if (flag==true) { //checks if the mouse has been released and removes the remaining shapes on the screen when mouse is pressed again
      counter=0; //if the mouse was pressed resets the counter to zero and switches the flag value
      flag=false;
    }
    if (counter<n) { //if the counter is smaller than n calculates the positions of x and y for each shape and thier speed
      xcircle[counter]=mouseX; //the initial position of the shapes which is the position of the mouse x and y
      ycircle[counter]=mouseY;
      xsquare[counter]=mouseX;
      ysquare[counter]=mouseY;
      xtri[counter]=mouseX;
      ytri[counter]=mouseY;
      xSpeedCircle[counter]=random(-7, 7); //assigns a random value to each speed of each shape
      ySpeedCircle[counter]=random(-7, 7);
      xSpeedSquare[counter]=random(-5, 5);
      ySpeedSquare[counter]=random(-5, 5);
      xSpeedTri[counter]=random(-10, 10);
      ySpeedTri[counter]=random(-10, 10);
      r[counter]= (float) counter + 1; //makes the shapes bigger for as long as the mouse is pressed but never goes beyond 200 because counter is always smaller than n
      fillColor1[counter]=(int)random(0, 255); //decides a random value for the color
      fillColor2[counter]=(int)random(0, 255);
      fillColor3[counter]=(int)random(0, 255);
      counter++;
    }
  }
  for (int i=0; i<counter; i++) { //the loop prouduces the circles, squares and triangles for as long as the mouse is pressed and gives them their speeds
    xcircle[i]=xcircle[i]+xSpeedCircle[i];
    ycircle[i]=ycircle[i]+ySpeedCircle[i];
    xsquare[i]=xsquare[i]+xSpeedSquare[i];
    ysquare[i]=ysquare[i]+ySpeedSquare[i];
    xtri[i]=xtri[i]+xSpeedTri[i];
    ytri[i]=ytri[i]+ySpeedTri[i];
    fill(fillColor1[i], fillColor2[i], fillColor3[i]);
    circle(xcircle[i], ycircle[i], 2*r[i]); //creates circles
    fill(fillColor1[i], fillColor2[i], fillColor3[i]);
    square(xsquare[i]-(r[i]), ysquare[i]-(r[i]), r[i]); //creates squares
    fill(fillColor1[i], fillColor2[i], fillColor3[i]);
    triangle(xtri[i], ytri[i]-r[i], xtri[i]-sqrt(3)*r[i]/2, ytri[i]+r[i]/2, xtri[i]+sqrt(3)*r[i]/2, ytri[i]+r[i]/2); //creates trangles
  }
}
void mouseReleased() { //switches the value of flag when mouse is released and saves a screenshot
  flag=true;
  saveFrame("task_5_explosion.tif");
}
