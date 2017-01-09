class Blob{
  float minx, miny, maxx, maxy;
  ArrayList<Integer> px;
  float dThresh;
  
  Blob(float x, float y, float w, float h){
    minx = x;
    miny = y;
    maxx = w;
    maxy = h;
  }
  void create(){
    rectMode(CORNERS);
    strokeWeight(1);
    stroke(0,255,255);
    noFill();
    rect(minx, miny, maxx, maxy);
  }
  
  void add(float x, float y){
    minx = min(minx, x);
    miny = min(miny, y);
    maxx = max(maxx, x);
    maxy = max(maxy, y);
  }
  
  boolean near(float x, float y){
    
    float cx = (minx + maxx) /2;
    float cy = (miny + maxy) /2;
    
    if(dist(cx,cy,x,y) < dThresh){
      return true;
    }
    return false;
  }
  
  
}