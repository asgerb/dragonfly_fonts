require 'json'

module DragonflyFonts
  module Analysers
    class GsubTables
      def call(font)
        details = font.shell_eval do |path|
          "#{DragonflyFonts::SCRIPT_DIR.join('gsub_tables.py')} #{path}"
        end
        JSON.parse(details)
      end
    end
  end
end
