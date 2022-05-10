void worldLayer() {
  center = new PVector(width / 2, height / 2);
  prevCenter = center.copy();
  
  background = new Background();
  world = new Digraph();
}
void buttonsLayer() {
  bl = createGraphics(width, height);
  bl.beginDraw();
  bl.endDraw();
  buttons.add(new Button(new AddNode(0)));
  buttons.add(new Button(new DeleteNode(1)));
}
void loadData() {
  data = loadJSONObject("data.json");
  nodes = data.getJSONArray("nodes");
  edges = data.getJSONArray("edges");
  
  for (int i = 0; i < nodes.size(); i++) {
    JSONObject node = nodes.getJSONObject(i);
    String name = node.getString("name");
    JSONArray coordinates = node.getJSONArray("coordinates");
    Node newNode = new Node(name, coordinates.getFloat(0), coordinates.getFloat(1));
    world.nodes.add(newNode);
  }
  
  for (int i = 0; i < edges.size(); i++) {
    JSONObject edge = edges.getJSONObject(i);
    String origin = edge.getString("origin");
    String destination = edge.getString("destination");
    Edge newEdge = new Edge(origin, destination);
    world.edges.add(newEdge);
  }
}