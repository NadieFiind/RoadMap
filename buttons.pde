class Button {
  ButtonInterface b;
  Button(ButtonInterface _b) {
    b = _b;
  }
}
abstract class ButtonInterface {
  float w, h, x, y;
  abstract void render();
  abstract void call();
  abstract void select(float x, float y);
}
class AddNode extends ButtonInterface {
  int index;
  color col = color(255);
  float margin = 20;
  float w = width / 2 - margin * 2;
  float h = 100 - margin * 2;
  float x = margin;
  float y = height - h - margin;
  AddNode(int _index) {
    super.w = w;
    super.h = h;
    super.x = x;
    super.y = y;
    index = _index;
  }
  void render() {
    bl.fill(col);
    bl.rect(x, y, w, h);
  }
  void call() {
    col = color(255, 0, 0);
    selection = buttons.get(index);
  }
  void select(float x, float y) {
    world.nodes.add(new Node("test", x, y));
    col = color(255);
  }
}
class DeleteNode extends ButtonInterface {
  int index;
  color col = color(255);
  float margin = 20;
  float w = width / 2 - margin * 2;
  float h = 100 - margin * 2;
  float x = width / 2 + margin;
  float y = height - h - margin;
  DeleteNode(int _index) {
    super.w = w;
    super.h = h;
    super.x = x;
    super.y = y;
    index = _index;
  }
  void render() {
    bl.fill(col);
    bl.rect(x, y, w, h);
  }
  void call() {
    col = color(255, 0, 0);
    selection = buttons.get(index);
  }
  void select(float x, float y) {
    //world.nodes.add(new Node("test", x, y));
    col = color(255);
  }
}