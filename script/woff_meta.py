#!/usr/bin/env python

import array, fontforge, json, sys

__version__ = '0.1'

def main():
  font = fontforge.open(sys.argv[1])
  output_file_name = sys.argv[2]
  licensee = sys.argv[3]

  names = {}
  for n in font.sfnt_names :
    if n[0] == "English (US)" :
      names[n[1]] = n[2]

  metadata = [
    '<?xml version="1.0" encoding="UTF-8"?>',
    '<metadata version="1.0">',
    '  <uniqueid id="?????????.{}.{}.{}"/>'.format(
        __version__, font.fontname, font.version),
    ]

  if names.get('Vendor URL'):
    metadata.extend([
      '  <vendor name="?????????" url="{}" />'.format(names.get('Vendor URL')),
      ])

  if names.get('Designer'):
    if names.get('Designer URL'):
      metadata.extend([
        '  <credits>',
        '    <credit name="{}" url="{}" role="Designer" />'.format(names.get('Designer'), names.get('Designer URL')),
        '  </credits>',
        ])

  if font.fontlog:
    metadata.extend([
      '  <description>',
      '    <text lang="en"><![CDATA[{}]]></text>'.format(font.fontlog),
      '  </description>',
    ])

  if names.get('License'):
    if names.get('License URL'):
      metadata.extend([
        '  <license url="{}">'.format(names.get('License URL')),
        '    <text xml:lang="en"><![CDATA[{}]]></text>'.format(names.get('License')),
        '  </license>',
        ])

  if font.copyright:
    metadata.extend([
      '  <copyright>',
      '    <text lang="en"><![CDATA[{}]]></text>'.format(font.copyright),
      '  </copyright>',
      ])

  if names.get('Trademark'):
    metadata.extend([
      '  <trademark>',
      '    <text lang="en"><![CDATA[{}]]></text>'.format(names.get('Trademark')),
      '  </trademark>',
      ])

  if licensee:
    metadata.extend([
      '  <licensee name="{}" />'.format(licensee),
      ])

  metadata.extend([
    '</metadata>',
    '',  # for trailing endline
  ])

  font.woffMetadata = '\n'.join(metadata)

  font.generate(output_file_name)

if __name__ == '__main__':
  main()