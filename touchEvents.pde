PVector touch;
void touchStarted() {
  touch = new PVector(touches[0].x, touches[0].y); /* --- world --- */
  
  /* --- buttons --- */
  
  if (selection != null) {
    float sclMin = -worldSize / scl;
    float sclMax = worldSize / scl;
    float x = map(touches[0].x - center.x, -worldSize, worldSize, sclMin, sclMax);
    float y = map(touches[0].y - center.y, -worldSize, worldSize, sclMin, sclMax);
    selection.b.select(x, y);
    selection = null;
  }
  
  float mx = touches[0].x;
  float my = touches[0].y;
  for (Button button: buttons) {
    if (mx > button.b.x && mx < button.b.x + button.b.w) {
      if (my > button.b.y && my < button.b.y + button.b.h) {
        button.b.call();
      }
    }
  }
  
  /* --- end --- */
}

float prevDist = 0;
void touchMoved() {
  /* ------- world ------- */
  PVector touch0 = new PVector();
  touch0.x = touches[0].x;
  touch0.y = touches[0].y;
  
  if (touches.length > 1) {
    PVector touch1 = new PVector();
    touch1.x = touches[1].x;
    touch1.y = touches[1].y;
    
    float dist = touch0.dist(touch1);
    if (dist > prevDist) {
      scl += scaleSpeed;
    } else {
      scl -= scaleSpeed;
    }
    
    prevDist = dist;
  }
  
  PVector dir = PVector.sub(touch0, touch);
  center = PVector.add(dir, prevCenter);
  /* --- end --- */
}

void touchEnded() {
  prevCenter = center; /* --- world --- */
}