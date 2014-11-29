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
    'ascent': font.ascent,
    'cap_height': font.capHeight,
    'comment': font.comment,
    'copyright': font.copyright,
    'default_base_filename': font.default_base_filename,
    'descent': font.descent,
    'descriptor': names.get('Descriptor'),
    'designer': names.get('Designer'),
    'designer_url': names.get('Designer URL'),
    'em': font.em,
    'embedding_restrictions': font.os2_fstype,
    'encoding': font.encoding,
    'familyname': font.familyname,
    'fontlog': font.fontlog,
    'fontname': font.fontname,
    'fullname': font.fullname,
    'license': names.get('License'),
    'license_url': names.get('License URL'),
    'path': font.path,
    'sfnt_revision': font.sfntRevision,
    'trademark': names.get('Trademark'),
    'upos': font.upos,
    'uwidth': font.uwidth,
    'vendor_url': names.get('Vendor URL'),
    'version': font.version,
    'weight': font.weight,
    'woff_metadata': font.woffMetadata,
    'woff_revision': [font.woffMajor, font.woffMinor],
    'x_height': font.xHeight
  }
  
  print json.dumps(font_info)

if __name__ == '__main__':
  main()