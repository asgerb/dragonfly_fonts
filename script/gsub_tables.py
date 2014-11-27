#!/usr/bin/env python

import fontforge, json, sys

def main():
  for f in sys.argv[1:] :
    font = fontforge.open(f)
  
  gsub_tables = []

  for gsub in font.gsub_lookups:

    subtables = []
    for sub in font.getLookupSubtables(gsub):

      glyphs = []
      for g in font.glyphs():
        pos = g.getPosSub(sub)
        if pos:
          glyphs.append({
            'name': g.glyphname,
            'glyphclass': g.glyphclass,
            'script': g.script,
            'encoding': g.encoding,
            'unicode': g.unicode,
            'pos': pos
          })

      subtables.append({
        'name': sub,
        'glyphs': glyphs
      })

    gsub_tables.append({
      'name': gsub,
      'info': font.getLookupInfo(gsub),
      'subtables': subtables
    })

  print json.dumps(gsub_tables)

if __name__ == '__main__':
  main()