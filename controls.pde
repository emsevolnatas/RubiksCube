final char [] allKeys = {'w','W','y','Y','o','O','r','R','g','G','b','B'};
final Move[] allMoves = new Move[] {
    new Move( 0,  1,  0, -1), 
    new Move( 0,  1,  0,  1),
    
    new Move( 0, -1,  0,  1), 
    new Move( 0, -1,  0, -1),
    
    new Move( 1,  0,  0,  1), 
    new Move( 1,  0,  0, -1),
    
    new Move(-1,  0,  0, -1), 
    new Move(-1,  0,  0,  1),
    
    new Move( 0,  0,  1,  1), 
    new Move( 0,  0,  1, -1),
    
    new Move( 0,  0, -1, -1), 
    new Move( 0,  0, -1,  1) 
};

void keyPressed() {
  if(key == ' ') scramble(100);  
  else if(isRecognized(key)){
    currentMove = correspondingMove(key);
    currentMove.start();
    correspondingMove(key);
  }
}

boolean isRecognized(char car) {
  for(char c : allKeys) 
    if(c == car) return true;
  return false;
}

// scrambling resets counter
void scramble(int n) {
    counter = 0;
    for (int i = 0; i < n; ++i)
      applyMove(allKeys[floor(random(12))]);  
}

void applyMove(char mv) {
  switch (mv) {
    case 'w':
      turn( 1,  1, 'Z');
      break;
    case 'W':
      turn( 1, -1, 'Z');
      break;  
    case 'y':
      turn(-1,  1, 'Z');
      break;
    case 'Y': 
      turn(-1, -1, 'Z');
      break;
    case 'o': 
      turn( 1,  1, 'Y');
      break;
    case 'O':
      turn( 1, -1, 'Y');
      break;
    case 'r': 
      turn(-1,  1, 'Y');
      break;
    case 'R': 
      turn(-1, -1, 'Y');
      break;
    case 'g': 
      turn(-1,  1, 'X');
      break;
    case 'G':
      turn(-1, -1, 'X');
      break;
    case 'b':
      turn( 1,  1, 'X');
      break;
    case 'B': 
      turn( 1, -1, 'X');
      break;
  }

}

Move correspondingMove(char mv) {
  switch(mv) {
   // WHITE
    case 'w': return allMoves[0];
    case 'W': return allMoves[1];
   // YELLOW
    case 'y': return allMoves[2];
    case 'Y': return allMoves[3];
   // ORANGE
    case 'o': return allMoves[4];
    case 'O': return allMoves[5];
   // RED
    case 'r': return allMoves[6];
    case 'R': return allMoves[7]; 
   // GREEN
    case 'g': return allMoves[8]; 
    case 'G': return allMoves[9];
   // BLUE
    case 'b': return allMoves[10];
    case 'B': return allMoves[11];
  }
  return new Move();
}
