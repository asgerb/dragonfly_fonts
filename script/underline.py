#!/usr/bin/env python

import fontforge, sys

__version__ = '0.1'

def main():
  font = fontforge.open(sys.argv[1])
  output_file_name = sys.argv[2]

  if sys.argv[3]:
    font.upos = float(sys.argv[3])

  if sys.argv[4]:
    font.uwidth = float(sys.argv[4])

  font.generate(output_file_name)

if __name__ == '__main__':
  main()