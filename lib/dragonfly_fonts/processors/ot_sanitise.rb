module DragonflyFonts
  module Processors
    # The OpenType Sanitiser (OTS) parses and serialises OpenType files (OTF, TTF) and WOFF and WOFF2 font files, validating them and sanitising them as it goes.
    class OtSanitise
      def call(content, _opts = {})
        content.shell_update(ext: content.ext || :ttf) do |old_path, new_path|
          "#{ot_sanitise_command} #{old_path} #{new_path}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'ot_sanitise'
      end

      private # =============================================================

      def ot_sanitise_command
        'ots-sanitize'
      end
    end
  end
end
