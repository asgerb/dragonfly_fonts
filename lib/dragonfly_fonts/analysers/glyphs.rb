require 'json'

module DragonflyFonts
  module Analysers
    class Glyphs
      def call(content)
        return [] unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext)

        # details = content.shell_eval do |path|
        #   "#{DragonflyFonts::SCRIPT_DIR.join('glyphs.py')} #{path}"
        # end

        command = "#{DragonflyFonts::SCRIPT_DIR.join('glyphs.py')} #{content.path}"
        details, stderr_str, status = Open3.capture3(command)

        return [] unless details.present?

        JSON.parse(details)
      end
    end
  end
end
