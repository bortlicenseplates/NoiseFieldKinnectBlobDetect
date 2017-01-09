class Blobs {
  ArrayList<Blob> blobs = new ArrayList<Blob>();
  int pixelNum;
  int[] pixel;
  int w, h;
  float lThresh = 0, hThresh = 44000;
  int skip = 400;

  Blobs(int w_, int h_) {
    w = w_;
    h = h_;
    pixelNum = kinect.getRawDepth().length;
    println(pixelNum);
  }

  void cycle() {
    for (int i = 0; i < pixelNum; i += skip) {
      float x = i%w, y = ((int)i/w);
      if (kinect.getRawDepth()[i] < hThresh && kinect.getRawDepth()[i] > lThresh){
        boolean found = false;
        for (Blob b : blobs){
          if (b.near(x,y)){
            found = true;
            b.add(x,y);
            
            b.create();
          }
        }
        if(!found) {
          blobs.add(new Blob(x,y,0,0));
        }
      }
    }
  }

 

  void run() {
    blobs.clear();
    cycle();
  }
}