module DragonflyFonts
  module Processors
    class ExtractGlyph
      def call(content, glyph, options = {})
        # TODO: if other then convert first
        raise UnsupportedFormat unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext)

        options = options.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v } # stringify keys
        format = options.fetch('format', 'svg').to_s

        content.shell_update(ext: format) do |old_path, new_path|
          "#{fontforge_command} -lang=ff -c 'Open($1); Select($2); Export($3);' #{old_path} #{glyph} #{new_path}"
        end

        content.meta['format'] = format
        content.ext = format
      end

      def update_url(url_attributes, glyph, options = {})
        options = options.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v } # stringify keys
        format = options.fetch('format', 'svg').to_s

        url_attributes.ext = format
        url_attributes.glyph = glyph
      end

      private

      def fontforge_command
        'fontforge'
      end
    end
  end
end
