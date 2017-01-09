class Points {
  ArrayList<Point> pointList;
  Points(int numPoints) {
    pointList = new ArrayList<Point>();
    for (int i = 0; i < numPoints; i ++) {
      pointList.add(new Point(new PVector(random(0, width), random(0, height)), random(2,7), random(0.1,0.5)));
    }
  }

  void run() {
    for(Point p : pointList){
      p.run();
      p.follow(theField);
    }
  }
}