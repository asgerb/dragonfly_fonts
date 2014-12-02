require 'json'

module DragonflyFonts
  module Analysers
    class Bbox

      def call font, glyph
        res = font.shell_eval do |path|
          "fontforge -lang=ff -c 'Open($1); Select(\"#{glyph}\"); Print(GlyphInfo(\"BBox\"));' #{path}"
        end
        
        dimensions = JSON.parse(res)

        Struct::Bbox.new(
          glyph,
          
          dimensions[0],
          dimensions[1],
          dimensions[2],
          dimensions[3],

          (dimensions[2] - dimensions[0]),
          (dimensions[3] - dimensions[1])
        )
      end

    end

    Struct.new("Bbox", :glyph, :min_x, :min_y, :max_x, :max_y, :width, :height)
    
  end
end