require 'json'

module DragonflyFonts
  module Analysers
    class Glyphs
      def call(font)
        details = font.shell_eval do |path|
          "#{DragonflyFonts::SCRIPT_DIR.join('glyphs.py')} #{path}"
        end
        JSON.parse(details)
      end
    end
  end
end
