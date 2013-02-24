// shamelessly stolen from 
//devdsp
// https://github.com/devdsp/Hershey-Fractal
//License
//Code is licenced GPLv2 (see LICENSE)
//Font is licenced as per the Hershey Fonts licence (see LICENSE.hershey)

String theword = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

Font f = new Font();
ArrayList buffer = new ArrayList();
int glen;
int counter = 0;

void setup(){
size(1000,600);
  BufferedReader reader;
  
  /*
  possible fonts astrology.jhf
cursive.jhf
cyrilc_1.jhf
cyrillic.jhf
futural.jhf
futuram.jhf
gothgbt.jhf
gothgrt.jhf
gothiceng.jhf
gothicger.jhf
gothicita.jhf
gothitt.jhf
greek.jhf
greekc.jhf* not working
greeks.jhf * notworking
japanese.jhf
markers.jhf
mathlow.jhf
mathupp.jhf
meteorology.jhf
music.jhf
rowmand.jhf
rowmans.1.jhf
rowmans.jhf
rowmant.jhf
scriptc.jhf
scripts.jhf *not working
symbolic.jhf
timesg.jhf
timesi.jhf
timesib.jhf
timesr.jhf
timesrb.jhf
  */
  byte font_data[] = loadBytes("rowmans.1.jhf");
  print(font_data[0]);
    for(int i=0; i < font_data.length;i++) {
      while(i < font_data.length && font_data[i] == '\n') {
        Glyph g = new Glyph(0,0);
        f.AddGlyph(g);  
        i++;
    } // end while i < font_data
    
        if( i < font_data.length -1 && font_data[i+1] != '\n' ) {

      byte minx = font_data[i++];
      byte maxx = font_data[i++];

      Glyph g = new Glyph(minx-'R',maxx-'R');
      f.AddGlyph(g);
      Line l = new Line();
      g.AddLine(l);

      while(font_data[i] != '\n') {
        byte x = font_data[i++];
        byte y = font_data[i++];
        if(x==' ' && y == 'R') {
          l = new Line();
          g.AddLine(l);
        } 
        else {
          x-='R';
          y-='R';
          l.AddPoint(new PVector(x,y));
        }
      }
    }
    } // end font_data loop i
    
    
    StringCharacterIterator it = new StringCharacterIterator(theword);
    PVector position = new PVector(HersheyLen(theword)/-2,0);
      for(char ch = it.first(); ch != CharacterIterator.DONE;ch = it.next()) {
    Renderable r = new Renderable();
    r.g = f.glyphs[ch-32];
    r.position = new PVector(position.x, position.y);
//    r.transform = new PMatrix2D();
    buffer.add(r);
    position.add(new PVector(f.glyphs[0].maxx-f.glyphs[0].minx,0));
  }
  

glen = f.glyphs.length;
frameRate(1);
}
void draw(){
//  smooth();
  background(0,0,0);
  stroke(255);
//    translate(width/2,height/2);
////  pending_buffer.clear();
//   for (int i = 0; i < buffer.size(); i++) {
//    Renderable r = (Renderable) buffer.get(i);
//    r.display();
//  }
  
  f.glyphs[counter].display(new PVector(width/2,height/2));
  counter++;
//  noLoop();

if(counter == glen-1) counter =0;
} // end of draw

int HersheyLen(String s) {
  StringCharacterIterator it = new StringCharacterIterator(s);
  int len=0;
  for(char ch = it.first();ch != CharacterIterator.DONE;ch = it.next()) {
    len += f.glyphs[ch-32].maxx - f.glyphs[ch-32].minx;
  } 
  return len;
}


