module DragonflyFonts
  module Processors
    class ExtractGlyph
      def call(font, glyph, opts = {})
        format = opts.fetch(:format, :svg)

        font.shell_update(ext: format) do |old_path, new_path|
          "#{fontforge_command} -lang=ff -c 'Open($1); Select(\"#{glyph}\"); Export(\"#{new_path}\");' #{old_path}"
        end

      def update_url(url_attributes, glyph, opts = {})
        format = opts.fetch(:format, :svg)

        url_attributes.ext = format.to_s
        url_attributes.glyph = glyph
      end

      private # =============================================================

      def fontforge_command
        'fontforge'
      end
    end
  end
end
