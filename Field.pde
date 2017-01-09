public class Field{
  PVector[][] noiseField;
  
  int cols, rows;
  
  int resolution;
  
  float zOffset;
  float steps = 1;
  float zSteps = 0.005;
  
  public Field(int resolution){
    this.resolution = resolution;
    this.cols =  width/this.resolution;
    this.rows = height/this.resolution;
    noiseField = new PVector[cols][rows];
    initialise();
  }
  
  void initialise(){
    zOffset = 0;
    noiseSeed((int)random(10000));
    float xOffset = 0;
    
    for(int i = 0; i < cols; i++){
      float yOffset = 0;
      for(int j = 0; j < rows; j ++){
        float angle = map(noise(xOffset,yOffset),0,1,0,TWO_PI);
        noiseField[i][j] = new PVector(cos(angle),sin(angle));
        yOffset +=steps;
      }
      xOffset +=steps;
    }
  }
  
  void update(){
    float xOffset = 0;
    
    for(int i = 0; i < cols; i++){
      float yOffset = 0;
      for(int j = 0; j < rows; j ++){
        float angle = map(noise(xOffset,yOffset,zOffset),0,1,0,TWO_PI);
        noiseField[i][j] = PVector.fromAngle(angle);
        yOffset += steps;
      }
      xOffset += steps;
    }
    zOffset += zSteps;
  }
  
  void create(){
    pushStyle();
    pushMatrix();
    translate(resolution/2,resolution/2);
    stroke(255);
    for (int i = 0; i < cols; i ++){
      for (int j = 0; j < rows; j ++){
        //ellipseMode(CENTER);
        //ellipse(i*resolution,j*resolution,map(noiseField[i][j].heading(),-1,1,0,resolution),map(noiseField[i][j].heading(),-1,1,0,resolution));
        line(i*resolution, j*resolution,(i*resolution) + (noiseField[i][j].x * resolution/2),(j*resolution) + (noiseField[i][j].y * resolution/2));
      }
      //println();
    }
    popMatrix();
    popStyle();
  }
  
  void run(){
    update();
    //create();
  }
  
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return noiseField[column][row].get();
  }
}