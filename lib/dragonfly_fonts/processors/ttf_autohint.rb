module DragonflyFonts
  module Processors
    class TtfAutohint
      def call(content)
        # TODO: if other then convert first
        raise UnsupportedFormat unless TTF_AUTOHINT_SUPPORTED_FORMATS.include?(content.ext)

        content.shell_update(ext: content.ext || 'ttf') do |old_path, new_path|
          "#{ttfautohint_command} --strong-stem-width='' --windows-compatibility --composites #{old_path} #{new_path}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'ttfautohint'
      end

      private

      def ttfautohint_command
        'ttfautohint'
      end
    end
  end
end
