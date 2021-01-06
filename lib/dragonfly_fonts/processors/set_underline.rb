require 'shellwords'

module DragonflyFonts
  module Processors
    class SetUnderline
      def call(content, options = {})
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        options = options.each_with_object({}) { |(k, v), memo| memo[k.to_s] = v } # stringify keys
        upos = options.fetch('upos', '')
        uwidth = options.fetch('uwidth', '')

        content.shell_update(ext: content.ext || 'ttf') do |old_path, new_path|
          "fontforge -lang=py #{underline_script} #{old_path} #{new_path} #{Shellwords.escape(upos)} #{Shellwords.escape(uwidth)}"
        end
      end

      def update_url(attrs, *args)
        attrs.style = 'adjunderline'
      end

      private

      def underline_script
        DragonflyFonts::SCRIPT_DIR.join('underline.py')
      end
    end
  end
end
