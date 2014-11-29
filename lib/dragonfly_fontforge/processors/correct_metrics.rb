module DragonflyFontforge
  module Processors
    class CorrectMetrics

      def call font
        font.shell_update do |old_path, new_path|
          "fontforge -lang=ff -c 'Open($1); SetOS2Value(\"HHeadAscent\",$ascent); SetOS2Value(\"HHeadAscentIsOffset\",0); SetOS2Value(\"HHeadDescent\",-$descent); SetOS2Value(\"HHeadDescentIsOffset\",0); SetOS2Value(\"TypoLineGap\",0); Generate($2);' #{old_path} #{new_path}"
        end
      end

      def update_url attrs, *args
        attrs.style = 'corrmetr'
      end

    end
  end
end
