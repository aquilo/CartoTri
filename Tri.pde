class Tri {
  //  float x[], y[];
  int id;
  Node corners[];

  Tri(Node n0, Node n1, Node n2) {
    id = nrTri++;
    corners = new Node[3];
    corners[0] = n0;
    corners[1] = n1;
    corners[2] = n2;
    float diameter = 50;
    int d = round(2.0 * random(1) * diameter);
    physics.addSpring(new VerletSpring2D(n0, n1, diameter, 0.01));
    physics.addSpring(new VerletSpring2D(v2, v3, diameter, 0.01));
    physics.addSpring(new VerletSpring2D(v1, v3, diameter, 0.01));
    println(v1 + " " + v2);
  }

/*  Tri(Node n0, Node n1, Node n2) {
    //   x = new float[3];
    //   y = new float[3];
    id = nrTri++;
    corners = new Node[3];
    corners[0] = n0;
    corners[1] = n1;
    corners[2] = n2;
    float diameter = 50;
    int d = round(2.0 * random(1) * diameter);
    VerletParticle2D v1 = cluster.nodes.get(n0.id);
    VerletParticle2D v2 = cluster.nodes.get(n1.id);
    VerletParticle2D v3 = cluster.nodes.get(n2.id);
    physics.addSpring(new VerletSpring2D(v1, v2, diameter, 0.01));
    physics.addSpring(new VerletSpring2D(v2, v3, diameter, 0.01));
    physics.addSpring(new VerletSpring2D(v1, v3, diameter, 0.01));
    println(v1 + " " + v2);
  }
*/
Tri(Node n0, Node n1, Node n2, int dummy) {
    new Tri(n0, n1, n2);
  }

  /*
Tri(float x0, float y0, float x1, float y1, float x2, float y2) {
   x = new float[3];
   y = new float[3];
   x[0] = x0;
   y[0] = y0;
   x[1] = x1;
   y[1] = y1;
   x[2] = x2;
   y[2] = y2;
   }
   */

  void display() {
    if (10 < 2) return;
    stroke(#cccccC);
    fill(128, 128, 0, 128);
    println(id);
    print("i " + corners[0].id);
    println(" x " + corners[0].x);
    //   VerletParticle2D v1 = cluster.nodes.get(corners[0].id);
    //  VerletParticle2D v2 = cluster.nodes.get(corners[1].id);
    //   VerletParticle2D v3 = cluster.nodes.get(corners[2].id);
    //  triangle(v1.x, v1.y, v2.x, v2.y, v3.x, v3.y);
    triangle(corners[0].x, corners[0].y, corners[1].x, corners[1].y, corners[2].x, corners[2].y);
    //  triangle(x[0], y[0], x[1], y[1], x[2], y[2]);
    //   println(n + ": " + round(x[0])  + " " + round(y[0]));
  }

  /*
  void shake() {
   float f = 12;
   float dd = f * random(1) - f/2;
   float ee = f * random(1) - f/2;
   x[0] += dd;
   y[0] += ee;
   x[1] += dd;
   y[1] += ee;
   x[2] += dd;
   y[2] += ee;
   }
   
   */

  String toString() {
    return "T " + id + ": " + corners[0] + " - " + corners[1] + " - " + corners[2] +  ".";
  }

  Tri[] split() {
    print("split ");
    print(corners[0] + " ");
    print(corners[1] + " ");
    println(corners[2] + " ");
    Tri t[] = new Tri[3];

    Node v1 = cluster.nodes.get(corners[0].id);
    Node v2 = cluster.nodes.get(corners[1].id);
    Node v3 = cluster.nodes.get(corners[2].id);

    print("split2 ");
    print(v1 + " ");
    print(v2 + " ");
    println(v3 + " ");

    float xneu = (v1.x + v2.x + v3.x) / 3;
    float yneu = (v1.y + v2.y + v3.y) / 3;

    Node centerNode = new Node(new Vec2D(xneu, yneu), nodeNr++);
    println("centerNode " + centerNode);
    cluster.addNode(centerNode);

    t[0] = new Tri(v1, v2, centerNode, 2);
    t[1] = new Tri(v2, v3, centerNode, 2);
    t[2] = new Tri(v1, v3, centerNode, 2);
    return t;
  }
}

