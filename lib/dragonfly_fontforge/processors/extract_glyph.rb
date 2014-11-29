module DragonflyFontforge
  module Processors
    class ExtractGlyph

      def call font, glyph, ext=:svg
        font.shell_update(ext: ext) do |old_path, new_path|
          "fontforge -lang=ff -c 'Open($1); Select(\"#{glyph}\"); Export(\"#{new_path}\");' #{old_path}"
        end
      end

    end
  end
end