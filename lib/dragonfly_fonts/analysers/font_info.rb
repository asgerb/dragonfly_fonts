require 'json'

module DragonflyFonts
  module Analysers
    class FontInfo

      # see http://dmtr.org/ff.php#Font
      def call font
        details = font.shell_eval do |path|
          "#{DragonflyFonts::SCRIPT_DIR.join('font_info.py')} #{path}"
        end
        JSON.parse(details)
      end

    end
  end
end