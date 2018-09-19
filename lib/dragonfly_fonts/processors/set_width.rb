module DragonflyFonts
  module Processors
    class SetWidth
      # relative:
      # when absent or 0 the vertical width will be set to width
      # when 1 then the vertical width will be incremented by the first
      # when 2 then the vertical width will be scaled by <first argument>/100.0.
      def call(content, width, relative = 1)
        raise UnsupportedFormat unless content.ext
        raise UnsupportedFormat unless FONT_FORGE_SUPPORTED_FORMATS.include?(content.ext.downcase)

        content.shell_update(ext: content.ext || 'ttf') do |old_path, new_path|
          "#{fontforge_command} -lang=ff -c 'Open($1); SelectWorthOutputting(); SetWidth(#{width},#{relative}); Generate($2);' #{old_path} #{new_path}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'adjwidth'
      end

      private

      def fontforge_command
        'fontforge'
      end
    end
  end
end
