#!/usr/bin/env python

import array, fontforge, json, sys

def main():
  for f in sys.argv[1:] :
    font = fontforge.open(f)

  glyphs = []

  for (i,g) in enumerate(font.glyphs()):
    glyphs.append({
      'n': g.glyphname,
      'c': g.glyphclass,
      's': g.script,
      'e': g.encoding,
      'u': g.unicode,
      'w': g.width
    })

  print json.dumps(glyphs)

if __name__ == '__main__':
  main()
