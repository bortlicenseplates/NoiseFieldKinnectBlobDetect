class Kinector {
  private int skip;
  int threshold;
  private int w, h;
  int[] depthPixels;

  Kinector(int kw, int kh, int kSkip) {
    skip = kSkip;
    w = kw;
    h = kh;
    threshold = 1;
  }



  //void firstPixelDetect() {
  //  depthPixels = kinect.getRawDepth();
  //  for (int i = 0; i < w; i ++) {
  //    for (int j = 0; j < h-1; j ++) {
  //      if ((depthPixels[(i) + (j*w)]) < threshold) {
  //        shapeDetect(i, j);
  //        break;
  //      }
  //    }
  //  }
  //}

  //void shapeDetect(int x, int y) {
  //  if        (kinect.getRawDepth()[(x+1)+(y*w)] < threshold) {
  //    shapeDetect(x+1, y);
  //  } else if (kinect.getRawDepth()[(x)+((y+1)*w)] < threshold) {
  //    shapeDetect(x, y+1);
  //  } else if (kinect.getRawDepth()[(x)+((y-1)*w)] < threshold) {
  //    shapeDetect(x, y-1);
  //  } else if (kinect.getRawDepth()[(x-1)+(y*w)] < threshold) {
  //    shapeDetect(x-1, y);
  //  }
  //}

}