// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Toxiclibs example: http://toxiclibs.org/

// Force directed graph
// Heavily based on: http://code.google.com/p/fidgen/

// Notice how we are using inheritance here!
// We could have just stored a reference to a VerletParticle object
// inside the Node class, but inheritance is a nice alternative

class Node extends VerletParticle2D {
  int id;

  Node(Vec2D pos, int id0) {
    super(pos);
    id = id0;
  }
  
  String toString() {
   return "N " + id + ": " + round(x) + "/" + round(y) + ".";
  }

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    fill(0,150);
    stroke(0);
    strokeWeight(2);
    ellipse(x,y,16,16);
  }
}


