class Cubie {
  PMatrix3D matrix;
  int x = 0;
  int y = 0;
  int z = 0;
  Face[] faces = new Face[6];

  Cubie(PMatrix3D m, int x, int y, int z) {
    
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    this.initFaces();

  }
  
  void initFaces() {
    faces[5] = (this.x == -1?new Face(new PVector(-1,  0,  0),  RED):new Face(new PVector(-1,  0,  0),  BLK)); // R
    faces[4] = (this.x ==  1?new Face(new PVector( 1,  0,  0),  ORA):new Face(new PVector( 1,   0,  0), BLK)); // O
    faces[3] = (this.y == -1?new Face(new PVector( 0, -1,  0),  YEL):new Face(new PVector( 0,  -1,  0), BLK)); // Y
    faces[2] = (this.y ==  1?new Face(new PVector( 0,  1,  0),  WHI):new Face(new PVector( 0,   1,  0), BLK)); // W
    faces[0] = (this.z == -1?new Face(new PVector( 0,  0, -1),  GRE):new Face(new PVector( 0,   0, -1), BLK)); // G
    faces[1] = (this.z ==  1?new Face(new PVector( 0,  0,  1),  BLU):new Face(new PVector( 0,   0,  1), BLK)); // B         
  }
 
  /*
    Quarter turn on the faces to get the right 
    colors on a face after a turn
  */
  void turnFaces(int dir, char axis) {
    for (Face f : this.faces)
      f.turn(dir*HALF_PI, axis);
  }
  
  /*
    Updates the position of the cubie in the matrix so that 
    he knows where he is relative to other cubies
    Also update x,y,z coordinates
  */
  void update(int x, int y, int z) {
    matrix.reset(); 
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  /*
    For each Face of the cubie
    show the face
  */
  void show() {
    noFill();
    
    stroke(0);
    strokeWeight(0.1);
    
    pushMatrix(); 
    applyMatrix(this.matrix);
    
    box(1);
    
    for (Face f : this.faces) f.show(); 
    
    popMatrix();
  }
}
