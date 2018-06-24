require 'json'

module DragonflyFonts
  module Analysers
    class Glyphs
      def call(content)
        return [] unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext)

        details = content.shell_eval do |path|
          "#{DragonflyFonts::SCRIPT_DIR.join('glyphs.py')} #{path}"
        end

        JSON.parse(details).map do |item|
          item["glyphname"] = item.delete("n")
          item["glyphclass"] = item.delete("c")
          item["script"] = item.delete("s")
          item["encoding"] = item.delete("e")
          item["unicode"] = item.delete("u")
          item["width"] = item.delete("w")
          item
        end
      end
    end
  end
end
