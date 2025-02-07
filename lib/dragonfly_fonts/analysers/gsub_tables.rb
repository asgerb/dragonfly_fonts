require 'json'

module DragonflyFonts
  module Analysers
    class GsubTables
      def call(content)
        return [] unless content.ext
        return [] unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        # details = content.shell_eval do |path|
        #   "#{DragonflyFonts::SCRIPT_DIR.join('gsub_tables.py')} #{path}"
        # end

        command = "fontforge -lang=py #{DragonflyFonts::SCRIPT_DIR.join('gsub_tables.py')} #{content.path}"
        details, stderr_str, status = Open3.capture3(command)

        return [] unless details.present?

        JSON.parse(details)
      end
    end
  end
end
