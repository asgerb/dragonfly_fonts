#!/usr/bin/env python

import json, sys
from fontforge import *

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
    'hhea_ascent': font.hhea_ascent,
    'hhea_ascent_add': font.hhea_ascent_add,
    'hhea_descent': font.hhea_descent,
    'hhea_descent_add': font.hhea_descent_add,
    'hhea_linegap': font.hhea_linegap,
    'license': names.get('License'),
    'license_url': names.get('License URL'),
    'os2_codepages': font.os2_codepages,
    'os2_family_class': font.os2_family_class,
    'os2_fstype': font.os2_fstype,
    'os2_panose': font.os2_panose,
    'os2_strikeypos': font.os2_strikeypos,
    'os2_strikeysize': font.os2_strikeysize,
    'os2_subxoff': font.os2_subxoff,
    'os2_subxsize': font.os2_subxsize,
    'os2_subyoff': font.os2_subyoff,
    'os2_subysize': font.os2_subysize,
    'os2_supxoff': font.os2_supxoff,
    'os2_supxsize': font.os2_supxsize,
    'os2_supyoff': font.os2_supyoff,
    'os2_supysize': font.os2_supysize,
    'os2_typoascent': font.os2_typoascent,
    'os2_typoascent_add': font.os2_typoascent_add,
    'os2_typodescent': font.os2_typodescent,
    'os2_typodescent_add': font.os2_typodescent_add,
    'os2_typolinegap': font.os2_typolinegap,
    'os2_unicoderanges': font.os2_unicoderanges,
    'os2_use_typo_metrics': font.os2_use_typo_metrics,
    'os2_vendor': font.os2_vendor,
    'os2_version': font.os2_version,
    'os2_weight': font.os2_weight,
    'os2_weight_width_slope_only': font.os2_weight_width_slope_only,
    'os2_width': font.os2_width,
    'os2_winascent': font.os2_winascent,
    'os2_winascent_add': font.os2_winascent_add,
    'os2_windescent': font.os2_windescent,
    'os2_windescent_add': font.os2_windescent_add,
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

  print(json.dumps(font_info))

if __name__ == '__main__':
  main()
