module DragonflyFonts
  module Processors
    class OtsSanitize
      # The OpenType Sanitiser (OTS) parses and serialises OpenType files (OTF, TTF) and WOFF and WOFF2 font files, validating them and sanitising them as it goes.
      # TODO: if other then convert first
      def call(content, options = {})
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless OT_SANITISE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        content.shell_update(ext: content.ext || 'ttf') do |old_path, new_path|
          "#{ots_sanitize_command} #{old_path} #{new_path}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'ots-sanitize'
      end

      private

      def ots_sanitize_command
        'ots-sanitize'
      end
    end
  end
end
