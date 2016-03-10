#!/usr/bin/env python

import fontforge, sys

__version__ = '0.1'

def main():
  font = fontforge.open(sys.argv[1])
  output_file_name = sys.argv[2]

  if sys.argv[3]:
    ascent = float(sys.argv[3])
    font.ascent += ascent
    font.hhea_ascent += ascent
    font.os2_typoascent += ascent
    font.os2_winascent += ascent

  if sys.argv[4]:
    descent = float(sys.argv[4])
    font.descent += descent
    font.hhea_descent += descent
    font.os2_typodescent += descent
    font.os2_windescent += descent

  font.generate(output_file_name)

if __name__ == '__main__':
  main()
