module DragonflyFonts
  module Processors
    class CorrectMetrics
      def call(font)
        font.shell_update(ext: font.ext || :ttf) do |old_path, new_path|
          "#{fontforge_command} -lang=ff -c 'Open($1); SetOS2Value(\"HHeadAscent\",$ascent); SetOS2Value(\"HHeadAscentIsOffset\",0); SetOS2Value(\"HHeadDescent\",-$descent); SetOS2Value(\"HHeadDescentIsOffset\",0); SetOS2Value(\"TypoLineGap\",0); Generate($2);' #{old_path} #{new_path}"
        end
      end

      def update_url(attrs, *_args)
        attrs.style = 'corrmetr'
      end

      private # =============================================================

      def fontforge_command
        'fontforge'
      end
    end
  end
end
