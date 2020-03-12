import peasy.*;

PeasyCam cam;

// COLORS
final color BLK = color( 42,  42,  42);
final color RED = color(255,   0,   0);
final color ORA = color(255, 150,   0);
final color YEL = color(255, 255,   0);
final color WHI = color(255, 255, 255);
final color GRE = color(  0,   0, 255);
final color BLU = color(  0, 255,   0);

float SPEED = 0.2;
int DIM = 3;
Cubie[] cube = new Cubie[DIM*DIM*DIM];
boolean drawingControls = false;
int counter = 0;
boolean started = false;

Move currentMove = new Move();

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  
  int index = 0;
  for(int x = -1; x <= 1; x++)
    for(int y = -1; y <= 1; y++)
      for(int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      } 
}

void turn(int index, int dir, char axis) {
  int cubeIndex = -2;
  Cubie cubie = null;
  PMatrix2D matrix = null;
  for(int i = 0; i < cube.length; i++) {
    cubie = cube[i];
    
    switch(axis) {
      case 'X':
        cubeIndex = cubie.x;
        break;
      case 'Y':
        cubeIndex = cubie.y;
        break;
      case 'Z':
        cubeIndex = cubie.z;
        break;
    }
    
    if(cubeIndex == index) {
      matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      
      switch(axis) {
        case 'X': 
          matrix.translate(cubie.y, cubie.z);
          cubie.update(cubie.x, round(matrix.m02), round(matrix.m12));
          break;
        case 'Y': 
          matrix.translate(cubie.x, cubie.z);
          cubie.update(round(matrix.m02), cubie.y, round(matrix.m12));
          break;
        case 'Z': 
          matrix.translate(cubie.x, cubie.y);
          cubie.update(round(matrix.m02), round(matrix.m12), round(cubie.z));
          break;
      }
      
      cubie.turnFaces(dir, axis);
    }
  }
  
}

void draw() {
  background(#2F2F2F); 
  
  cam.beginHUD();
  fill(255);
  textSize(24);
  text(counter, 100, 100);
  cam.endHUD();

  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);
  
  currentMove.update();
  
  if (currentMove.finished()) {
      counter++;
      currentMove.start();
      currentMove = new Move();
  }

  scale(42.0); // blaze it
  for (int i = 0; i < cube.length; i++) {
    push();
    if     (abs(cube[i].z)>0 && cube[i].z==currentMove.z) rotateZ(currentMove.angle);
    else if(abs(cube[i].x)>0 && cube[i].x==currentMove.x) rotateX(currentMove.angle);
    else if(abs(cube[i].y)>0 && cube[i].y==currentMove.y) rotateY(-currentMove.angle);

    cube[i].show();
    pop();
  }
}
