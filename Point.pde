public class Point {
  PVector pos;
  PVector vel;
  PVector acc;
  float mSpeed;
  float mForce;
  public Point(PVector pos, float mSpeed, float mForce) {
    this.pos = pos;
    this.mSpeed = mSpeed;
    this.mForce = mForce;

    acc = new PVector(0, 0);
    vel = new PVector(0, 0);
  }

  void create() {
    pushStyle();
    noFill();
    stroke(map(vel.mag(),-5,10,0,255),255,255);
    strokeWeight(5);
    point(pos.x, pos.y);
    popStyle(); 
  }

  void follow(Field flow) {
    PVector desDir = theField.lookup(pos);
    desDir.mult(mSpeed);
    PVector dir = PVector.sub(desDir, vel);
    dir.limit(mForce);
    applyF(dir);
  }

  void applyF(PVector vec) {
    acc.add(vec);
  }

  void update() {
    vel.add(acc);
    vel.limit(mSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void wrapAround(){
    if(pos.x > width+10){
      pos.x = -10;
    } else if (pos.x < -10){
      pos.x = width+10;
    }
    
    if(pos.y > height+10){
      pos.y = -10;
    } else if (pos.y < -10){
      pos.y = height+10;
    }
  }

  void run() {
    create();
    update();
    wrapAround();
  }
}