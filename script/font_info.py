#!/usr/bin/env python

import fontforge, json, sys

def main():
  for f in sys.argv[1:] :
    font = fontforge.open(f)
      
  names = {}
  for n in font.sfnt_names :
    if n[0] == "English (US)" :
      names[n[1]] = n[2]

  font_info = {
    'file': font.path,
    'fontname': font.fontname,
    'fullname': font.fullname,
    'version': font.version,
    'weight': font.weight,
    'copyright': font.copyright,
    'license_url': names.get('License URL'),
    'license': names.get('License'),
    'designer_url': names.get('Designer URL'),
    'designer': names.get('Designer'),
    'vendor_url': names.get('Vendor URL'),
    'descriptor': names.get('Descriptor'),
    'trademark': names.get('Trademark'),
    'embedding_restrictions': font.os2_fstype,
    'fontlog': font.fontlog,
    'comment': font.comment,
    'sfnt_revision': font.sfntRevision,
    'woff_metadata': font.woffMetadata,
    'woff_revision': [font.woffMajor, font.woffMinor],
    'ascent': font.ascent,
    'descent': font.descent,
    'em': font.em
  }
  
  print json.dumps(font_info)

if __name__ == '__main__':
  main()