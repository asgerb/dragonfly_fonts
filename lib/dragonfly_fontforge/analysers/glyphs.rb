require 'json'

module DragonflyFontforge
  module Analysers
    class Glyphs

      def call font
        details = font.shell_eval do |path|
          "#{DragonflyFontforge::SCRIPT_DIR.join('glyphs.py')} #{path}"
        end
        JSON.parse(details)
      end

    end
  end
end
