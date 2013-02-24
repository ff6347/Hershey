
class Line {
  PVector[] points = new PVector[0];

  void AddPoint( PVector p ) {
    points = (PVector[]) append(points,p);
  }

void display(PVector position){
     if(points.length < 2 ) {
      return;
    }
    
    strokeWeight(1);
    stroke(255);
    PVector from = points[0];
    from.add(position);
    for(int i=1;i<points.length;++i) {
      PVector to = points[i];
      to.add(position);
      line(from.x,from.y,to.x,to.y);
      from = to;

    }

  }
}
