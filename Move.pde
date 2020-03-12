class Move {
  float angle;
  int x;
  int y;
  int z;
  int dir;
  boolean animating = false;
  boolean finished  = false;
  
  private Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
    this.angle = 0;
  }

  Move(Move other) {
    this(other.x, other.y, other.z, other.dir);
  }
  
  Move() { this('0','0','0','0'); }

  void reverse() {
    dir *= -1;
  }

  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }

  boolean finished() {
    return finished;
  }

  void update() {
    if (animating) {
      angle += dir * SPEED;
      
      if (abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        
        if     (abs(z) > 0) turn(z, dir, 'Z');
        else if(abs(x) > 0) turn(x, dir, 'X');
        else if(abs(y) > 0) turn(y, dir, 'Y');  
      }
    }
  }
}
