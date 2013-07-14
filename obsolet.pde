/* 
class Tri0 {
  float x[], y[];
  Tri0(float x0, float y0, float x1, float y1, float x2, float y2) {
    x = new float[3];
    y = new float[3];
    x[0] = x0;
    y[0] = y0;
    x[1] = x1;
    y[1] = y1;
    x[2] = x2;
    y[2] = y2;
    println(n + ": " + x0 + " " + y0);
  }

  void display() {
    stroke(#E5155C);
    fill(#26E8A5);
    triangle(x[0], y[0], x[1], y[1], x[2], y[2]);
    //   println(n + ": " + round(x[0])  + " " + round(y[0]));
  }

  void shake() {
    float f = 5;
    float dd = f * random(1) - f/2;
    x[0] += dd;
    y[0] += dd;
    x[1] += dd;
    y[1] += dd;
    x[2] += dd;
    y[2] += dd;
  }
}
void tri(float x, float y, boolean bottom) {
  stroke(#E5155C);
  fill(#26E8A5);

  pushMatrix();

  translate(x, y);
  if (bottom) {
    fill(#333333);
    //    triangle(0, 0, a, 0, a / 2, h);
  } 
  else {
    fill(#ff0000);
    //    triangle(a / 2, h, a, 0, 1.5 * a, h);
  }
  popMatrix();
  Tri0 tx = new Tri0(x, y, x + a, y, x + 0.5 * a, y + h);
  t[n] = tx;
  n++;
  tx = new Tri0(x + 0.5 * a, y + h, x + a, y, x + 1.5 * a, y + h);
  t[n] = tx;
  n++;
}

Cluster(int n, float d, Vec2D center) {
  // Initialize the ArrayList
  nodes = new ArrayList<Node>();

  // Set the diameter
  diameter = d;

  // Create the nodes
  for (int i = 0; i < n; i++) {
    // We can't put them right on top of each other
    nodes.add(new Node(center.add(Vec2D.randomVector())));
  }

  // Connect all the nodes with a Spring
  for (int i = 0; i < nodes.size()-1; i++) {
    VerletParticle2D ni = nodes.get(i);
    for (int j = i+1; j < nodes.size(); j++) {
      VerletParticle2D nj = nodes.get(j);
      // A Spring needs two particles, a resting length, and a strength
      physics.addSpring(new VerletSpring2D(ni, nj, diameter, 0.01));
    }
  }
}



*/
