module DragonflyFontforge
  module Processors
    class ExtractGlyph

      def call font, glyph, opts={}
        format = opts[:format] || :svg

        font.shell_update(ext: format) do |old_path, new_path|
          "fontforge -lang=ff -c 'Open($1); Select(\"#{glyph}\"); Export(\"#{new_path}\");' #{old_path}"
        end
      end

    end
  end
end