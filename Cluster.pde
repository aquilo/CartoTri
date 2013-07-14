// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Toxiclibs example: http://toxiclibs.org/

// Force directed graph
// Heavily based on: http://code.google.com/p/fidgen/

class Cluster {

  // A cluster is a grouping of nodes
  ArrayList<Node> nodes;

  float diameter;

  // We initialize a Cluster with a number of nodes, a diameter, and centerpoint
  Cluster(float d) {
    diameter = d;
    nodes = new ArrayList<Node>();
  }

  void addNodeX(Vec2D nn) {
  //  nodes.add(new Node(nn.add(Vec2D.randomVector())));
  }

  void addNode(Node node) {
    nodes.add(node);
  }

  void addSpringxx(Vec2D n1, Vec2D n2, float diameter, float ff) {
  // physics.addSpring(new VerletSpring2D(new Node(n1), new Node(n2), diameter, 0.01));
  }

  void addSpring(Node n1, Node n2, float diameter, float ff) {
    physics.addSpring(new VerletSpring2D(n1, n2, diameter, 0.01));
  }


void display() {
  // Show all the nodes
  for (Node n : nodes) {
    n.display();
  }
}


// Draw all the internal connections
void showConnections() {
  stroke(0, 150);
  strokeWeight(2);
  for (int i = 0; i < nodes.size()-1; i++) {
    VerletParticle2D pi = (VerletParticle2D) nodes.get(i);
    for (int j = i+1; j < nodes.size(); j++) {
      VerletParticle2D pj = (VerletParticle2D) nodes.get(j);

      line(pi.x, pi.y, pj.x, pj.y);
    }
  }
}
}
