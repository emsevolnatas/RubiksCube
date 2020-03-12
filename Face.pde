// the colored faces of a cubie
class Face {
  PVector vector;
  color c;

  Face(PVector vector, color c) {
    this.vector = vector;
    this.c = c;
  }
 
  void turn(float angle, char axis) {
    PVector vec = new PVector();

    switch(axis) {
      case 'X': 
        vec.y = round(vector.y * cos(angle) - vector.z * sin(angle));
        vec.z = round(vector.y * sin(angle) + vector.z * cos(angle));
        vec.x = round(vector.x);
        break;
      case 'Y': 
        vec.x = round(vector.x * cos(angle) - vector.z * sin(angle));
        vec.z = round(vector.x * sin(angle) + vector.z * cos(angle));
        vec.y = round(vector.y);
        break;
      case 'Z': 
        vec.x = round(vector.x * cos(angle) - vector.y * sin(angle));
        vec.y = round(vector.x * sin(angle) + vector.y * cos(angle));
        vec.z = round(vector.z);
        break;
    }
    
    this.vector = vec;
  }
  
 
  /*
    Called in Cubie.show()
    Displays a rectangle
  */
  void show() {
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    
    translate(0.5*vector.x, 0.5*vector.y, 0.5*vector.z);
    
    if      (abs(vector.x) > 0) rotateY(HALF_PI);
    else if (abs(vector.y) > 0) rotateX(HALF_PI);
    
    square(0, 0, 1);
    popMatrix();
  }
}
