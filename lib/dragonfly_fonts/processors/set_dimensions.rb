module DragonflyFonts
  module Processors
    class SetDimensions
      def call(content, options = {})
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        options = options.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v } # stringify keys
        ascent = options.fetch('ascent', '')
        descent = options.fetch('descent', '')

        content.shell_update(ext: content.ext || 'ttf') do |old_path, new_path|
          "#{dimensions_script} #{old_path} #{new_path} #{Shellwords.escape(ascent)} #{Shellwords.escape(descent)}"
        end
      end

      def update_url(attrs, *args)
        attrs.style = 'adjdimensions'
      end

      private

      def dimensions_script
        DragonflyFonts::SCRIPT_DIR.join('dimensions.py')
      end
    end
  end
end
