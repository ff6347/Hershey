class Glyph {
  int minx,maxx;
  Line[] lines = new Line[0];

  Glyph(int _minx, int _maxx) {
    minx = _minx;
    maxx = _maxx;
  }
    void AddLine( Line l ) {
    lines = (Line[]) append(lines, l);
  }

  void display( PVector position) {
    for(int i=0;i<lines.length;++i) {
      lines[i].display(position);
    }
  }
}
