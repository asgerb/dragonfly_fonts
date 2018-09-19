require 'json'

module DragonflyFonts
  module Analysers
    class Bbox
      def call(content, glyph)
        return {} unless content.ext
        return {} unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        res = content.shell_eval do |path|
          "#{fontforge_command} -lang=ff -c 'Open($1); Select(\"#{glyph}\"); Print(GlyphInfo(\"BBox\"));' #{path}"
        end

        return {} unless res.present?

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

      private

      def fontforge_command
        'fontforge'
      end
    end

    Struct.new('Bbox', :glyph, :min_x, :min_y, :max_x, :max_y, :width, :height)
  end
end
