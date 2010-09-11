int N_ROXES = 256;
int MIN_ROT = 128;
int ROT_RANGE = 2556;
int MIN_SHADE = 32;
int MAX_SHADE = 126;
int MAX_WOBBLE = 64;
Roxor[] roxes;

void setup() {
  smooth();
  frameRate(30);
  size(1280 ,960);
  stroke(2.0);
  rectMode(CENTER);
  ellipseMode(CENTER);

  roxes = new Roxor[N_ROXES];
  for(int i=0;i<roxes.length;i++) {
    int x = (int)random(width);
    int y = (int)random(height);
    int w = (int)random(width/10);
    float rot = PI/(MIN_ROT + random(ROT_RANGE));
    roxes[i] = new Roxor(x,y,w,rot);
  }
}

void draw() {
  background(155);
  for(int i=0;i<roxes.length;i++) {
    roxes[i].update();
  }
}

class Roxor {
  int x,y;
  int w;
  float rot,rincr;
  float wobble;
  float shade;
  
  public Roxor(int x, int y, int w, float rincr) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.rot = PI-random(TWO_PI);
    this.rincr = rincr;
    this.rincr = (ceil(random(2))>1) ? this.rincr : 0-this.rincr;
    this.wobble = MAX_WOBBLE/2 - random(MAX_WOBBLE);
    this.shade = MIN_SHADE + random(MAX_SHADE - MIN_SHADE);
  } 
  
  public void update() {
    fill(this.shade);
    pushMatrix();
    translate(x,y);
    rotate(this.rot += this.rincr);
    rect(this.wobble,this.wobble,w,w);
    
    pushMatrix();
    scale(0.9);
    rotate(this.rot);
    noStroke();
    fill(this.shade+20,189);
    rect(this.wobble,this.wobble,w,w);
    stroke(2.0);
    popMatrix();
    
    popMatrix();
  }
}
