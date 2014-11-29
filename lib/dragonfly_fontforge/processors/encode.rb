module DragonflyFontforge
  module Processors
    class Encode

      class UnsupportedFormat < RuntimeError; end

      def call font, format
        raise UnsupportedFormat unless %w(otf svg ttf woff).include?(format.to_s)

        font.shell_update(ext: format) do |old_path, new_path|
          "fontforge -lang=ff -c 'Open($1); Generate($2)' #{old_path} #{new_path}"
        end
      end

      def update_url attrs, format, args=""
        attrs.ext = format.to_s
      end

    end
  end
end
