require 'json'

module DragonflyFonts
  module Analysers
    class Glyphs
      def call(content)
        # TODO: if woff2 then convert first
        return {} unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext)

        details = content.shell_eval do |path|
          "#{DragonflyFonts::SCRIPT_DIR.join('glyphs.py')} #{path}"
        end

        JSON.parse(details)
      end
    end
  end
end
