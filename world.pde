class Background {
  PVector[] stars = new PVector[(int) worldSize];
  float start = 0;
  float increment = 0.01;
  Background() {
    for (int i = 0; i < stars.length; i++) {
      float x = random(-worldSize, worldSize);
      float y = random(-worldSize, worldSize);
      stars[i] = new PVector(x, y);
    }
  }
  void render() {
    noStroke();
    fill(255);
    float xoff = start;
    for (PVector star: stars) {
      float r = noise(xoff) * 5;
      ellipse(star.x, star.y, r, r);
      xoff++;
    }
    start += increment;
  }
}
class Digraph {
  ArrayList<Node> nodes = new ArrayList<Node>();
  ArrayList<Edge> edges = new ArrayList<Edge>();
  void render() {
    for (Edge edge: edges) {
      edge.render();
    }
    for (Node node: nodes) {
      node.render();
    }
  }
}
class Node {
  String name;
  PVector pos;
  Node(String _name, float x, float y) {
    name = _name;
    pos = new PVector(x, y);
  }
  void render() {
    fill(255, 200);
    noStroke();
    ellipse(pos.x, pos.y, 100, 100);
  }
}
class Edge {
  PVector origin;
  PVector destination;
  Edge(String _origin, String _destination) {
    for (Node node: world.nodes) {
      if (node.name.equals(_origin)) {
        origin = node.pos;
      } else if (node.name.equals(_destination)) {
        destination = node.pos;
      }
    }
  }
  void render() {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    strokeWeight(4);
    line(origin.x, origin.y, destination.x, destination.y);
    pushMatrix();
    translate(origin.x, origin.y);
    float distance = origin.dist(destination);
    PVector v1 = new PVector(0, distance);
    PVector v2 = PVector.sub(destination, origin);
    if (origin.x < destination.x) {
      rotate(-PVector.angleBetween(v1, v2));
    } else {
      rotate(PVector.angleBetween(v1, v2));
    }
    line(0, 0, 0, distance);
    triangle(0, distance, -20, distance - 20, 20, distance - 20);
    popMatrix();
  }
}