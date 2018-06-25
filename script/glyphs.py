#!/usr/bin/env python

import array, fontforge, json, sys

def main():
  for f in sys.argv[1:] :
    font = fontforge.open(f)

  glyphs = []

  for (i,g) in enumerate(font.glyphs()):
    glyphs.append({
      'altuni': g.altuni,
      'glyphname': g.glyphname,
      'glyphclass': g.glyphclass,
      'script': g.script,
      'encoding': g.encoding,
      'unicode': g.unicode,
      'width': g.width
    })

  print json.dumps(glyphs)

if __name__ == '__main__':
  main()
