import peasy.*;

PeasyCam cam;

PShape s;
Debris d;

int boundaryW;
int boundaryH;

color backgroundcol = color(120);
boolean stage = true;

void setup() {
  fullScreen(P3D);

  // Add objects.
  s = loadShape("wrench.obj");
  d = new Debris(s, 0, 0);
  
  // Peasy cam.
  cam = new PeasyCam(this, 400);
  cam.lookAt(width/2, height/2, 50);

  // Boundary of viewing area.
  boundaryW = int(width * 0.47);
  boundaryH = int(height * 0.47);
}

void draw() {
  background(backgroundcol);
  translate(width/2, height/2, 0);   
  lights();

  drawStage();

  d.show();
} 

void drawStage() {
  if(stage) {
    // Draw the bounds of what will be displayed.
    pushMatrix();
    fill(0);
    rectMode(CENTER);
    rect(0, 0, boundaryW, boundaryH);
    noFill();
    stroke(0,0,255);
    translate(0, 0, 100);
    box(boundaryW, boundaryH, 0);
    popMatrix();

    // Draw the center origin for reference.
    stroke(0, 255, 0);
    line(0, -100, 0, 0, 100, 0);
    stroke(255, 0, 0);
    line(-100, 0, 0, 100, 0, 0);
    stroke(0, 0, 255);
    line(0, 0, -100, 0, 0, 100);
  }
}

void keyPressed() {
    if (key == 'c') {
      stage = !stage;

      // Change appearence depending on stage value.
      if (stage) {
        backgroundcol = color(120);
        cam.lookAt(width/2, height/2, 50);
      } else {
        backgroundcol = color(0);
        cam.lookAt(width/2, height/2, 39);
      }
    }
}