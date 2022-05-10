// settings
float worldSize = 5000;
float initScale = 1;
float scaleSpeed = 0.01;
float minScale = 0.1;
float maxScale = 5;

// touchEvents variables
PVector center;
PVector prevCenter;
float scl = initScale;

// world layer
Background background;
Digraph world;

// buttons layer
PGraphics bl;
ArrayList<Button> buttons = new ArrayList<Button>();
Button selection;

// data
JSONObject data;
JSONArray nodes;
JSONArray edges;

void setup() {
  size(displayWidth, displayHeight);
  worldLayer();
  buttonsLayer();
  loadData();
}
void draw() {
  // world layer
  pushMatrix();
  
  background(0);
  translate(center.x, center.y);
  scale(constrain(scl, minScale, maxScale));
  
  background.render();
  world.render();
  
  popMatrix();
  
  // buttons layer
  pushMatrix();
  
  for (Button button: buttons) {
    button.b.render();
  }
  
  popMatrix();
  
  image(bl, 0, 0);
}