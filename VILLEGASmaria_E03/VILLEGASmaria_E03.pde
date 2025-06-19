int numBubbles = 200;
float[] xPosition;
float[] yPosition;
float[] speedX;
float[] speedY;
int[] xDirection;
int[] yDirection;
float centralX;
float centralY = 50;
float centralSpeed = 10;
int centralDirection = 1;

void setup() {
  size(1000, 1000);
  noStroke();

  xPosition = new float[numBubbles];
  yPosition = new float[numBubbles];
  speedX = new float[numBubbles];
  speedY = new float[numBubbles];
  xDirection = new int[numBubbles];
  yDirection = new int[numBubbles];

  for (int i = 0; i < numBubbles; i++) {
    xPosition[i] = random(width);
    yPosition[i] = random(height);
    speedX[i] = random(5);
    speedY[i] = random(5);
    xDirection[i] = (random(1) > 0.5) ? 1 : -1;
    yDirection[i] = (random(1) > 0.5) ? 1 : -1;
  }

  centralX = 100;
}

void draw() {
  background(255);

 
  for (int i = 0; i < numBubbles; i++) {
    fill(#1140F5);
    noStroke();
    ellipse(xPosition[i], yPosition[i], 50, 50);
    fill(#A5F7E6);
    ellipse(xPosition[i], yPosition[i], 30, 30);
    fill(0);
    ellipse(xPosition[i], yPosition[i], 10, 10);

    fill(#0B1EBC, 100);
    noStroke();
    triangle(xPosition[i], yPosition[i], centralX, centralY, centralX - 20, centralY - 20);

    xPosition[i] += speedX[i] * xDirection[i];
    yPosition[i] += speedY[i] * yDirection[i];

    if (xPosition[i] >= width || xPosition[i] <= 0) {
      xDirection[i] *= -1;
    }
    if (yPosition[i] >= height || yPosition[i] <= 0) {
      yDirection[i] *= -1;
    }
  }


  centralX += centralSpeed * centralDirection;

 
  if (centralX >= width - 100 || centralX <= 100) {
    centralDirection *= -1;
  }


  fill(#162286, 200);
  ellipse(centralX, centralY, 200, 200);
  fill(#A5F7E6, 200);
  ellipse(centralX, centralY, 150, 150);
  fill(0, 200);
  ellipse(centralX, centralY, 80, 80);
}
