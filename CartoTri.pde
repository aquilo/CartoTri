import toxi.processing.*;
import toxi.geom.*;
import toxi.physics2d.*;

color bg = #0A0A0A;
int a = 55;
int h = round(a * sqrt(3) / 2.0);
boolean shift = true;
float dx;
float y0 = 40;
Node node[][];
Tri tri[];
//Tri0 t[];
int n = 0;
int cols = 15;
int rows = 12;
int nrNode = 0;
int nrTri = 0;
// Reference to physics world
VerletPhysics2D physics;

// A list of cluster objects
Cluster cluster;

// Boolean that indicates whether we draw connections or not
boolean showPhysics = false;
boolean showParticles = true;



void setup() {
  size(900, 600);
  background(255);
  smooth();

  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(10, 10, width-20, height-20));
  cluster = new Cluster(8);

  node = new Node[rows][cols];
  tri = new Tri[100 * 3 * rows * cols];

  for (int j = 0; j < rows; j++) {
    shift = !shift;
    if (shift) {
      dx = a / 2;
    } 
    else {
      dx = 0;
    }
    float x0 = a + dx;
    float y = y0 + j * h;
    for (int i = 0; i < cols; i++) {
      float x = x0 + i * a;
      node[j][i] = new Node(new Vec2D(x, y));
      cluster.addNode(node[j][i]);
      node[j][i].display();
    }
  }
  println("# of nodes: " + nrNode);
  n = 0;

  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols-1; i++) {
      if (j > 0) {
        if (j % 2 == 1) {
          tri[n++] = new Tri(node[j][i], node[j-1][i+1], node[j][i+1]);
        } 
        else {
          tri[n++] = new Tri(node[j][i], node[j-1][i], node[j][i+1]);
        }
      }

      if (j < rows -1) {
        if (j % 2 == 1) {
          tri[n++] = new Tri(node[j][i], node[j+1][i+1], node[j][i+1]);
        } 
        else {
          tri[n++] = new Tri(node[j][i], node[j+1][i], node[j][i+1]);
        }
      }
    }
  }
  println("# of tris: " + n);
}

void draw() {
  physics.update();
  background(255); 

  // Display all points
  if (showParticles) {
    cluster.display();
  }

  // If we want to see the physics
  if (showPhysics) {
    cluster.showConnections();
  }

  for (int i = 0; i < n; i++) {
     tri[i].display();
  }
  for (int i = 0; i < n; i++) {
    // tri[i].shake();
  }
  int k = int(random(n));

  Tri t[] = tri[k].split();
  tri[k] = t[0];
  tri[n++] = t[1];
  tri[n++] = t[2];

  noLoop();
}


void mousePressed() {
  redraw();
}

// Key press commands
void keyPressed() {
  if (key == 'c') {
    showPhysics = !showPhysics;
    if (!showPhysics) showParticles = true;
  } 
  else if (key == 'p') {
    showParticles = !showParticles;
    if (!showParticles) showPhysics = true;
  } 
  else if (key == 'n') {
    physics.clear();
    //    cluster = new Cluster(int(random(2, 20)), random(10, width/2), new Vec2D(width/2, height/2));
  }
}

