require 'json'

module DragonflyFonts
  module Analysers
    class FontInfo
      # see http://dmtr.org/ff.php#Font
      def call(content)
        return {} unless content.ext
        return {} unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        details = content.shell_eval do |path|
          "#{DragonflyFonts::SCRIPT_DIR.join('font_info.py')} #{path}"
        end

        return [] unless details.present?

        JSON.parse(details)
      end
    end
  end
end
