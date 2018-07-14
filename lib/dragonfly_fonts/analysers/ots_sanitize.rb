require 'open3'

module DragonflyFonts
  module Analysers
    class OtsSanitize
      def call(content)
        return unless OT_SANITISE_SUPPORTED_FORMATS.include?(content.ext)

        `#{ots_sanitize_command} #{content.path} 2>&1`
      end

      private

      def ots_sanitize_command
        'ots-sanitize'
      end
    end
  end
end
