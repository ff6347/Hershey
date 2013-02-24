class Font {
  Glyph[] glyphs = new Glyph[0];
  void AddGlyph( Glyph g ) {
    glyphs = (Glyph[]) append(glyphs,g);
  }
}
